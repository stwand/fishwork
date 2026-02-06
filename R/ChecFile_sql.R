#' File request Existence
#'
#' @param file.sql - Request file
#' @param folder.sql - Request folder. Default "sql"
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
ChecFile_sql <- function(file.sql,folder.sql="sql") {
  checkmate::assertFileExists(this.path::here(folder.sql,file.sql),
                              extension = NULL
                              ,.var.name = futile.logger::flog.error(glue::glue("File {folder.sql} is missing or folder {folder.sql} is incorrect")))
}
