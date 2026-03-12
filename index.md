# Manipulation of high-dimensional arrays in R with the magic package

![](reference/figures/magic.png)

# Overview

The magic package implements functionality for manipulating
high-dimensional arrays using efficient vectorised methods. The original
application was high-dimensional magic hypercubes. This README shows
some of the more useful functions in the package.

# Installation

You can install the released version of `magic` from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("magic")  # uncomment this to install the package
library("magic")
```

# Package highlights

- Function
  [`adiag()`](https://robinhankin.github.io/magic/reference/adiag.md)
  binds arbitrarily-dimensioned arrays corner-to-corner
- Function
  [`apad()`](https://robinhankin.github.io/magic/reference/apad.md) pads
  arbitrarily-dimensioned arrays
- Function
  [`apldrop()`](https://robinhankin.github.io/magic/reference/apl.md) is
  a replacement for APL’s drop
- Function
  [`aplus()`](https://robinhankin.github.io/magic/reference/aplus.md)
  superimposes two arrays of different dimensions and returns the sum of
  overlapping elements
- Function
  [`arev()`](https://robinhankin.github.io/magic/reference/arev.md) is a
  multidimensional generalization of
  [`rev()`](https://rdrr.io/r/base/rev.html)
- Function
  [`arot()`](https://robinhankin.github.io/magic/reference/arot.md) is a
  generalization of matlab’s `rotdim`
- Function
  [`fnsd()`](https://robinhankin.github.io/magic/reference/fnsd.md)
  returns the first nonsingleton dimension of an arbitrary dimensioned
  array
- Function
  [`ashift()`](https://robinhankin.github.io/magic/reference/shift.md)
  shifts the origin of arbitrary dimensioned arrays

Much of the package functionality is vectorised in array dimension.

# Further information

For more detail, see the package vignette

`vignette("magic")`
