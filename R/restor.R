#' Restoring a variable from a backup
#'
#' @param x - name of the variable being restored
#'
#' @return backup variable
#' @export
#'
#' @examples
#' \dontrun{
#' x <- 1:100
#' back(x)
#' rm(x)
#' restore(x)
#' }
restor <- function (x) {
  name.var <- deparse(substitute(x))
  tryCatch( {
    assign(name.var, qs2::qs_read(glue::glue("{this.path::here('back')}/{name.var}.qs")), 
           envir = .GlobalEnv)
  }, warning= function(w) {
    return(NA)
  },error= function(e) {
    x <- stringi::stri_detect_regex(e$message,"use qs::qread")
    if (x==TRUE) {
      assign(name.var, qs::qread(glue::glue("{this.path::here('back')}/{name.var}.qs")), 
             envir = .GlobalEnv)
    } else {e$message}
  }
  )
} 

