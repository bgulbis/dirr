% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_data.R
\name{get_rds_df}
\alias{get_rds_df}
\title{Read in RDS files with similar name and combine into a data frame}
\usage{
get_rds_df(data.dir, pattern, file.ext = ".Rds")
}
\arguments{
\item{data.dir}{A character string with the name of the directory containing
the RDS files}

\item{pattern}{A regular expression indicating the objects to be read}

\item{file.ext}{An optional character string, defaults to .Rds}
}
\value{
An \code{R} object
}
\description{
\code{get_rds_df} reads in all RDS files matching a pattern and combines into a
single data frame
}
\details{
This function reads in all RDS files in a given directory which match a
pattern and combines them into a single data frame.
}
\seealso{
\code{\link{readRDS}}
}
