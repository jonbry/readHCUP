test_that("returns a tibble with two columns and both are characters", {
  var_desc <- descriptions("NIS", 2019)
  expect_s3_class(var_desc, "tbl_df")
  expect_length(var_desc, 2)
  expect_type(var_desc[[1]], "character")
  expect_type(var_desc[[2]], "character")
})

test_that("Case doesn't cause descriptions to fail", {
  case_lower <- descriptions("nis", 2019)
  case_upper <- descriptions("NIS", 2019)
  expect_equal(case_lower, case_upper)
})

test_that("returns error date is not given or not listed as supported", {
  expect_error(descriptions("NIS"))
  expect_error(descriptions("NIS", 1995))
})
