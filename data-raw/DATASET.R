## code to prepare `DATASET` dataset goes here
supported_datasets <- list(data= c("NIS 2019"), dataset_file_name = c("NIS_2019_CORE_V2"))

NIS_2019_widths <- readr::read_csv("data-raw/NIS_2019_widths.csv")
NIS_2019_descriptions <- readr::read_csv("data-raw/NIS_2019_descriptions.csv")
NIS_2019_na <- readr::read_csv("data-raw/NIS_2019_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")
NIS_2019_na <-
  NIS_2019_na |> tibble::add_row(na_vec = "")
NIS_2019_corrected <- readr::read_csv("data/NIS_2019_PCLASS_ORPROC.csv")

usethis::use_data(NIS_2019_widths, NIS_2019_descriptions, NIS_2019_na, NIS_2019_corrected, internal = TRUE, overwrite = TRUE)
usethis::use_data(supported_datasets, overwrite = TRUE)
