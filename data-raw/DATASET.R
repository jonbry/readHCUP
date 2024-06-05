## code to prepare `DATASET` dataset goes here

nis_widths_2019 <- readr::read_csv("data-raw/NIS_2019_widths.csv")
nis_labels_2019 <- readr::read_csv("data-raw/NIS_2019_labels.csv")
nis_na_2019 <- readr::read_csv("data-raw/NIS_2019_na.csv", col_names = TRUE, col_types = list(readr::col_character()), na = "")

usethis::use_data(nis_widths_2019, nis_labels_2019, nis_na_2019, internal = TRUE, overwrite = TRUE)
