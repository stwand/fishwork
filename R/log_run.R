#' Creating and running a log file
#'
#' @param log_name The name of the log file. Better if it matches the name of the script
#'
#' @return If not, it creates a log folder, after which it organizes the file
#' @export
#'
log_run <- function(log_name) {
  if (!dir.exists(this.path::here("log"))){
    dir.create(this.path::here("log"))
  }
  futile.logger::flog.appender(futile.logger::appender.file(glue::glue("{this.path::here('log')}/{log_name}.log")))
  futile.logger::flog.info("Program start")
}
