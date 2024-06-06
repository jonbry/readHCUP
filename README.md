
<!-- README.md is generated from README.Rmd. Please edit that file -->

# loadHCUP

<!-- badges: start -->
<!-- badges: end -->

## Overview

loadHCUP makes it easy to load and work with datasets from [Healthcare
Cost and Utilization Project (HCUP)](https://hcup-us.ahrq.gov/). All the
functions are designed to work with the ASC files directly, so no need
to preprocess the data for any of the supported datasets. The number of
supported datasets is limited as the package is currently in beta, but
more datasets will be added weekly.

The currently supported datasets:

- NIS 2019

The current import method utilizes
[readr](https://readr.tidyverse.org/), and additional import functions
(data.table, etc) will be added in the near future.

Please feel free to create an issue if you have any questions, concerns,
feedback, or feature requests.

## Installation

You can install the development version of loadHCUP from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jonbry/loadHCUP")
```

## Example

Import the NIS dataset :

``` r
library(loadHCUP)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
