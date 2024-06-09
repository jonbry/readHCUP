#' Return a table of variables and their descriptions
#'
#' @param dataset The dataset (currently only supporting nis).
#' @param year The year the dataset was published.
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
  if (desc_lookup %in% supported_datasets[1]){
    description <- get0(paste(toupper(dataset), year, "descriptions", sep = "_"), envir = asNamespace("readHCUP"))
  }
  else{
    stop("This is not a currently supported dataset. \n  A list of supported datasets can be found using: View(supported_datasets)")
  }
}
