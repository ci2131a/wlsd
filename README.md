# wlsd <a href='https://github.com/ci2131a/wlsd'><img src='logo/wlsd-logo.png' align="right" height="139" /></a>

Survival analysis data may come in different usable forms. Transitioning between formats requires detailed knowledge on how information is parsed and how variables are treated. The `wlsd` package in R provides methods for transforming data between usable formats in an effort to ease this process. `wlsd` can transition between the counting process format and longitudinal or panel format. It can also be used to create data formats suitable for count data regression.

## Installation

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
