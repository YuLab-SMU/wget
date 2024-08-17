.onAttach <- function(libname, pkgname) {
    setup_wget()
    get_download_setting()
    wget_set()
}


