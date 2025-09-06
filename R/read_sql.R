#' Query text with the substituted parameters
#'
#' @param file.sql  - Request file
#' @param folder.sql  - Request folder. Default "sql"
#'
#' @return - Returns the query text with the substituted parameters
#' @export
#'
#'
read_sql <- function(file.sql, folder.sql = "sql") {
  glue::glue(readr::read_file(this.path::here(folder.sql, 
                                              file.sql)))
}
