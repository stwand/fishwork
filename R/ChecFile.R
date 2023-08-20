#' File Existence
#'
#' @param file_path - file name
#'
#' @return Stops the script if there is no file
#' @export
#' 
#' @examples
#' \dontrun{
#'file <- tempfile()
#'ChecFile(file)
#'file <- "any.rds"
#'ChecFile(file)
#'}
#'
ChecFile <- function(file_path) {
  checkmate::assertFileExists(file_path,
                              extension = NULL,
                              .var.name = futile.logger::flog.error(glue::glue("Not file {file_path}"))
  )
}
