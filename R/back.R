#' Backup variable during development
#'
#' @param x   - any variable supported by the qs package
#'
#' @return The variable itself is stored in the directory "back". If there is none, it creates it in the script folder.
#' @export
#'
#' @examples
#' x <- 1:100
#' try(back(x))
#'
back <- function(x) {
  if (!dir.exists(this.path::here("back"))){
    dir.create(this.path::here("back"))
  }
  name.var <- deparse(substitute(x))
  qs::qsave(x,glue::glue("{this.path::here('back')}/{name.var}.qs"))
  name.var
}
