#' File Existence
#'
#' @param file_path - file name
#'
#' @return Stops the script if there is no file
#' @export
#'
ChecFile <- function(file_path) {
  checkmate::assertFileExists(file_path,
                              extension = NULL,
                              .var.name = futile.logger::flog.error(glue::glue("Not file {file_path}"))
  )
}
