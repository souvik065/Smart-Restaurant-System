





$(window).on('scroll', function () {
    if ($(window).scrollTop()) {
        $('.nav-bar').addClass('bg-opacity-80')
        $('.nav-bar').removeClass('bg-opacity-50')

    } else {
        $('.nav-bar').removeClass('bg-opacity-80')
        $('.nav-bar').addClass('bg-opacity-50')
    }
});

function FormValTextBox(id) {
    if ($("#" + id).val() != "") {
        $("#" + id + "Warning").text("");
    }


}

function FormValDropDown(id) {
    if ($("#" + id).val() != 0) {
        $("#" + id + "Warning").text("");
    }


}

//$('.side-nav-bar-button').on('click', function () {
//    debugger;
//    $('.side-nav-bar').toggleClass('-translate-x-full');
//});

