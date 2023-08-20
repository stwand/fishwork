#' Checks if the value of a variable is not equal to 0
#'
#' @param x - any variable
#'
#' @return stops the script with an error if the variable is not equal to 0
#' @export
#'
#' @examples
#'
#' x <- 0
#' try(ChecNotNull(x))
#'
#'
#' x <- 2
#' try(ChecNotNull(x))
#'
ChecNotNull <- function(x) {
  name.var <- deparse(substitute(x))
  checkmate::assertNumeric(x
                           ,any.missing=FALSE
                           ,lower=0
                           ,upper=0
                           ,.var.name=futile.logger::flog.error(glue::glue("Variable {name.var} is not 0"))
  )
}
