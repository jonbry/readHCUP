test_that("returns a tibble",{
  test_file <- system.file("extdata", "NIS_2019_test_data.ASC", package = "readHCUP")
  test_df <- read_nis(test_file, 2019)
  expect_s3_class(test_df, "tbl_df")
})
