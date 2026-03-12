# Replacements for APL functions take and drop

Replacements for APL functions take and drop

## Usage

``` r
apldrop(a, b, give.indices=FALSE)
apldrop(a, b) <- value
apltake(a, b, give.indices=FALSE)
apltake(a, b) <- value
```

## Arguments

- a:

  Array

- b:

  Vector of number of indices to take/drop. Length of `b` should not
  exceed `length(dim(a))`; if it does, an error is returned

- give.indices:

  Boolean, with default `FALSE` meaning to return the appropriate subset
  of array `a`, and `TRUE` meaning to return the list of the selected
  elements in each of the dimensions. Setting to `TRUE` is not really
  intended for the end-user, but is used in the code of `apltake<-()`
  and `apldrop<-()`

- value:

  elements to replace

## Details

`apltake(a,b)` returns an array of the same dimensionality as `a`. Along
dimension `i`, if `b[i]>0`, the first `b[i]` elements are retained; if
`b[i]<0`, the last `b[i]` elements are retained.

`apldrop(a,b)` returns an array of the same dimensionality as `a`. Along
dimension `i`, if `b[i]>0`, the first `b[i]` elements are dropped if
`b[i]<0`, the last `b[i]` elements are dropped.

These functions do not drop singleton dimensions. Use
[`drop()`](https://rdrr.io/r/base/drop.html) if this is desired.

## Author

Robin K. S. Hankin

## Examples

``` r
a <- magichypercube.4n(m=1)
apltake(a,c(2,3,2))
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]   64    5    9
#> [2,]    2   59   55
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]   17   44   40
#> [2,]   47   22   26
#> 
apldrop(a,c(1,1,2))
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]   38   42   19
#> [2,]   39   43   18
#> [3,]   25   21   48
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]   11    7   62
#> [2,]   10    6   63
#> [3,]   56   60    1
#> 

b <- matrix(1:30,5,6)
apldrop(b,c(1,-2)) <- -1

b <- matrix(1:110,10,11)
apltake(b,2) <- -1
apldrop(b,c(5,-7)) <- -2
b
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11]
#>  [1,]   -1   -1   -1   -1   -1   -1   -1   -1   -1    -1    -1
#>  [2,]   -1   -1   -1   -1   -1   -1   -1   -1   -1    -1    -1
#>  [3,]    3   13   23   33   43   53   63   73   83    93   103
#>  [4,]    4   14   24   34   44   54   64   74   84    94   104
#>  [5,]    5   15   25   35   45   55   65   75   85    95   105
#>  [6,]   -2   -2   -2   -2   46   56   66   76   86    96   106
#>  [7,]   -2   -2   -2   -2   47   57   67   77   87    97   107
#>  [8,]   -2   -2   -2   -2   48   58   68   78   88    98   108
#>  [9,]   -2   -2   -2   -2   49   59   69   79   89    99   109
#> [10,]   -2   -2   -2   -2   50   60   70   80   90   100   110
```
