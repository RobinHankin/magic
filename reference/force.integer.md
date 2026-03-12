# Integerize array elements

Returns an elementwise `as.integer`-ed array. All magic squares should
have integer elements.

## Usage

``` r
force.integer(x)
```

## Arguments

- x:

  Array to be converted

## Author

Robin K. S. Hankin

## Note

Function `force.integer()` differs from
[`as.integer()`](https://rdrr.io/r/base/integer.html) as the latter
returns an integer vector, and the former returns an array whose
elements are integer versions of `x`; see examples section below.

## Examples

``` r
a <- matrix(rep(1,4),2,2)
force.integer(a)
#>      [,1] [,2]
#> [1,]    1    1
#> [2,]    1    1
as.integer(a)
#> [1] 1 1 1 1
```
