# save_data

#' Read in RDS files
#'
#' \code{get_rds} reads in all RDS files from a directory
#'
#' This function reads in all RDS files in a given directory and saves them as
#' objects in the Global Environment.
#'
#' @param data.dir A character string with the name of the directory containing
#'   the RDS files
#' @param file.ext An optional character string, defaults to .Rds
#'
#' @return An \code{R} object
#'
#' @seealso \code{\link{readRDS}}
#'
#' @export
get_rds <- function(data.dir, file.ext = ".Rds") {
    raw <- list.files(data.dir, file.ext, full.names = TRUE)
    nm <- list.files(data.dir, file.ext)
    nm <- stringr::str_replace_all(nm, file.ext, "")
    files <- purrr::map(raw, readRDS)
    names(files) <- nm
    list2env(files, .GlobalEnv)
}

#' Save data in RDS files
#'
#' \code{save_rds} saves data in RDS files
#'
#' This function saves all designated data frames in RDS files within a given
#' directory.
#'
#' @param data.dir A character string with the name of the directory containing
#'   the RDS files
#' @param pattern A regular expression indicating the objects to be saved
#' @param file.ext An optional character string, defaults to .Rds
#'
#' @return An \code{R} object
#'
#' @seealso \code{\link{saveRDS}}
#'
#' @export
save_rds <- function(data.dir, pattern, file.ext = ".Rds") {
    to.save <- ls(.GlobalEnv, pattern = pattern)
    purrr::walk(to.save, ~ saveRDS(get(.x), paste0(data.dir, "/", .x, file.ext)))
}

#' Read in Rda or Rdata files
#'
#' \code{get_rdata} reads in all Rda or Rdata files from a directory
#'
#' This function reads in all Rda or Rdata files in a given directory and saves
#' them as objects in the Global Environment.
#'
#' @param data.dir A character string with the name of the directory containing
#'   the files
#' @param file.ext An optional character string, defaults to .Rda
#'
#' @return An \code{R} object
#'
#' @seealso \code{\link{load}}
#'
#' @export
get_rdata <- function(data.dir, file.ext = ".Rda") {
    raw <- list.files(data.dir, file.ext, full.names = TRUE)
    files <- purrr::walk(raw, load, envir = .GlobalEnv)
}

#' Save data in Rda or Rdata files
#'
#' \code{save_rdata} saves data in Rda or Rdata files
#'
#' This function saves all designated data frames in Rda (default) or Rdata
#' files within a given directory.
#'
#' @param data.dir A character string with the name of the directory containing
#'   the files
#' @param pattern A regular expression indicating the objects to be saved
#' @param file.ext An optional character string, defaults to .Rda
#'
#' @return An \code{R} object
#'
#' @seealso \code{\link{save}}
#'
#' @export
save_rdata <- function(data.dir, pattern, file.ext = ".Rda") {
    to.save <- ls(.GlobalEnv, pattern = pattern)
    purrr::walk(
        to.save,
        ~ save(
            list = .x,
            file = paste0(data.dir, "/", .x, file.ext)
        )
    )
}

