#' Checks if the value of a variable is equal to 0
#'
#' @param x - any variable
#'
#' @return stops the script with an error if the variable is equal to 0
#' @export
#'
#' @examples
#' x <- 0
#' try(ChecNotNull(x))
#'
#' x <- 2
#' try(ChecNotNull(x))
#'
ChecNull <- function(x) {
  name.var <- deparse(substitute(x))
  checkmate::assertNumeric(x
                ,any.missing=FALSE
                ,lower=1
                ,upper=Inf
                ,.var.name=futile.logger::flog.error(glue::glue("Variable {name.var} is 0"))
  )
}
