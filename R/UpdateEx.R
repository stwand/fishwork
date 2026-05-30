#' Update PIVOT TABLE Excel
#'
#' @param file.name - file Excel
#' @param sheet.name - Sheet name
#' @param pivot.table.name - PIVOT TABLE name
#'
#' @returns  - absent
#' @export
#'
UpdateEx <- function(file.name,sheet.name,pivot.table.name="PT1") {
  ps_script <- glue::glue('
$excel = $null
try {{
  $excel = New-Object -ComObject Excel.Application
  $excel.Visible = $true
  $wb = $excel.Workbooks.Open("{file.name}")
  $sheet = $wb.Sheets("{sheet.name}")
  $pt = $sheet.PivotTables("{pivot.table.name}")
  $pt.RefreshTable()
  $wb.Save()
  $wb.Close()
}}
finally {{
  if ($excel -ne $null) {{
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel)
  }}
  [System.GC]::Collect()
}}
')
  temp_file <- tempfile(fileext = ".ps1")
  writeLines(ps_script, temp_file)
  system2("powershell", 
          args = c("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", temp_file))
  unlink(temp_file)
}
