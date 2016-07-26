# setup.R

#' Create directories for a data project
#'
#' \code{make_dirs} creates a set of standard directories to use for a data
#' project
#'
#' This function creates a set of standard directories to organize and
#' facilitate a data project. The directories created are:
#'
#' \itemize{
#'     \item data
#'     \itemize{
#'         \item external - any external data, such as data which was manually
#'         collected
#'         \item final - final version of the data used for analysis
#'         \item raw - original, raw data sets
#'         \item tidy - tidy version of original data sets
#'     }
#'     \item doc - manuscript and related documents
#'     \item explore - exploratory notebooks and figures
#'     \item figs - final figures for posters or manuscript
#'     \item report - notebook containing data analysis
#'     \item src - R script files used to tidy, transform, and aggregate data
#'     into the final data set
#' }
#'
#' @export
make_dirs <- function() {
    list_dirs <- list(
        "data",
        "data/raw",
        "data/tidy",
        "data/external",
        "data/final",
        "explore",
        "figs",
        "doc",
        "report",
        "src"
    )

    lapply(list_dirs, function(y) if (!dir.exists(y)) dir.create(y))
}



