





$(window).on('scroll', function () {
    if ($(window).scrollTop()) {
        $('.nav-bar').addClass('bg-opacity-80')
        $('.nav-bar').removeClass('bg-opacity-50')

    } else {
        $('.nav-bar').removeClass('bg-opacity-80')
        $('.nav-bar').addClass('bg-opacity-50')
    }
});



//$('.side-nav-bar-button').on('click', function () {
//    debugger;
//    $('.side-nav-bar').toggleClass('-translate-x-full');
//});

