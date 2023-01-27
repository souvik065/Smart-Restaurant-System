
const btn = document.querySelector('.mobile-menu-button');
const sidebar = document.querySelector('.side-navbar');


btn.addEventListener('click', () => {
    sidebar.classList.toggle('lg:translate-x-0');


})