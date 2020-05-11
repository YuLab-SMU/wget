.onAttach <- function(libname, pkgname) {
  os <- Sys.info()
  if (os["sysname"] == "Windows") {
    ## windows binary file downloaded from https://eternallybored.org/misc/wget/
    path <- Sys.getenv('path')
    os_b = strsplit(os["machine"]," ")[[1]]
    os_b = ifelse(length(os_b)==1,os_b,os_b[2])
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
