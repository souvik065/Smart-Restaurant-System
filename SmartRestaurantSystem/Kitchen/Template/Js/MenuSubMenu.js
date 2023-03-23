////$(function () {

////    $('.submenu').slideToggle();

////})

$('.menu').click(function () {
    $(this).children('.submenu').slideToggle();
    $(this).children('div').classList.toggle('bg-blue-700');
})


