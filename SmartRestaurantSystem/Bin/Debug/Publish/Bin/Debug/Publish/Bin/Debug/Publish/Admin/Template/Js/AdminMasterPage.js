

const btn = document.querySelector('.mobile-menu-button');
const footer = document.querySelector('footer');

const submenu = document.querySelector('.submenu');
const arrow = document.querySelector('.arrow');



//const navbarbtn = (widthSize) => {
//    if (widthSize.matches) {

//        btn.addEventListener('click', () => {
//            sidebar.classList.toggle('-translate-x-full');
            

//        });

//    } else if (!widthSize.matches){

//        btn.addEventListener('click', () => {
//            sidebar.classList.toggle('lg:translate-x-0');
//            contentdiv.classList.toggle('lg:ml-72')

//        })
        
//    }
//}



$(function () {
    $('.submenu').slideToggle();
});










/*navbarbtn(widthSize);*/
/*widthSize.addEventListener("change", navbarbtn);*/

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