#' Return a table of variables and their descriptions
#'
#' @param dataset The dataset (currently only supporting NIS).
#' @param year The dataset year.
#'
#' @return A tibble consisting of the variable names and their descriptions.
#' @export
#'
#' @examples
#' # The descriptions for the first 5 variables
#' var_desc <- descriptions("nis", 2019)
#' head(var_desc, 5)
descriptions <- function(dataset, year) {
  desc_lookup <- paste(toupper(dataset), year, sep = " ")
  datasets <- readHCUP::supported_datasets
  # Check to see if dataset is supported, if not return error
  if (desc_lookup %in% datasets[[1]]){
    description <- get0(paste(toupper(dataset), year, "descriptions", sep = "_"), envir = asNamespace("readHCUP"))
  }
  else{
    stop("This is not a currently supported dataset. \n  A list of supported datasets can be found using: View(supported_datasets)")
  }
}
