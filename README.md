
<!-- README.md is generated from README.Rmd. Please edit that file -->

# readHCUP

<!-- badges: start -->
<!-- badges: end -->

## Overview

readHCUP makes it easy to read and work with datasets from [Healthcare
Cost and Utilization Project (HCUP)](https://hcup-us.ahrq.gov/).
readHCUP’s functions are designed to work with the ASC files directly,
so no need to preprocess the data for any of the supported datasets. The
number of supported datasets is limited as the package is currently in
beta, but more datasets will be added weekly.

The currently supported datasets:

- NIS 2019

The current import method utilizes
[readr](https://readr.tidyverse.org/), and additional import functions
(data.table, etc) will be added in the near future.

Please feel free to create an issue if you have any questions, concerns,
feedback, or feature requests.

## Installation

You can install the development version of readHCUP from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jonbry/readHCUP")
```

## Example

``` r
library(readHCUP)

# Read the example NIS dataset
df <- read_nis("NIS_2019_test_data.ASC", 2019)

# Read only the first 5 observations of the example dataset
df_5 <- read_nis("NIS_2019_test_data.ASC", 2019, n_max = 5)
```
