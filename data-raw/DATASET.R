## code to prepare `DATASET` dataset goes here
supported_datasets <- list(data= c("NIS 2016", "NIS 2017", "NIS 2018", "NIS 2019", "NIS 2020"),
                           dataset_file_name = c("NIS_2016_CORE", "NIS_2017_CORE", "NIS_2018_CORE", "NIS_2019_CORE_V2", "NIS_2020_CORE_V2"))

# NIS 2016 Datasets
NIS_2016_widths <- readr::read_csv("data-raw/NIS_2016_widths.csv")
NIS_2016_descriptions <- readr::read_csv("data-raw/NIS_2016_descriptions.csv")
NIS_2016_na <- readr::read_csv("data-raw/NIS_2016_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")
NIS_2016_na <-
  NIS_2016_na |> tibble::add_row(na_vec = "")

# NIS 2017 Datasets
NIS_2017_widths <- readr::read_csv("data-raw/NIS_2017_widths.csv")
NIS_2017_descriptions <- readr::read_csv("data-raw/NIS_2017_descriptions.csv")
NIS_2017_na <- readr::read_csv("data-raw/NIS_2017_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")
NIS_2017_na <-
  NIS_2017_na |> tibble::add_row(na_vec = "")

# NIS 2018 Datasets
NIS_2018_widths <- readr::read_csv("data-raw/NIS_2018_widths.csv")
NIS_2018_descriptions <- readr::read_csv("data-raw/NIS_2018_descriptions.csv")
NIS_2018_na <- readr::read_csv("data-raw/NIS_2018_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")
NIS_2018_na <-
  NIS_2018_na |> tibble::add_row(na_vec = "")

# NIS 2019 Datasets
NIS_2019_widths <- readr::read_csv("data-raw/NIS_2019_widths.csv")
NIS_2019_descriptions <- readr::read_csv("data-raw/NIS_2019_descriptions.csv")
NIS_2019_na <- readr::read_csv("data-raw/NIS_2019_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")
NIS_2019_na <-
  NIS_2019_na |> tibble::add_row(na_vec = "")
NIS_2019_corrected <- readr::read_csv("data-raw/NIS_2019_PCLASS_ORPROC.csv", col_select = c("KEY_NIS", "PCLASS_ORPROC"))

# NIS 2020 Datasets
NIS_2020_widths <- readr::read_csv("data-raw/NIS_2020_widths.csv")
NIS_2020_descriptions <- readr::read_csv("data-raw/NIS_2020_descriptions.csv")
NIS_2020_na <- readr::read_csv("data-raw/NIS_2020_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")
NIS_2020_na <-
  NIS_2020_na |> tibble::add_row(na_vec = "")
NIS_2020_corrected <- readr::read_csv("data-raw/NIS_2020_PCLASS_ORPROC.csv", col_select = c("KEY_NIS", "PCLASS_ORPROC"))

usethis::use_data(NIS_2016_widths, NIS_2016_descriptions, NIS_2016_na,
                  NIS_2017_widths, NIS_2017_descriptions, NIS_2017_na,
                  NIS_2018_widths, NIS_2018_descriptions, NIS_2018_na,
                  NIS_2019_widths, NIS_2019_descriptions, NIS_2019_na, NIS_2019_corrected,
                  NIS_2020_widths, NIS_2020_descriptions, NIS_2020_na, NIS_2020_corrected, internal = TRUE, overwrite = TRUE)
usethis::use_data(supported_datasets, overwrite = TRUE)
