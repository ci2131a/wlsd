# wlsd <a href='https://github.com/ci2131a/wlsd'><img src='logo/wlsd-logo.png' align="right" width="120" /></a>

## Overview

The `wlsd` package (wrangling longitudinal survival data) provides a set of functions to transition between different data formats that are commonly used in survival analysis. Moving between different formats often requires more detailed knowledge on how the information is parsed as well as the specific model for which that format is used. For example, easily take your study's longitudinal or panel data and convert it to counting process format for use in a Cox Proportional-Hazards model. 

For more details, see the `wlsd` vignette.

## Installation


### Development Version

The development version of this package lives on GitHub where it is updated and maintained.


In the R console, run the following code to install the development version of the package:

```{r}
devtools::install_github("ci2131a/wlsd")
```
<!--
If you download the development version from this repository to your local machine, you can navigate to the directory and run the following code to load the package:
```{r}
devtools::load_all()
```
-->

**Note:** Be sure you have the `devtools` package installed before running the above code to avoid errors. You can install the `devtools` package through the traditional method: `install.packages("devtools")`
