window.onload = function () {
    document.getElementById('preloader').className = 'preloader active';
    setTimeout(function () {
        document.getElementById('preloader').style.display = 'none';
    }, 1500)
}