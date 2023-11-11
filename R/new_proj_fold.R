#' Create project folders
#'
#' @param fold - A vector with the names of folders that should be in the project.
#' Default:
#' - archive - Folder for saving old versions
#' - back - Backup folder
#' - date - Inbox folder
#' - log - Log folder
#' - materials - Supporting data, descriptions, notes
#' - py - Python code
#' - result - 
#' - scripts - Supporting scripts, functions, settings
#' - sql - SQL code.
#'
#' @return Creates folders
#' @export
#'
new_proj_fold <- function(fold=c("archive","back","date","log"
                                 ,"materials","py","result","scripts","sql")
) {
  lapply(fold
         ,\(x) dir.create(this.path::here(x),showWarnings = FALSE))
}