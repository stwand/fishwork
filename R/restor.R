#' Restoring a variable from a backup
#'
#' @param x - name of the variable being restored
#'
#' @return backup variable
#' @export
#'
#' @examples
#' x <- 1:100
#' try(back(x))
#' rm(x)
#' try(restore(x))
restor <- function(x) {
  name.var <- deparse(substitute(x))
  assign(name.var
         ,qs::qread(glue::glue("{this.path::here('back')}/{name.var}.qs"))
         ,envir = .GlobalEnv)
}
