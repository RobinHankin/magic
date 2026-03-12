# does a vector have the sum required to be a row or column of a magic square?

Returns `TRUE` if and only if `sum(vec)==magic.constant(n,d=d))`

## Usage

``` r
is.ok(vec, n=length(vec), d=2)
```

## Arguments

- vec:

  Vector to be tested

- n:

  Order of square or hypercube. Default assumes order is equal to length
  of `vec`

- d:

  Dimension of square or hypercube. Default of 2 corresponds to a square

## Author

Robin K. S. Hankin

## Examples

``` r
 is.ok(magic(5)[1,])
#> [1] TRUE
```
