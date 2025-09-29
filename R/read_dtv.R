#' Read a UTF-8 encoded text file downloaded from. Package wrapper vroom.
#'
#' @param file_path -Path to file
#' @param skp - How many lines to skip. Default 0.
#' @param gm - How many rows to take if there is no file with column name encoding, or the variable types in this file are not specified. The default is 1000.
#' @param head_nm_fl - Path to a file with input and output variable names and variable types (optional). Uses package openxlsx.
#' @param nm_old - Field with the names of the input columns. In the file head_nm_fl.
#' @param nm_new  -Field with the names of the output columns. In the file head_nm_fl.
#' @param nm_type_var - Field with variable type designations. In the file file head_nm_fl.s
#' @param type_var - Specifies whether there is a field with variable types. Defaults to FALSE.
#' 
#' 
#' @return returns data.table
#' @export
#'
#'@import data.table
#' 
read_dtv <- function(file_path
                     ,skp=0
                     ,gm=1000
                     ,head_nm_fl=NA
                     ,nm_old="old"
                     ,nm_new="new"
                     ,nm_type_var="type_var"
                     ,type_var=FALSE) {
  idx=0
  if (is.na(head_nm_fl)==FALSE) {
    shap <- openxlsx::read.xlsx(head_nm_fl)
    data.table::setDT(shap)
    data.table::setnames(shap,old = c(nm_old,nm_new)
                         ,new=c("old","new"))
    idx <- 1
    if (type_var==TRUE) {
      data.table::setnames(shap,old = c(nm_type_var)
                           ,new=c("type_var"))
      tp_str <- lapply(shap[,.SD,.SDcols=c("type_var")],\(x) x)
      tp_str <- unlist(unname(tp_str))
      tp_str <- lapply(tp_str,\(x) x)
      idx <- 2
    }
  }
  gm <- ifelse(idx==0,gm,100)
  if (!exists("tp_str")) {tp_str <- NULL}
  result <- vroom::vroom(file_path,delim = "\t"
                         ,skip=skp
                         ,guess_max = gm
                         ,col_types =tp_str
                         ,locale = vroom::locale("ru",grouping_mark ="\u00a0"
                                                 ,decimal_mark = ","
                                                 , encoding = "UTF-8"))
  futile.logger::flog.info("Read")
  data.table::setDT(result)
  if (idx>0) {
    
    data.table::setnames(result,old=shap[,old],new=shap[,new])
    stolb <- stringi::stri_subset_regex(names(result),"date_|_date")
    result[,(stolb):=lapply(.SD,\(x) as.Date(x,"%d.%m.%Y")),.SDcols=stolb]
  }
  futile.logger::flog.info(glue::glue("{nrow(result)} - rows. {ncol(result)} - columns"))
  result
}
