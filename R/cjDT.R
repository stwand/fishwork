#' Cartesian join for two data.table
#'
#' @param x - data.table
#' @param y - data.table
#'
#' @return Cartesian join for two data.table
#' @export
#'
#' @import data.table
#' 
cjDT <- function(x,y) {
  y[,as.list(x),by=y]
}
