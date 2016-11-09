import $ from 'jquery';

const navRight = $('.nav-right');

$('.nav-toggle.hamburger').click(function (event) {
    event.preventDefault();
    if ($(this).hasClass('is-active')) {
        $(this).removeClass('is-active');
        navRight.removeClass('is-active');
    } else {
        $(this).addClass('is-active');
        navRight.addClass('is-active');
    }
});
