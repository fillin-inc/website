import jquery from 'jquery';
import slick from 'slick-carousel';

const $ = jquery;
const navList = document.getElementById('nav-list');
const hamburgerMenu = document.getElementById('burger');

hamburgerMenu.addEventListener('click', function (event) {
    event.preventDefault();
    const elm = event.target;
    if (elm.classList.contains('is-active')) {
        elm.classList.remove('is-active');
        navList.classList.remove('is-active');
    } else {
        elm.classList.add('is-active');
        navList.classList.add('is-active');
    }
});

$('.carousels').slick();
