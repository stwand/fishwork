#' Empty table
#'
#' @param x  - table
#'
#' @return - stops the script if the table is empty
#' @export
#'
#' @examples
#' \dontrun{
#' df <- iris
#' ChecDateNull(df)
#' df <- df[df$Species=="any"]
#' ChecDateNull(df)
#' }
#'
ChecDateNull <- function(x) {
  name.var <- deparse(substitute(x))
  checkmate::assertNumeric(nrow(x)
                ,any.missing=FALSE
                ,lower=1
                ,upper=Inf
                ,.var.name=futile.logger::flog.error(glue::glue("Table {name.var} has no rows"))
  )
}
