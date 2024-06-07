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
#' var_desc <- description("nis", 2019)
#' head(var_desc, 5)
description <- function(dataset, year) {
  desc_lookup <- paste(dataset, "labels", year, sep = "_")
  description <- get0(desc_lookup, envir = asNamespace("readHCUP"))
}
