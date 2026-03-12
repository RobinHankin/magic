# Magic squares of odd order

Function to create magic squares of odd order

## Usage

``` r
magic.2np1(m, ord.vec = c(-1, 1), break.vec = c(1, 0), start.point = NULL)
```

## Arguments

- m:

  creates a magic square of order \\n=2m+1\\

- ord.vec:

  ordinary vector. Default value of `c(-1,1)` corresponds to the usual
  northeast direction

- break.vec:

  break vector. Default of `c(1,0)` corresponds to the usual south
  direction

- start.point:

  Starting position for the method (ie coordinates of unity). Default
  value of NULL corresponds to row 1, column `m`

## References

Written up in loads of places. The method (at least with the default
ordinary and break vectors) seems to have been known since at least the
Renaissance.

Benson and Jacoby, and the Mathematica website, discuss the problem with
nondefault ordinary and break vectors.

## Author

Robin K. S. Hankin

## See also

[`magic`](https://robinhankin.github.io/magic/reference/magic.md),
[`magic.prime`](https://robinhankin.github.io/magic/reference/magic.prime.md)

## Examples

``` r
magic.2np1(1)
#>      [,1] [,2] [,3]
#> [1,]    8    1    6
#> [2,]    3    5    7
#> [3,]    4    9    2
f <- function(n){is.magic(magic.2np1(n))}
all(sapply(1:20,f))
#> [1] TRUE

is.panmagic(magic.2np1(5,ord.vec=c(2,1),break.vec=c(1,3)))
#> [1] TRUE
```
