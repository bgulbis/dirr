dirr
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
Purpose
-------

The `dirr` package can be used to set up a data project with default folders. Additionally, utility functions to compress data files are provided.

Installation
------------

The `dirr` package can be installed from GitHub using the `devtools` package and the following commands:

``` r
# install.packages("devtools")
library(devtools)

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

#### Output

The following folders are created by `make_dirs`:

-   data/external - any external data, such as data which was manually collected
-   data/final - final version of the data used for analysis
-   data/raw - original, raw data sets
-   data/tidy - tidy version of original data sets
-   doc - manuscript and related documents
-   explore - exploratory notebooks and figures
-   figs - final figures for posters or manuscript
-   report - notebook containing data analysis
-   src - R script files used to tidy, transform, and aggregate data into the final data set

### Compress data files

1.  Load the `dirr` package
2.  Run the `gzip_files` function to compress all data files in the `data/raw` directory, or other specified directory

``` r
libryar(dirr)

gzip_files()
```

-   Use the `pattern` argument to specify only certain files for zipping
-   Use `ungzip_files` to uncompress all data files
