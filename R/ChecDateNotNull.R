#' Checking a table for rows
#'
#' @param x - table
#'
#' @return - stops the script if there is data left in the table
#' @export
#'
#' @examples
#' \dontrun{
#' df <- iris
#' ChecDateNotNull(df)
#' df <- df[df$Species=="any"]
#' ChecDateNotNull(df)
#' }
ChecDateNotNull <- function(x) { # Срабатывает если таблица не пустая
  name.var <- deparse(substitute(x))
  checkmate::assertNumeric(nrow(x)
                ,any.missing=FALSE
                ,lower=0
                ,upper=0
                ,.var.name=futile.logger::flog.error(glue::glue("Rows left in table {name.var}"))
  )
}
