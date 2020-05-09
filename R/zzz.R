.onAttach <- function(libname, pkgname) {
  os <- Sys.info()
  if (os[1] == "Windows") {
    ## windows binary file downloaded from https://eternallybored.org/misc/wget/
    path <- Sys.getenv('path')
    os_b = strsplit(os[2]," ")[[1]][2]
    if(os_b == "x64"){
      wget_path <- system.file("win/x64", package="wget")
    }else{
      wget_path <- system.file("win/x86", package="wget")
    } 
    Sys.setenv(path = paste0(wget_path, ';', path))
  }
  get_download_setting()
  wget_set()
}
