# Apply a function to array element indices

Given a function `f()` that takes a vector of indices, and an array of
arbitrary dimensions, apply `f()` to the elements of `a`

## Usage

``` r
do.index(a, f, ...)
```

## Arguments

- a:

  Array

- f:

  Function that takes a vector argument of the same length as `dim(a)`

- ...:

  Further arguments supplied to `f()`

## Value

Returns a matrix of the same dimensions as `a`

## Author

Robin K. S. Hankin, with improvements by Gabor Grothendieck and Martin
Maechler, via the R help list

## Note

Tamas Papp suggests the one-liner

` function(a, f, ...){array(apply(as.matrix(expand.grid(lapply(dim(a),seq_len),KEEP.OUT.ATTRS=FALSE)),1,f,...),dim(a))} `

which is functionally identical to `do.index()`; but it is no faster
than the version implemented in the package, and (IMO) is harder to
read.

Further note that function
[`arow()`](https://robinhankin.github.io/magic/reference/arow.md) is
much much faster than `do.index()`; it is often possible to rephrase a
call to `do.index()` as a call to
[`arow()`](https://robinhankin.github.io/magic/reference/arow.md); do
this where possible unless the additional code opacity outweighs the
speed savings.

## See also

[`arow`](https://robinhankin.github.io/magic/reference/arow.md)

## Examples

``` r
a <- array(0,c(2,3,4))
b <- array(rpois(60,1),c(3,4,5))

f1 <- function(x){sum(x)}
f2 <- function(x){sum((x-1)^2)}
f3 <- function(x){b[t(x)]}
f4 <- function(x){sum(x)%%2}
f5 <- function(x,u){x[u]}

do.index(a,f1)    # should match   arow(a,1)+arow(a,2)+arow(a,3)
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    3    4    5
#> [2,]    4    5    6
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    4    5    6
#> [2,]    5    6    7
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]    5    6    7
#> [2,]    6    7    8
#> 
#> , , 4
#> 
#>      [,1] [,2] [,3]
#> [1,]    6    7    8
#> [2,]    7    8    9
#> 
do.index(a,f2)
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    1    4
#> [2,]    1    2    5
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    5
#> [2,]    2    3    6
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]    4    5    8
#> [2,]    5    6    9
#> 
#> , , 4
#> 
#>      [,1] [,2] [,3]
#> [1,]    9   10   13
#> [2,]   10   11   14
#> 
do.index(a,f3)    # same as  apltake(b,dim(a))
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    0    1
#> [2,]    2    0    0
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    0    1
#> [2,]    0    1    3
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]    3    1    0
#> [2,]    2    1    0
#> 
#> , , 4
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    3    1    1
#> 
do.index(a,f4)    # Male/female toilets at NOC
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    0    1    0
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    1    0
#> [2,]    1    0    1
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    0    1    0
#> 
#> , , 4
#> 
#>      [,1] [,2] [,3]
#> [1,]    0    1    0
#> [2,]    1    0    1
#> 
do.index(a,f5,2)  # same as  arow(a,2)
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> 
#> , , 4
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> 
```
