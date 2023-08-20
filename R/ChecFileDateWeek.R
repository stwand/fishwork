#' Check if the file creation date matches the current week
#'
#' @param file_path -file name
#'
#' @return Stops the script on a date mismatch
#' @export
#'
ChecFileDateWeek <- function(file_path) {
  checkmate::assertDate(
    as.Date(file.mtime(file_path)),
    lower = Sys.Date()-lubridate::wday(Sys.Date(),week_start = 1)-1,
    upper = Sys.Date(),
    .var.name = futile.logger::flog.error(glue::glue("Date file {file_path} - {as.Date(file.mtime(file_path))}. Does not match.")))
}
