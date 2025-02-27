
<!-- README.md is generated from README.Rmd. Please edit that file -->

# IAPW package

# What is it?

This package provides convenience functions to import data from
laboratory devices etc. at the Institute of Aquaculture and Protection
of Water, Faculty of Fisheries and Protection of Waters, University of
South Bohemia, České Budějovice, Czech Republic.

# Installation

You can install the latest version of the IAPW package using the
following command:

``` r
require(devtools)
devtools::install_github("TellAnAx/IAPW")
```

# Hints for usage

### here_S()

If you do not want to type in your name every time when using
`here_S()`, then `name` can be stored as variable in the R environment.

First, the `.Renviron` file needs to be opened using the following
command.

``` r
usethis::edit_r_environ()
```

Now, the name can be added to the `.Renviron` file as

``` r
FFPW_NAME = "LASTNAME FIRSTNAME"
```

Leave an empty line at the end of the file, save it and restart your R
session for the changes to be effective.

*Note: The name format must correspond with the name that was used for
your folder. There might be typos, so please double-check the name in
case that the function throws an error.*
