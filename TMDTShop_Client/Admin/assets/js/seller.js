// API base URL
const API_BASE = 'https://localhost:5191/api';

// Global variables
let editingCategoryId = null;
let editingProductId = null;

// Utility functions
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
    return null;
}

// Add error handling utility
async function handleApiResponse(response, errorMessage) {
    if (!response.ok) {
        if (response.status === 404) {
            throw new Error('API endpoint không tồn tại. Vui lòng kiểm tra lại URL.');
        }
        if (response.status === 401) {
            window.location.href = '../../Customer/Templates/login.html';
            throw new Error('Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.');
        }
        const contentType = response.headers.get("content-type");
        if (contentType && contentType.indexOf("application/json") !== -1) {
            const error = await response.json();
            throw new Error(error.message || errorMessage);
        }
        throw new Error(`${errorMessage} (${response.status})`);
    }
    return response.json();
}

function formatCurrency(amount) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(amount);
}

function checkAuth() {
    const token = getCookie('token');
    if (!token) {
        alert('Vui lòng đăng nhập để tiếp tục');
        window.location.href = '../../Customer/Templates/login.html';
        return false;
    }
    return true;
}

// Shop management functions
async function loadShopInfo() {
    try {
        const response = await fetch(`${API_BASE}/seller/shop/current`, {
            headers: {
                'Authorization': `Bearer ${getCookie('token')}`
            }
        });
        const data = await handleApiResponse(response, 'Không thể tải thông tin cửa hàng');

        // Update UI only if we have valid data
        if (data && typeof data === 'object') {
            const elements = {
                'shopName': data.shopName,
                'shopDescription': data.description,
                'shopLogo': data.logo,
                'shopStatus': `Trạng thái: ${data.status}`,
                'shopRating': data.rating?.toFixed(1) || '0.0',
                'reviewCount': `${data.reviewCount || 0} đánh giá`,
                'totalRevenue': `${(data.totalRevenue || 0).toLocaleString()}đ`,
                'totalSales': `${data.totalSales || 0} sản phẩm đã bán`
            };

            // Update each element if it exists
            Object.entries(elements).forEach(([id, value]) => {
                const element = document.getElementById(id);
                if (element) {
                    if (id === 'shopLogo') {
                        element.src = value || 'assets/images/default-shop-logo.png';
                    } else {
                        element.textContent = value;
                    }
                }
            });

            // Update lists if data exists
            if (Array.isArray(data.categories)) {
                updateCategoryList(data.categories);
            }
            if (Array.isArray(data.products)) {
                updateProductList(data.products);
            }
        }
    } catch (error) {
        console.error('Error:', error);
        alert(error.message || 'Có lỗi xảy ra khi tải thông tin cửa hàng!');
    }
}

function updateCategoryList(categories) {
    const categoryList = document.getElementById('categoryList');
    if (!categoryList) return;
    categoryList.innerHTML = categories.map(category => `
        <div class="bg-gray-50 p-4 rounded-lg">
            <h3 class="font-semibold">${category.categoryName}</h3>
            <p class="text-sm text-gray-500 mt-1">${category.description}</p>
            <p class="text-sm text-gray-500 mt-2">Số sản phẩm: ${category.productCount}</p>
        </div>
    `).join('');
}

function updateProductList(products) {
    const productList = document.getElementById('productList');
    if (!productList) return;
    productList.innerHTML = products.map(product => `
        <div class="bg-white border rounded-lg overflow-hidden">
            <img src="${product.images.split(',')[0]}" alt="${product.productName}" 
                class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="font-semibold">${product.productName}</h3>
                <p class="text-gray-500 text-sm mt-1">${product.description}</p>
                <div class="mt-4">
                    <span class="text-lg font-bold">${product.price.toLocaleString()}đ</span>
                    <p class="text-sm text-gray-500 mt-1">Đã bán: ${product.soldCount}</p>
                </div>
            </div>
        </div>
    `).join('');
}

// Initialize page
document.addEventListener('DOMContentLoaded', function() {
    if (!checkAuth()) return;

    // Initialize the page
    const defaultSection = document.querySelector('[data-section="dashboard"]');
    if (defaultSection) {
        defaultSection.click();
    }

    // Load thông tin cửa hàng khi trang được tải
    loadShopInfo();

    // Setup event listeners
    setupEventListeners();
});

// Setup all event listeners
function setupEventListeners() {
    // Toggle sidebar
    const toggleSidebarBtn = document.getElementById('toggleSidebar');
    if (toggleSidebarBtn) {
        toggleSidebarBtn.addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');

            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');

            if (sidebar.classList.contains('collapsed')) {
                this.innerHTML = '<i class="fas fa-chevron-right"></i><span class="sidebar-text">Mở rộng</span>';
            } else {
                this.innerHTML = '<i class="fas fa-chevron-left"></i><span class="sidebar-text">Thu gọn</span>';
            }
        });
    }

    // Mobile menu toggle
    const mobileMenuBtn = document.getElementById('mobileMenuButton');
    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('hidden');
        });
    }

    // Section navigation
    const navItems = document.querySelectorAll('.nav-item');
    const sections = document.querySelectorAll('.section');
    const pageTitle = document.getElementById('pageTitle');

    navItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const targetSection = this.getAttribute('data-section');
            
            // Cập nhật active state cho nav items
            navItems.forEach(nav => nav.classList.remove('bg-blue-50', 'text-blue-600'));
            navItems.forEach(nav => nav.classList.add('text-gray-600', 'hover:bg-gray-100'));
            this.classList.remove('text-gray-600', 'hover:bg-gray-100');
            this.classList.add('bg-blue-50', 'text-blue-600');

            // Hiển thị section tương ứng
            sections.forEach(section => {
                section.classList.remove('active');
                if (section.id === `${targetSection}-section`) {
                    section.classList.add('active');
                    // Cập nhật tiêu đề trang
                    pageTitle.textContent = this.querySelector('.sidebar-text').textContent;
                }
            });

            // Load categories if navigating to categories section
            if (targetSection === 'categories') {
                loadCategories();
            }
        });
    });

    // Shop management event listeners
    setupShopManagementListeners();
}

// Setup shop management related event listeners
function setupShopManagementListeners() {
    const editShopBtn = document.getElementById('edit-shop-btn');
    const editShopModal = document.getElementById('edit-shop-modal');
    const closeShopModal = document.getElementById('close-shop-modal');
    const cancelShopBtn = document.getElementById('cancel-shop-btn');
    const editShopForm = document.getElementById('edit-shop-form');
    const logoInput = document.getElementById('logoInput');
    const bannerInput = document.getElementById('bannerInput');

    if (editShopBtn) {
        editShopBtn.addEventListener('click', async () => {
            try {
                const response = await fetch('/api/seller/shop/current');
                const data = await response.json();

                if (response.ok) {
                    populateShopForm(data);
                    editShopModal.classList.remove('hidden');
                } else {
                    alert('Có lỗi xảy ra khi tải thông tin cửa hàng!');
                }
            } catch (error) {
                console.error('Error:', error);
                alert('Có lỗi xảy ra khi tải thông tin cửa hàng!');
            }
        });
    }

    if (closeShopModal) {
        closeShopModal.addEventListener('click', () => closeModal(editShopModal));
    }

    if (cancelShopBtn) {
        cancelShopBtn.addEventListener('click', () => closeModal(editShopModal));
    }

    if (logoInput) {
        logoInput.addEventListener('change', function() {
            previewImage(this, 'logoPreview', 'currentLogo', 'logoPlaceholder');
        });
    }

    if (bannerInput) {
        bannerInput.addEventListener('change', function() {
            previewImage(this, 'bannerPreview', 'currentBanner', 'bannerPlaceholder');
        });
    }

    if (editShopForm) {
        editShopForm.addEventListener('submit', handleShopFormSubmit);
    }
}

// Helper functions for shop management
function closeModal(modal) {
    if (!modal) return;
    modal.classList.add('hidden');
    const form = modal.querySelector('form');
    if (form) form.reset();
    resetImagePreviews();
}

function resetImagePreviews() {
    ['logo', 'banner'].forEach(type => {
        const preview = document.getElementById(`${type}Preview`);
        const current = document.getElementById(`current${type.charAt(0).toUpperCase() + type.slice(1)}`);
        const placeholder = document.getElementById(`${type}Placeholder`);
        
        if (preview) preview.classList.add('hidden');
        if (current) current.classList.remove('hidden');
        if (placeholder) placeholder.classList.remove('hidden');
    });
}

function previewImage(input, previewId, currentId, placeholderId) {
    const file = input.files[0];
    if (!file) return;

    const maxSize = input.name === 'logo' ? 2 : 5;
    if (file.size > maxSize * 1024 * 1024) {
        alert(`Kích thước file không được vượt quá ${maxSize}MB`);
        input.value = '';
        return;
    }

    const reader = new FileReader();
    reader.onload = function(e) {
        const preview = document.getElementById(previewId);
        const current = document.getElementById(currentId);
        const placeholder = document.getElementById(placeholderId);

        if (preview) {
            preview.querySelector('img').src = e.target.result;
            preview.classList.remove('hidden');
        }
        if (current) current.classList.add('hidden');
        if (placeholder) placeholder.classList.add('hidden');
    };
    reader.readAsDataURL(file);
}

async function handleShopFormSubmit(e) {
    e.preventDefault();
    const formData = new FormData(e.target);

    try {
        const response = await fetch('/api/seller/shop/current', {
            method: 'PUT',
            body: formData
        });

        if (response.ok) {
            const result = await response.json();
            alert('Cập nhật thông tin thành công!');
            closeModal(document.getElementById('edit-shop-modal'));
            loadShopInfo();
        } else {
            const error = await response.json();
            alert(error.message || 'Có lỗi xảy ra khi cập nhật thông tin!');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Có lỗi xảy ra khi cập nhật thông tin!');
    }
}

function populateShopForm(data) {
    const form = document.getElementById('edit-shop-form');
    if (!form) return;

    form.querySelector('[name="shopName"]').value = data.shopName || '';
    form.querySelector('[name="description"]').value = data.description || '';
    form.querySelector('[name="status"]').value = data.status || '';
    form.querySelector('[name="contactEmail"]').value = data.contactEmail || '';
    form.querySelector('[name="phoneNumber"]').value = data.phoneNumber || '';
    form.querySelector('[name="address"]').value = data.address || '';

    updateShopImages(data);
}

function updateShopImages(data) {
    const currentLogo = document.getElementById('currentLogo');
    const currentBanner = document.getElementById('currentBanner');
    const logoPlaceholder = document.getElementById('logoPlaceholder');
    const bannerPlaceholder = document.getElementById('bannerPlaceholder');

    if (data.logo && currentLogo && logoPlaceholder) {
        currentLogo.src = data.logo;
        currentLogo.classList.remove('hidden');
        logoPlaceholder.classList.add('hidden');
    }

    if (data.banner && currentBanner && bannerPlaceholder) {
        currentBanner.src = data.banner;
        currentBanner.classList.remove('hidden');
        bannerPlaceholder.classList.add('hidden');
    }
}

// Add loadCategories function
async function loadCategories() {
    try {
        const response = await fetch(`${API_BASE}/seller/categories`, {
            headers: {
                'Authorization': `Bearer ${getCookie('token')}`
            }
        });
        const data = await handleApiResponse(response, 'Không thể tải danh sách danh mục');
        
        const categoryList = document.getElementById('categoryList');
        if (!categoryList) return;

        if (Array.isArray(data)) {
            categoryList.innerHTML = data.map(category => `
                <div class="bg-white shadow rounded-lg p-4 mb-4">
                    <div class="flex justify-between items-center">
                        <h3 class="text-lg font-semibold">${category.categoryName}</h3>
                        <div class="space-x-2">
                            <button onclick="editCategory(${category.id})" 
                                class="text-blue-600 hover:text-blue-800">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button onclick="deleteCategory(${category.id})" 
                                class="text-red-600 hover:text-red-800">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                    <p class="text-gray-600 mt-2">${category.description}</p>
                    <div class="mt-2 text-sm text-gray-500">
                        Số sản phẩm: ${category.productCount || 0}
                    </div>
                </div>
            `).join('');
        } else {
            categoryList.innerHTML = '<p class="text-center text-gray-500">Không có danh mục nào.</p>';
        }
    } catch (error) {
        console.error('Error:', error);
        alert(error.message || 'Có lỗi xảy ra khi tải danh sách danh mục!');
    }
}

// Export functions for use in other modules
window.loadShopInfo = loadShopInfo;
window.updateCategoryList = updateCategoryList;
window.updateProductList = updateProductList;
window.getCookie = getCookie;
window.formatCurrency = formatCurrency;
window.removeImage = function(type) {
    const input = document.getElementById(`${type}Input`);
    const preview = document.getElementById(`${type}Preview`);
    const current = document.getElementById(`current${type.charAt(0).toUpperCase() + type.slice(1)}`);
    const placeholder = document.getElementById(`${type}Placeholder`);

    if (input) input.value = '';
    if (preview) preview.classList.add('hidden');
    if (current) current.classList.remove('hidden');
    if (placeholder) placeholder.classList.remove('hidden');
};