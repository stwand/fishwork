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
restor <- function(x) {
  name.var <- deparse(substitute(x))
  assign(name.var
         ,qs::qread(glue::glue("{this.path::here('back')}/{name.var}.qs"))
         ,envir = .GlobalEnv)
}
