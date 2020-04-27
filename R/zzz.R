.onAttach <- function(libname, pkgname) {
  os <- Sys.info()[1]
  if (os == "Windows") {
    path <- Sys.getenv('path')
    wget_path <- system.file("win", package="wget")

    Sys.setenv(path = paste0(wget_path, ';', path))
  }
  get_download_setting()
  wget_set()
}


