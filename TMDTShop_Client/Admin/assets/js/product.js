const API_BASE = 'https://localhost:5191/api';
let currentPage = 1;
const pageSize = 10;

async function loadProducts(page = 1, searchTerm = '') {
    try {
        const response = await fetch(`${API_BASE}/seller/products?page=${page}&pageSize=${pageSize}&search=${searchTerm}`, {
            headers: {
                'Authorization': `Bearer ${getCookie('token')}`
            }
        });
        if (!response.ok) throw new Error('Failed to load products');
        const data = await response.json();
        
        renderProducts(data.items);
        renderPagination(data.totalPages, page);
    } catch (error) {
        console.error('Error:', error);
        showError('Có lỗi xảy ra khi tải danh sách sản phẩm');
    }
}

function renderProducts(products) {
    const tbody = document.getElementById('productTableBody');
    tbody.innerHTML = '';
    products.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td class="py-3 px-4 border-b">${product.productID}</td>
            <td class="py-3 px-4 border-b">${product.productName}</td>
            <td class="py-3 px-4 border-b">
                <img src="${product.images.split(',')[0]}" alt="${product.productName}" 
                     class="w-10 h-10 object-cover rounded">
            </td>
            <td class="py-3 px-4 border-b">${product.price.toLocaleString()}đ</td>
            <td class="py-3 px-4 border-b">${product.category.categoryName}</td>
            <td class="py-3 px-4 border-b">${product.stockQuantity}</td>
            <td class="py-3 px-4 border-b space-x-2">
                <button class="bg-yellow-500 text-white px-3 py-1 rounded hover:bg-yellow-600 transition duration-200 edit-btn" 
                        data-id="${product.productID}">
                    <i class="fas fa-edit mr-1"></i> Sửa
                </button>
                <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 transition duration-200 delete-btn" 
                        data-id="${product.productID}">
                    <i class="fas fa-trash-alt mr-1"></i> Xóa
                </button>
            </td>
        `;
        tbody.appendChild(row);
    });
}

function renderPagination(totalPages, currentPage) {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';
    
    for (let i = 1; i <= totalPages; i++) {
        const button = document.createElement('button');
        button.className = `px-3 py-1 mx-1 rounded ${i === currentPage ? 'bg-blue-500 text-white' : 'bg-gray-200'}`;
        button.textContent = i;
        button.onclick = () => loadProducts(i);
        pagination.appendChild(button);
    }
}

async function deleteProduct(id) {
    try {
        const response = await fetch(`${API_BASE}/seller/products/${id}`, {
            method: 'DELETE',
            headers: {
                'Authorization': `Bearer ${getCookie('token')}`
            }
        });
        if (!response.ok) throw new Error('Failed to delete product');
        loadProducts(currentPage);
        showSuccess('Xóa sản phẩm thành công');
    } catch (error) {
        console.error('Error:', error);
        showError('Có lỗi xảy ra khi xóa sản phẩm');
    }
}

function showProductModal(product = null) {
    const modal = document.getElementById('productModal');
    const form = document.getElementById('productForm');
    modal.classList.remove('hidden');
    
    if (product) {
        form.elements['productName'].value = product.productName;
        form.elements['price'].value = product.price;
        form.elements['stockQuantity'].value = product.stockQuantity;
        form.elements['description'].value = product.description;
        form.elements['categoryID'].value = product.categoryID;
    } else {
        form.reset();
    }
}

async function handleProductSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    const productId = form.dataset.productId;
    
    try {
        const url = productId 
            ? `${API_BASE}/seller/products/${productId}`
            : `${API_BASE}/seller/products`;
            
        const response = await fetch(url, {
            method: productId ? 'PUT' : 'POST',
            headers: {
                'Authorization': `Bearer ${getCookie('token')}`
            },
            body: formData
        });
        
        if (!response.ok) throw new Error('Failed to save product');
        
        document.getElementById('productModal').classList.add('hidden');
        loadProducts(currentPage);
        showSuccess(`${productId ? 'Cập nhật' : 'Thêm'} sản phẩm thành công`);
    } catch (error) {
        console.error('Error:', error);
        showError(`Có lỗi xảy ra khi ${productId ? 'cập nhật' : 'thêm'} sản phẩm`);
    }
}

// Event Listeners
document.getElementById('addProductBtn').addEventListener('click', () => showProductModal());

document.getElementById('productForm').addEventListener('submit', handleProductSubmit);

document.getElementById('searchInput').addEventListener('input', debounce((e) => {
    loadProducts(1, e.target.value);
}, 300));

document.addEventListener('click', (e) => {
    if (e.target.classList.contains('edit-btn')) {
        const id = e.target.getAttribute('data-id');
        fetch(`${API_BASE}/seller/products/${id}`, {
            headers: {
                'Authorization': `Bearer ${getCookie('token')}`
            }
        })
        .then(response => response.json())
        .then(product => showProductModal(product))
        .catch(error => showError('Có lỗi xảy ra khi tải thông tin sản phẩm'));
    }
    if (e.target.classList.contains('delete-btn')) {
        const id = e.target.getAttribute('data-id');
        if (confirm('Bạn có chắc muốn xóa sản phẩm này?')) {
            deleteProduct(id);
        }
    }
});

// Utility functions
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
    return null;
}

function showError(message) {
    // Implement your error notification here
    alert(message);
}

function showSuccess(message) {
    // Implement your success notification here
    alert(message);
}

function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Initialize
document.addEventListener('DOMContentLoaded', () => loadProducts());

  