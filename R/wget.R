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


setup_wget <- function() {
    # exit code: 
    # 0 for success
    # 1 for fail

    has_wget <- yulab.utils:::has_bin("wget")

    if (has_wget) return(0)

    os <- yulab.utils:::which_os()
    if (os != "Windows") {
        # we assume `wget` is installed in MacOS and Linux
        message("Please install wget manually")
        return(1)
    }

    cat("wget is not found. Download it?\n")
    if (utils::menu(c("Yes", "No")) != 1) {
        return(1)
    } 
    
    dir <- yulab.utils:::user_dir("wget", appauthor="YuLab")
    destfile <- file.path(dir, "wget.exe") 
    
    if (!file.exists(destfile)) {
        url <- "https://eternallybored.org/misc/wget"
        # current latest version, access date: 2024-08-17 
        version <- "1.21.4" 

        if (.Platform$r_arch == "x64") {
            arch <- 64
        } else {
            arch <- 32
        } 
        
        url2 <- sprintf("%s/%s/%s/wget.exe", url, version, arch)
        yulab.utils:::mydownload(url, destfile)
    }

    PATH <- Sys.getenv('path')
    Sys.setenv(path = sprintf("%s;%s", destfile, PATH))
    return(0)
}



