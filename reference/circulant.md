# Circulant matrices of any order

Creates and tests for circulant matrices of any order

## Usage

``` r
circulant(vec,doseq=TRUE)
is.circulant(m,dir=rep(1,length(dim(m))))
```

## Arguments

- vec,doseq:

  In `circulant()`, vector of elements of the first row. If `vec` is of
  length one, and `doseq` is `TRUE`, then interpret `vec` as the order
  of the matrix and return a circulant with first row `seq_len(vec)`

- m:

  In `is.circulant()`, matrix to be tested for circulantism

- dir:

  In `is.circulant()`, the direction of the diagonal. In a matrix, the
  default value (`c(1,1)`) traces the major diagonals

## Details

A matrix \\a\\ is circulant if all major diagonals, including broken
diagonals, are uniform; ie if \\a\_{ij}=a\_{kl}\\ when \\i-j=k-l\\
(modulo \\n\\). The standard values to use give `1:n` for the top row.

In function `is.circulant()`, for arbitrary dimensional arrays, the
default value for `dir` checks that
`a[v]==a[v+rep(1,d)]==...==a[v+rep((n-1),d)]` for all `v` (that is,
following lines parallel to the major diagonal); indices are passed
through
[`process()`](https://robinhankin.github.io/magic/reference/process.md).

For general `dir`, function `is.circulant()` checks that
`a[v]==a[v+dir]==a[v+2*dir]==...==a[v+(n-1)*d]` for all `v`.

A Toeplitz matrix is one in which `a[i,j]=a[i',j']` whenever
`|i-j|=|i'-j'|`. See function
[`toeplitz()`](https://rdrr.io/r/stats/toeplitz.html) of the `stats`
package for details.

If the elements of `vec` are distinct, `circulant()` will return a latin
square. Function
[`latin()`](https://robinhankin.github.io/magic/reference/latin.md) is a
synonym for `circulant()`, see `latin.Rd`.

## References

Arthur T. Benjamin and K. Yasuda. *Magic “Squares” Indeed!*, American
Mathematical Monthly, vol 106(2), pp152-156, Feb 1999

## Author

Robin K. S. Hankin

## See also

[`latin`](https://robinhankin.github.io/magic/reference/latin.md)

## Examples

``` r
circulant(5)
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    2    3    4    5
#> [2,]    5    1    2    3    4
#> [3,]    4    5    1    2    3
#> [4,]    3    4    5    1    2
#> [5,]    2    3    4    5    1
circulant(2^(0:4))
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    2    4    8   16
#> [2,]   16    1    2    4    8
#> [3,]    8   16    1    2    4
#> [4,]    4    8   16    1    2
#> [5,]    2    4    8   16    1
is.circulant(circulant(5))
#> [1] TRUE

 a <- outer(1:3,1:3,"+")%%3
 is.circulant(a)
#> [1] FALSE
 is.circulant(a,c(1,2))
#> [1] TRUE

 is.circulant(array(c(1:4,4:1),rep(2,3)))
#> [1] TRUE

 is.circulant(magic(5)%%5,c(1,-2))
#> [1] FALSE
```
