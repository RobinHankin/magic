# Frenicle's equivalent magic squares

For a given magic square, returns one of the eight squares whose
Frenicle's standard form is the same.

## Usage

``` r
transf(a, i)
```

## Arguments

- a:

  Magic square

- i:

  Integer, considered modulo 8. Specifying 0-7 gives a different magic
  square

## Author

Robin K. S. Hankin

## See also

[`is.standard`](https://robinhankin.github.io/magic/reference/as.standard.md)

## Examples

``` r
a <- magic(3)
identical(transf(a,0),a)
#> [1] TRUE

transf(a,1)
#>      [,1] [,2] [,3]
#> [1,]    2    9    4
#> [2,]    7    5    3
#> [3,]    6    1    8
transf(a,2)
#>      [,1] [,2] [,3]
#> [1,]    4    3    8
#> [2,]    9    5    1
#> [3,]    2    7    6

transf(a,1) %eq% transf(a,7)
#> [1] FALSE
```
