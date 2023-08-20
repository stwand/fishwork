#' Missing variable
#'
#' @param x - any variable
#'
#' @return - stops the script if no variable is found
#' @export
#'
#' @examples
#' x <- 1:100
#' try(ChecVar(x))
#'
#' rm(x)
#' try(ChecVar(x))
#'
ChecVar <- function(x) {
  name.var <- deparse(substitute(x))
  checkmate::assertFALSE(!exists(name.var)
              ,.var.name = futile.logger::flog.error(glue::glue("Missing variable {name.var}"))
  )
}
