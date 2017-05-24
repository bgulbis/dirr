.onLoad <- function(libname, pkgname) {
    repos = getOption("cloudyr")
    repos["cloudyr"] = "http://cloudyr.github.io/drat"
    options(repos = repos)
    invisible(repos)
}