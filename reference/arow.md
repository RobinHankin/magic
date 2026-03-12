# Generalized row and col

Given an array, returns an array of the same size whose elements are
sequentially numbered along the \\i^{\rm th}\\ dimension.

## Usage

``` r
arow(a, i)
```

## Arguments

- a:

  array to be converted

- i:

  Number of the dimension

## Value

An integer matrix with the same dimensions as `a`, with element
\\\left(n_1,n_2,\ldots n_d\right)\\ being \\n_i\\.

## Author

Robin K. S. Hankin

## Note

This function is equivalent to, but faster than,
`function(a,i){do.index(a,function(x){x[i]})}`. However, it is much more
complicated.

The function is nominally the same as
[`slice.index()`](https://rdrr.io/r/base/slice.index.html) but I have
not checked all the edge cases.

## Examples

``` r
a <- array(0,c(3,3,2,2))
arow(a,2)
#> , , 1, 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> [3,]    1    2    3
#> 
#> , , 2, 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> [3,]    1    2    3
#> 
#> , , 1, 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> [3,]    1    2    3
#> 
#> , , 2, 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> [3,]    1    2    3
#> 
(arow(a,1)+arow(a,2)+arow(a,3)+arow(a,4))%%2
#> , , 1, 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    1    0
#> [2,]    1    0    1
#> [3,]    0    1    0
#> 
#> , , 2, 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    0    1    0
#> [3,]    1    0    1
#> 
#> , , 1, 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    0    1    0
#> [3,]    1    0    1
#> 
#> , , 2, 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    1    0
#> [2,]    1    0    1
#> [3,]    0    1    0
#> 
```
