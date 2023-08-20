#' Execute an update statement, query number of rows affected, and then close result set
#'
#' @param con - Connect
#' @param file.sql - Request file
#' @param folder.sql - Request folder. Default "sql"
#'
#' @return Same as DBI::dbExecute but with logging and request in another file
#' @export
#'
ExecuteDT <- function(con,file.sql,folder.sql="sql") {
  checkmate::assertFileExists(this.path::here(folder.sql,file.sql)
                              ,extension = NULL
                              ,.var.name = futile.logger::flog.error(glue::glue("File {folder.sql} is missing or folder {folder.sql} is incorrect")))
  DBI::dbExecute(con
            ,glue::glue(readr::read_file(this.path::here(folder.sql,file.sql)))
  )
}
