
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wlsd <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ci2131a/wlsd/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ci2131a/wlsd/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `wlsd` package (wrangling longitudinal survival data) supports the
transition of data sets between different formats used in survival
analysis. There exist several different models with different data
formats that might all be applicable to the same data set. Therefore, it
might be necessary to transition a data set into a different format.
However, transformations require detailed knowledge of the data format.
In order to simplify data processing, this package provides functions
that transition between formats such that getting to model building can
be faster.

For more details, see the `wlsd` vignette.

## Installation

The development version of this package is maintained on GitHub.

In the R console, run the following code to install the development
version of the package:

``` r
devtools::install_github("ci2131a/wlsd")
```

**Note:** Be sure you have the `devtools` package installed before
running the above code to avoid errors. You can install the `devtools`
package from CRAN through `install.packages("devtools")`.

## Example

A small example for transitioning from a long format data set to a
counting process data set is shown below:

``` r
library(wlsd)
long2cp(data = long_data, id = "id", time = "time")
#>   id time1 time2 event var1 var2
#> 1  1     0    31     0 11.3   10
#> 2  1    31    64     0 12.7   10
#> 3  1    64    96     1 17.5   10
#> 4  2     0    33     0  5.9   25
#> 5  2    33    59     1  4.4   25
#> 6  3     0    28     1  8.0   16
```

See the `wlsd` vignette for more details.
