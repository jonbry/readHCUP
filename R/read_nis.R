#' Read in NIS dataset
#'
#' NIS datasets can be challenging to work with as the .ASC files do not include
#' information about the variables, labels, or NA values. The `read_nis()`
#' function reads the .ASC file and returns a R object with the correct variable
#' names and NA values.
#'
#' @param file Path to NIS dataset file
#' @param year The year of the dataset
#' @param import_method The function to import data. The default is readr
#' @param n_max The maximum number of rows/observations. The default is set all
#'   rows (`Inf`)
#' @param ... Additional arguments
#'
#' @return Returns a tibble
#' @export
#'
#' @examples
#' # Read in the example NIS 2019 dataset
#' \dontrun{
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019)
#' }
#'
#' # Read in the first 5 observations of the example NIS 2019 dataset
#' \dontrun{
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019, n_max = 5)
#' }
read_nis <- function(file, year, import_method = "readr", n_max = Inf, ...){
  width_file_name <- paste("nis_widths_", year, sep = "")
  na_file_name <- paste("nis_na_", year, sep = "")
  na <- get0(na_file_name, envir = asNamespace("readHCUP"))
  widths <- get0(width_file_name, envir = asNamespace("readHCUP"))
  nis_data <- readr::read_fwf(file,
                              readr::fwf_widths(widths$width, col_names = widths$variable),
                              col_types = widths$r_type, na = na$na_vec)


}
