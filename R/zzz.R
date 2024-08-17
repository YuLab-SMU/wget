.onAttach <- function(libname, pkgname) {
    exit_code <- setup_wget()
    if (exit_code != 0) {
        return()
    }
    
    get_download_setting()
    wget_set()
}


