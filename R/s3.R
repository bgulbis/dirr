
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
