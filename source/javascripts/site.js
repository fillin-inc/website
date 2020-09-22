import jquery from 'jquery';
import slick from 'slick-carousel';
import { throttle } from 'throttle-debounce';

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

if ($('.carousels').length) {
  $('.carousels').slick();
}

const header = $('#header');
const headerHeight = header.height() / 2;
$(window).scroll(throttle(250, function () {
    if ($(window).scrollTop() >= headerHeight) {
      header.addClass('is-sticky');
    } else {
      header.removeClass('is-sticky');
    }
}));
