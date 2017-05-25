
#' Save file as Rds on AWS S3
#'
#' This function saves a data object as an Rds file on AWS S3. The access key id
#' and secret access key must be set as environment variables to work.
#'
#' @param x object to be saved, usually a data.frame
#' @param bucket character string, bucket to save data to
#' @param nm character string with name of object
#' @param s3_dir character string, combined with nm to create an object key
#' @param encrypt logical, default is to encrypt data
#'
#' @export
save_rds_s3 <- function(x, bucket, nm, s3_dir = "data/", encrypt = TRUE) {
    hdrs <- list()
    if (encrypt) hdrs <- list("x-amz-server-side-encryption" = "AES256")

    aws.s3::s3saveRDS(object = paste0(s3_dir, x, ".Rds"),
                      bucket = bucket,
                      headers = hdrs)
}

#' Read in RDS files from AWS S3
#'
#' \code{get_rds} reads in all RDS files from a directory in an AWS S3 bucket
#'
#' This function reads in all RDS files in a given directory in an AWS S3 bucket
#' and saves them as objects in the Global Environment.
#'
#' @param bucket character string, bucket to read data from
#' @param s3_dir character string, retrieves all files from the specified bucket directory
#' @param file_ext An optional character string, defaults to .Rds
#'
#' @return An \code{R} object
#'
#' @seealso \code{\link[aws.s3]{s3readRDS}}
get_rds_s3 <- function(bucket, s3_dir, file_ext = ".Rds") {
    files <- aws.s3::get_bucket_df(bucket)
    files <- dplyr::filter_(files, .dots = list(~stringr::str_detect(Key, s3_dir)))

    raw <- files$Key
    nm <- stringr::str_replace_all(raw, s3_dir, "")
    nm <- stringr::str_replace_all(nm, file_ext, "")

    y <- purrr::map(raw, aws.s3::s3readRDS, bucket = bucket)
    names(y) <- nm
    list2env(y, .GlobalEnv)
}
