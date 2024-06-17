
<!-- README.md is generated from README.Rmd. Please edit that file -->

# readHCUP

<!-- badges: start -->

[![R-CMD-check](https://github.com/jonbry/readHCUP/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jonbry/readHCUP/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/jonbry/readHCUP/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/jonbry/readHCUP/actions/workflows/test-coverage.yaml)
<!-- badges: end -->

## Overview

readHCUP makes it easy to read and work with datasets from [Healthcare
Cost and Utilization Project (HCUP)](https://hcup-us.ahrq.gov/).
readHCUP’s functions are designed to work with the ASC files directly,
so there is no need to preprocess the data for any of the supported
datasets. The number of supported datasets is currently limited while
the package is in beta, but more datasets will be added soon.

The currently supported datasets:

- NIS 2019
- NIS 2020
- NIS 2021

The current import method utilizes
[readr](https://readr.tidyverse.org/), and additional import functions
(data.table, etc) will be added in the near future.

Please feel free to create an issue if you have any questions, feedback,
or feature requests.

## Installation

You can install the development version of readHCUP from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jonbry/readHCUP")
```

## Usage

### Read NIS datasets

``` r
library(readHCUP)

# The following uses an example NIS dataset

# Read theNIS dataset
df <- read_nis("inst/data/NIS_2019_test_data.ASC", 2019)

# Read only the first 5 observations
df_5 <- read_nis("NIS_2019_test_data.ASC", 2019, n_max = 5)

# Read in only the first three diagnostic codes (columns) of the first 10 observations
df_3dx <- read_nis("NIS_2019_test_data.ASC", 2019,
                   col_select = c("I10_DX1", "I10_DX2", "I10_DX3"),
                   n_max = 10)
```

#### Corrections

By default, the `read_nis()` automatically returns the corrected version
of the data. For example, HCUP released a corrections for
`PCLASS_ORPROC` in the NIS 2019 and 2020 datasets. Usually, you’d need
download a csv file with the corrections and then update the values in
the dataset. This can be a bit of a hassle when there are 7M+ records,
so the corrections are automatically applied when using `read_nis()`.

- Note: In order for the corrections to be applied, `KEY_NIS` and
  `PCLASS_ORPROC` need to be included in your dataset. If they are not
  included, `read_nis()` will still return the data and you will receive
  a warning that corrections were not applied.

If you don’t want the corrections to be automatically applied, use
`corrected = FALSE`:

``` r
# Read dataset the first 10 records of the dataset without corrections.
df <- read_nis("NIS_2019_test_data.ASC", 2019, n_max = 10, corrected = FALSE)
```

#### Supported datasets

The structure of the NIS dataset can change each year, which means
`read_nis()` needs to be updated to support each NIS dataset. You can
find a list of readHCUP’s supported datasets by running the following:

``` r
View(supported_datasets)
```

`supported_datasets` includes:

- A `data` column is the name of the dataset and the year

- A `dataset_file_name` column is the file name that was provided by the
  HCUP Central Distributor

#### Descriptions

The NIS dataset has over 150 variables, which are covered in detail on
HCUP’s [website](https://hcup-us.ahrq.gov/db/nation/nis/nisdde.jsp). The
`descriptions()` function allows you to get a list of all of the
variable descriptions:

``` r
d_list <- descriptions(nis, 2019)
head(d_list)
```
