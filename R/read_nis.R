#' Read in NIS dataset
#'
#' NIS datasets can be challenging to work with as the .ASC files do not include
#' information about the variables, labels, or NA values. The `read_nis()`
#' function reads the .ASC file and returns a R object with the correct variable
#' names and NA values.
#'
#' @param file Path to NIS dataset file.
#' @param year The year of the dataset.
#' @param import_method The function to import data. The default is readr.
#' @param col_select Columns to include in the results. Columns can be selected
#' by name or by a numerical column index.
#' @param n_max The maximum number of rows/observations. The default is set all
#'   rows (`Inf`).
#' @param corrected The official corrections will be applied to the data.
#'   The default is set to TRUE.
#'
#' @return Returns a tibble
#' @export
#'
#' @examples
#' # Read in the example NIS 2019 dataset.
#' \dontrun{
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019)
#' }
#'
#' # Read in the first 5 observations of the example NIS 2019 dataset.
#' \dontrun{
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019, n_max = 5)
#' }
#'
#' # Read in the first three diagnostic codes un the first 10 observations of
#' # the example NIS 2019 dataset.
#' \dontrun{
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019,
#' col_select = c("I10_DX1", "I10_DX2", "I10_DX3"), n_max = 10)
#'
#' # This can also be done with:
#' NIS_2019_df <- read_nis("NIS_2019_test_data.ASC", 2019,
#' col_select = 19:21, n_max = 10)
#' }
read_nis <- function(file, year, import_method = "readr", col_select = NULL,
                     n_max = Inf, corrected = TRUE){
  width_file_name <- paste("NIS", year, "widths", sep = "_")
  na_file_name <- paste("NIS", year, "na", sep = "_")
  na <- get0(na_file_name, envir = asNamespace("readHCUP"))
  widths <- get0(width_file_name, envir = asNamespace("readHCUP"))
  # Look up to see if dataset is supported
  desc_lookup <- paste("NIS", year, sep = " ")
  datasets <- readHCUP::supported_datasets
  if (!(desc_lookup %in% datasets[[1]])){
    # If dataset isn't supported stop and return error
    stop("This is not a currently supported dataset. \n  A list of supported datasets can be found using: View(supported_datasets)")
  }
  # If there is a value passed for col_select
  if (!is.null(col_select)){
    nis_data <- readr::read_fwf(file,
                                readr::fwf_widths(widths$width, col_names = widths$variable),
                                col_types = widths$r_type, na = na$na_vec, col_select = col_select, n_max = n_max)
    # Return tibble with all rows
  } else {
    nis_data <- readr::read_fwf(file,
                                readr::fwf_widths(widths$width, col_names = widths$variable),
                                col_types = widths$r_type, col_select = NULL, na = na$na_vec, n_max = n_max)
  }

  # Update to the corrected PCLASS_ORPROC from NIS_2019_corrected
  if (corrected == TRUE & year == 2019){
    # If KEY_NIS or PLCASS_ORPROC is missing from the dataset, the uncorrected dataset.
    if (!("KEY_NIS" %in% colnames(nis_data))){
      warning("Corrections were not applied because KEY_NIS was not included in read_nis()")
      return(nis_data)

    } else if (!("PCLASS_ORPROC" %in% colnames(nis_data))){
      warning("Corrections were not applied because PCLASS_ORPROC was not included in read_nis()")
      return(nis_data)
      # If both KEY_NIS and PCLASS_ORPROC are included, return the corrected dataset.
    } else{
      nis_data <-
        nis_data |>
        dplyr::rows_update(NIS_2019_corrected, by = "KEY_NIS", unmatched = "ignore")
    }
  }

  if (corrected == TRUE & year == 2020){
    # If KEY_NIS or PLCASS_ORPROC is missing from the dataset, the uncorrected dataset.
    if (!("KEY_NIS" %in% colnames(nis_data))){
      warning("Corrections were not applied because KEY_NIS was not included in read_nis()")
      return(nis_data)

    } else if (!("PCLASS_ORPROC" %in% colnames(nis_data))){
      warning("Corrections were not applied because PCLASS_ORPROC was not included in read_nis()")
      return(nis_data)
      # If both KEY_NIS and PCLASS_ORPROC are included, return the corrected dataset.
    } else{
      nis_data <-
        nis_data |>
        dplyr::rows_update(NIS_2020_corrected, by = "KEY_NIS", unmatched = "ignore")
    }
  }
  # Otherwise return the dataset as is
  else {
    return(nis_data)
  }
}
