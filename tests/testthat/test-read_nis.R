test_that("Importing with default import type returns tibble",{
  path <- test_path("data", "NIS_2019_test_data.csv")
  df <- - read_nis(path, 2019)
  expect_type(df, "tbl_df")
})
