#' Checks the creation date of a file
#'
#' @param file_path -file name
#' @param day.ch - The date the file was created. The default is today.
#'
#' @return Stops the script on a date mismatch
#' @export
#'
ChecFileDateDay <- function(file_path,day.ch=Sys.Date()) {
  checkmate::assertDate(
    as.Date(file.mtime(file_path)),
    lower = day.ch,
    upper = day.ch,
    .var.name = futile.logger::flog.error(glue::glue("Date file {file_path} - {as.Date(file.mtime(file_path))}. Does not match.")))
}
