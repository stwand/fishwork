#' Sys.sleep alter
#'
#' @param val  - time delay
#' @param unit - units of time
#'
#' @return - absent
#' @export
#'

sys_sleep <- function(val, unit = c("s", "ms", "us", "ns")) {
  start_time <- microbenchmark::get_nanotime()
  stopifnot(is.numeric(val))
  unit <- match.arg(unit, c("s", "ms", "us", "ns"))
  val_ns <- switch (unit,
                    "s" = val * 10**9,
                    "ms" = val * 10**7,
                    "us" = val * 10**3,
                    "ns" = val
  )
  repeat {
    current_time <- microbenchmark::get_nanotime()
    diff_time <- current_time - start_time
    if (diff_time > val_ns) break
  }
}