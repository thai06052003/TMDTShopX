async function loadComponent(id, file) {
    const res = await fetch(file);
    const text = await res.text();
    document.getElementById(id).innerHTML = text;
}

loadComponent('sidebar', '../../components/sidebar.html');
loadComponent('header', '../../components/header.html');
loadComponent('footer', '../../components/footer.html');