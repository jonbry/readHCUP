test_that("returns a tibble",{
  test_file <- system.file("extdata", "NIS_2019_test_data.ASC", package = "readHCUP")
  test_df <- read_nis(test_file, 2019)
  expect_s3_class(test_df, "tbl_df")
  expect_equal(nrow(test_df), 10)
})

test_that("n_max works as expected", {
  test_file <- system.file("extdata", "NIS_2019_test_data.ASC", package = "readHCUP")
  test_df5row <- read_nis(test_file, 2019, n_max = 5, col_select = NULL)
  expect_equal(nrow(test_df5row), 5)
})

test_that("call_select works correctly", {
  test_file <- system.file("extdata", "NIS_2019_test_data.ASC", package = "readHCUP")
  test_df_col <- read_nis(test_file, 2019, col_select = c("I10_DX1", "I10_DX2", "I10_DX3"), n_max = 3)
  expect_equal(ncol(test_df_col), 3)
  test_df_index <- read_nis(test_file, 2019, col_select = 19:21, n_max = 3)
  expect_equal(test_df_col, test_df_index)
})

test_that("All NA values are properly recognized", {
  test_file <- system.file("extdata", "NIS_2019_test_data.ASC", package = "readHCUP")
  test_na <- read_nis(test_file, 2019)
  expect_true(is.na(test_na$AGE[2]))
  expect_true(is.na(test_na$AMONTH[4]))
  expect_true(is.na(test_na$DISCWT[6]))
  expect_true(is.na(test_na$I10_DX9[9]))
  expect_true(is.na(test_na$I10_MULTINJURY[1]))
  expect_true(is.na(test_na$HOSP_NIS[10]))
  expect_true(is.na(test_na$TOTCHG[5]))
  expect_true(is.na(test_na$YEAR[7]))
})
