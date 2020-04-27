##' set "download.file.method" to "wget" and "download.file.extra" to "-c"
##'
##' setting download method to "wget -c", so that it can continue the download from where it left off.
##' @title wget_set
##' @param method download method (wget, default)
##' @param extra extra parameter (-c, default)
##' @return NULL
##' @export
##' @author Guangchuang Yu
wget_set <- function(method = "wget", extra = "-c") {
    options(download.file.method = method)
    options(download.file.extra = extra)
}


##' unset download method setting by `wget_set`
##'
##' set the download method and extra parameter back to what it is or NULL if it is not specify
##' @title wget_unset
##' @return NULL
##' @export
##' @author Guangchuang Yu
wget_unset <- function() {
    if (!exists(".wgetEnv", envir=.GlobalEnv)) {
        return()
    }

    .wgetEnv <- get(".wgetEnv", envir=.GlobalEnv)
    method <- get("download.file.method", envir = .wgetEnv)
    extra <- get("download.file.extra", envir = .wgetEnv)
    
    wget_set(method, extra)
}

get_download_setting <- function() {
    pos <- 1
    envir <- as.environment(pos)
    if (!exists(".wgetEnv", envir=.GlobalEnv)) {
        assign(".wgetEnv", new.env(), envir = envir)
    }

    .wgetEnv <- get(".wgetEnv", envir=.GlobalEnv)
    assign("download.file.method",
           getOption('download.file.method'),
           envir = .wgetEnv)

    assign("download.file.extra",
           getOption('download.file.extra'),
           envir = .wgetEnv)
}
