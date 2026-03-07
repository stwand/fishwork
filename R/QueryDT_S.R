#' Send query, retrieve results and then clear result set
#'
#' @param con - Connect
#' @param select - Request select
#' @param conv - Convert result
#' @param enc.conv - Encoding from which
#' @return Same as DBI::dbGetQuery but with logging and returns data.table
#' @export
#' 
#' @import data.table
#'
QueryDT_S <- function(con,select,conv=FALSE,enc.conv="CP1251") {
  df <- tryCatch({
    data.table::as.data.table(
      DBI::dbGetQuery(con
                      , statement = select))
  }, warning= function(w) {
    return(NA)
  },error= function(e) {
    e$message
  })
  checkmate::assertTRUE(data.table::is.data.table(df)
                        , .var.name = futile.logger::flog.error(glue::glue("{df}\nDisruption of data delivery")))
  if (conv==FALSE) {df} else {
    df[,lapply(.SD,\(x) {if(is.character(x)) iconv(x,enc.conv) else x})]
  }
}
