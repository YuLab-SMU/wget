## wget: Setting Download Method to "wget -c"


The `wget::wget_set()` function will change the default behavior of 'download.file'. The download method will be changed to using "wget -c" so that continued downloading will be supported. User can run `wget::wget_unset()` to restore previous setting.

All platforms including Linux, MacOS and Windows are supported.


----

What you need is to run the `wget::wget_set()` function. Then `download.file()`, `install.packages()` and `BiocManager::install()` will all support continue retrival.

