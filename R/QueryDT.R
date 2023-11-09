#' Send query, retrieve results and then clear result set
#'
#' @param con - Connect
#' @param file.sql - Request file
#' @param folder.sql - Request folder. Default "sql"
#' @param conv - Convert result
#'
#' @return Same as DBI::dbGetQuery but with logging and returns data.table
#' @export
#'
#'
QueryDT <- function(con,file.sql,folder.sql="sql",conv=FALSE) {
  checkmate::assertFileExists(this.path::here(folder.sql,file.sql),
                              extension = NULL
                              ,.var.name = futile.logger::flog.error(glue::glue("File {folder.sql} is missing or folder {folder.sql} is incorrect")))
  df <- tryCatch({
    data.table::as.data.table(
      DBI::dbGetQuery(con
                      , statement = glue::glue(readr::read_file(this.path::here(folder.sql,file.sql)))))
  }, warning= function(w) {
    return(NA)
  },error= function(e) {
    return(NA)
  })
  checkmate::assertTRUE(data.table::is.data.table(df)
                        ,.var.name=futile.logger::flog.error(glue::glue("Disruption of data delivery")))
  if (conv==FALSE) {
    df
    } else {
      df[,lapply(data.table::.SD,\(x) {if(is.character(x)) iconv(x,"CP1251") else x})]
      
    }
}
