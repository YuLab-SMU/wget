#' @importFrom yulab.utils yulab_msg
.onAttach <- function(libname, pkgname) {
    packageStartupMessage(yulab_msg(pkgname))

    exit_code <- setup_wget()
    if (exit_code != 0) {
        return()
    }

    get_download_setting()
    wget_set()
}


