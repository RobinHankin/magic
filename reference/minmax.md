# are all elements of a vector identical?

Returns `TRUE` if and only if all elements of a vector are identical.

## Usage

``` r
minmax(x, tol=1e-6)
```

## Arguments

- x:

  Vector to be tested

- tol:

  Relative tolerance allowed

## Details

If `x` is an integer, exact equality is required. If real or complex, a
relative tolerance of `tol` is required. Note that functions such as
[`is.magic()`](https://robinhankin.github.io/magic/reference/is.magic.md)
and
[`is.semimagichypercube()`](https://robinhankin.github.io/magic/reference/is.magichypercube.md)
use the default value for `tol`. To change this, define a new Boolean
function that tests the sum to the required tolerance, and set `boolean`
to `TRUE`

## Author

Robin K. S. Hankin

## See also

is.magic()

## Examples

``` r
data(Ollerenshaw)
minmax(subsums(Ollerenshaw,2))  #should be TRUE, as per is.2x2.correct()
#> [1] TRUE
```
