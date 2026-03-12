# Generalized array addition

Given two arrays `a` and `b` with `length(dim(a))==length(dim(b))`,
return a matrix with dimensions `pmax(dim(a),dim(b))` where “overlap”
elements are `a+b`, and the other elements are either 0, a, or b
according to location. See details section.

## Usage

``` r
aplus(...)
```

## Arguments

- ...:

  numeric or complex arrays

## Details

The function takes any number of arguments (the binary operation is
associative).

The operation of `aplus()` is understandable by examining the following
**pseudo**code:

- `outa <- array(0, pmax(a,b))`

- `outb <- array(0, pmax(a,b))`

- `outa[1:dim(a)] <- a`

- `outb[1:dim(a)] <- b`

- `return(outa + outb)`

See how `outa` and `outb` are the correct size and the appropriate
elements of each are populated with `a` and `b` respectively. Then the
sum is returned.

## Author

Robin K. S. Hankin

## See also

[`apad`](https://robinhankin.github.io/magic/reference/apad.md)

## Examples

``` r
aplus(rbind(1:9),cbind(1:9))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
#>  [1,]    2    2    3    4    5    6    7    8    9
#>  [2,]    2    0    0    0    0    0    0    0    0
#>  [3,]    3    0    0    0    0    0    0    0    0
#>  [4,]    4    0    0    0    0    0    0    0    0
#>  [5,]    5    0    0    0    0    0    0    0    0
#>  [6,]    6    0    0    0    0    0    0    0    0
#>  [7,]    7    0    0    0    0    0    0    0    0
#>  [8,]    8    0    0    0    0    0    0    0    0
#>  [9,]    9    0    0    0    0    0    0    0    0

a <- matrix(1:8,2,4)
b <- matrix(1:10,5,2)
aplus(a*100,b,b)
#>      [,1] [,2] [,3] [,4]
#> [1,]  102  312  500  700
#> [2,]  204  414  600  800
#> [3,]    6   16    0    0
#> [4,]    8   18    0    0
#> [5,]   10   20    0    0


```
