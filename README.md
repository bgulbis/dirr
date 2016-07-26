dirr
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
dirr
----

The `dirr` package can be used to set up a data project with default folders. Additionally, utility functions to compress data files are provided.

Installation
------------

The `dirr` package can be installed from GitHub using the `devtools` package and the following commands:

``` r
libryar(devtools)

install_github("bgulbis\dirr")
```

How to Use
----------

### Create project directories

1.  Create a new project folder, in RStudio or other
2.  Load the `dirr` package
3.  Run the `make_dirs` function

``` r
libryar(dirr)

make_dirs()
```

### Compress data files

1.  Load the `dirr` package
2.  Run the `gzip_files` function to compress all data files in the `data/raw` directory

``` r
libryar(dirr)

gzip_files()
```

Output
------

The following folders are created by `setup.R`:

1.  data/external - any external data, such as data which was manually collected
2.  data/final - final version of the data used for analysis
3.  data/raw - original, raw data sets
4.  data/tidy - tidy version of original data sets
5.  doc - manuscript and related documents
6.  explore - exploratory notebooks and figures
7.  figs - final figures for posters or manuscript
8.  report - notebook containing data analysis
9.  src - R script files used to tidy, transform, and aggregate data into the final data set
