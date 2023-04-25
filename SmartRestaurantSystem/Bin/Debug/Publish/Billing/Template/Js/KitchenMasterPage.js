

const btn = document.querySelector('.mobile-menu-button');
const footer = document.querySelector('footer');

const submenu = document.querySelector('.submenu');
const arrow = document.querySelector('.arrow');







$(function () {
    $('.submenu').slideToggle();
});









/*    Form validation       */
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
/*     Form validation  End      */