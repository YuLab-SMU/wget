## wget: Setting Download Method to “wget -c”

[![License:
Artistic-2.0](https://img.shields.io/badge/license-Artistic--2.0-blue.svg)](https://cran.r-project.org/web/licenses/Artistic-2.0)
[![](https://img.shields.io/badge/devel%20version-0.0.4-blue.svg)](https://github.com/YuLab-SMU/wget)
[![](https://www.r-pkg.org/badges/version/wget?color=green)](https://cran.r-project.org/package=wget)
[![](http://cranlogs.r-pkg.org/badges/grand-total/wget?color=green)](https://cran.r-project.org/package=wget)

Provides function, wget_set(), to change the method (default to ‘wget
-c’) using in download.file(). Using ‘wget -c’ allowing continued
downloading, which is especially useful for slow internet connection and
for downloading large files. User can run wget_unset() to restore
previous setting.

What you need is to run the `wget::wget_set()` function. Then
`download.file()`, `install.packages()` and `BiocManager::install()`
will all support continue retrival.

## :writing_hand: Authors

Guangchuang YU

School of Basic Medical Sciences, Southern Medical University

<https://yulab-smu.top>

## :arrow_double_down: Installation

Get the released version from CRAN:

``` r
install.packages("wget")
```

Or the development version from github:

``` r
## install.packages("remotes")
remotes::install_github("YuLab-SMU/wget")
```
