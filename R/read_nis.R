#' Read NIS file
#'
#' @param dataset Path to NIS dataset file
#' @param year The year of the dataset
#' @param import_method The function to import data. The default is readr/
#' @param ... Additional arguments
#'
#' @return Returns a tibble
#' @export
#'
#' @examples
#' \dontrun{
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019)
#' }
read_nis <- function(dataset, year, import_method = "readr", ...){
  width_file_name <- paste("nis_widths_", year, sep = "")
  na_file_name <- paste("nis_na_", year, sep = "")
  na <- get0(na_file_name, envir = asNamespace("loadHCUP"))
  widths <- get0(width_file_name, envir = asNamespace("loadHCUP"))
  nis_data <- readr::read_fwf(dataset,
                              readr::fwf_widths(widths$width, col_names = widths$variable),
                              col_types = widths$r_type, na = na$na_vec)


}
