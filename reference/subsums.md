# Sums of submatrices

Returns the sums of submatrices of an array; multidimensional moving
window averaging

## Usage

``` r
subsums(a, p, func = "sum", wrap = TRUE, pad = 0)
```

## Arguments

- a:

  Array to be analysed

- p:

  Argument specifying the subarrays to be summed. If a vector of length
  greater than one, it is assumed to be of length `d=length(dim(a))`,
  and is interpreted to be the dimensions of the subarrays, with the
  size of the window's \\n{^{\rm th}}\\ dimension being `a[n]`. If the
  length of `p` is one, recycling is used.

  If not a vector, is assumed to be a matrix with `d` columns, each row
  representing the coordinates of the elements to be summed. See
  examples.

- func:

  Function to be applied over the elements of the moving window. Default
  value of `sum` gives the sum as used in
  [`is.2x2.correct()`](https://robinhankin.github.io/magic/reference/is.magic.md);
  other choices might be `mean`, `prod`, or `max`.

  If `sum=""`, return the array of dimension `c(dim(a), prod(p))` where
  each hyperplane is a shifted version of `a`.

- wrap:

  Boolean, with default value of `TRUE` meaning to view array `a` as a
  n-dimensional torus. Thus, if `x=subsums(a, p, wrap=TRUE)`, and if
  `dim(a) = c(a_1, ..., a_d)` then `x[a_1, ..., a_d]` is the sum of all
  corner elements of `a`.

  If `FALSE`, do not wrap `a` and return an array of dimension
  `dim(a) + p - 1`.

- pad:

  If `wrap` is `TRUE`, `pad` is the value used to pad the array with.
  Use a “neutral” value here; for example, if `func=sum`, then use 0; if
  `max`, use \\-\infty\\.

## Details

The offset is specified so that
`allsums(a, v)[1, 1, ..., 1] = sum(a[1:v[1], 1:v[2], ..., 1:v[n]])`,
where `n = length(dim(a))`.

Function `subsums()` is used in
[`is.2x2.correct()`](https://robinhankin.github.io/magic/reference/is.magic.md)
and
[`is.diagonally.correct()`](https://robinhankin.github.io/magic/reference/is.magichypercube.md).

## Author

Robin K. S. Hankin

## Examples

``` r
  data(Ollerenshaw)
  subsums(Ollerenshaw,c(2,2))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
#>  [1,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [2,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [3,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [4,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [5,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [6,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [7,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [8,]  286  286  286  286  286  286  286  286  286   286   286   286
#>  [9,]  286  286  286  286  286  286  286  286  286   286   286   286
#> [10,]  286  286  286  286  286  286  286  286  286   286   286   286
#> [11,]  286  286  286  286  286  286  286  286  286   286   286   286
#> [12,]  286  286  286  286  286  286  286  286  286   286   286   286
  subsums(Ollerenshaw[,1:10],c(2,2))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]  286  286  286  286  286  286  286  286  286   286
#>  [2,]  286  286  286  286  286  286  286  286  286   286
#>  [3,]  286  286  286  286  286  286  286  286  286   286
#>  [4,]  286  286  286  286  286  286  286  286  286   286
#>  [5,]  286  286  286  286  286  286  286  286  286   286
#>  [6,]  286  286  286  286  286  286  286  286  286   286
#>  [7,]  286  286  286  286  286  286  286  286  286   286
#>  [8,]  286  286  286  286  286  286  286  286  286   286
#>  [9,]  286  286  286  286  286  286  286  286  286   286
#> [10,]  286  286  286  286  286  286  286  286  286   286
#> [11,]  286  286  286  286  286  286  286  286  286   286
#> [12,]  286  286  286  286  286  286  286  286  286   286
  subsums(Ollerenshaw, matrix(c(0,6),2,2)) # effectively, is.bree.correct()
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
#>  [1,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [2,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [3,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [4,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [5,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [6,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [7,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [8,]  143  143  143  143  143  143  143  143  143   143   143   143
#>  [9,]  143  143  143  143  143  143  143  143  143   143   143   143
#> [10,]  143  143  143  143  143  143  143  143  143   143   143   143
#> [11,]  143  143  143  143  143  143  143  143  143   143   143   143
#> [12,]  143  143  143  143  143  143  143  143  143   143   143   143

  # multidimensional example.  
  a <- array(1,c(3,4,2))
  subsums(a,2)             # note that p=2 is equivalent to p=c(2,2,2);
#> , , 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]    8    8    8    8
#> [2,]    8    8    8    8
#> [3,]    8    8    8    8
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]    8    8    8    8
#> [2,]    8    8    8    8
#> [3,]    8    8    8    8
#> 
                           # all elements should be identical

  subsums(a,2,wrap=FALSE)  #note "middle" elements > "outer" elements
#> , , 1
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    2    2    2    1
#> [2,]    2    4    4    4    2
#> [3,]    2    4    4    4    2
#> [4,]    1    2    2    2    1
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    2    4    4    4    2
#> [2,]    4    8    8    8    4
#> [3,]    4    8    8    8    4
#> [4,]    2    4    4    4    2
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    2    2    2    1
#> [2,]    2    4    4    4    2
#> [3,]    2    4    4    4    2
#> [4,]    1    2    2    2    1
#> 


  #Example of nondefault function:
  x <- matrix(1:42,6,7)
  subsums(x,2,func="max",pad=Inf,wrap=TRUE)  
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    8   14   20   26   32   38   38
#> [2,]    9   15   21   27   33   39   39
#> [3,]   10   16   22   28   34   40   40
#> [4,]   11   17   23   29   35   41   41
#> [5,]   12   18   24   30   36   42   42
#> [6,]   12   18   24   30   36   42   42
  subsums(x,2,func="max",pad=Inf,wrap=FALSE)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
#> [1,]  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf
#> [2,]  Inf    8   14   20   26   32   38  Inf
#> [3,]  Inf    9   15   21   27   33   39  Inf
#> [4,]  Inf   10   16   22   28   34   40  Inf
#> [5,]  Inf   11   17   23   29   35   41  Inf
#> [6,]  Inf   12   18   24   30   36   42  Inf
#> [7,]  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf
```
