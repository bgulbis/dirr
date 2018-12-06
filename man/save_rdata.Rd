% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_data.R
\name{save_rdata}
\alias{save_rdata}
\title{Save data in Rdata or Rda files}
\usage{
save_rdata(data.dir, pattern, file.ext = ".Rdata")
}
\arguments{
\item{data.dir}{A character string with the name of the directory containing
the files}

\item{pattern}{A regular expression indicating the objects to be saved}

\item{file.ext}{An optional character string, defaults to .Rdata}
}
\value{
An \code{R} object
}
\description{
\code{save_rdata} saves data in Rdata or Rda files
}
\details{
This function saves all designated data frames in Rdata or Rda
files within a given directory. The data are converted to data.frames prior
to saving which allows for direct import into products like Tableau.
}
\seealso{
\code{\link{save}}
}