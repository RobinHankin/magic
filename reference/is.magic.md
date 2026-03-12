# Various tests for the magicness of a square

Returns `TRUE` if the square is magic, semimagic, panmagic, associative,
normal. If argument `give.answers` is `TRUE`, also returns additional
information about the sums.

## Usage

``` r
is.magic(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.panmagic(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.pandiagonal(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.semimagic(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.semimagic.default(m)
is.associative(m)
is.normal(m)
is.sparse(m)
is.mostperfect(m,give.answers=FALSE)
is.2x2.correct(m,give.answers=FALSE)
is.bree.correct(m,give.answers=FALSE)
is.latin(m,give.answers=FALSE)
is.antimagic(m, give.answers = FALSE, func=sum) 
is.totally.antimagic(m, give.answers = FALSE, func=sum)
is.heterosquare(m, func=sum) 
is.totally.heterosquare(m, func=sum)
is.sam(m)
is.stam(m)
```

## Arguments

- m:

  The square to be tested

- give.answers:

  Boolean, with `TRUE` meaning return additional information about the
  sums (see details)

- func:

  A function that is evaluated for each row, column, and unbroken
  diagonal

- boolean:

  Boolean, with `TRUE` meaning that the square is deemed magic,
  semimagic, etc, if all applications of `func` evaluate to `TRUE`. If
  `boolean` is `FALSE`, square `m` is magic etc if all applications of
  `func` are identical

## Details

- A semimagic square is one all of whose row sums equal all its
  columnwise sums (ie the magic constant).

- A magic square is a semimagic square with the sum of both unbroken
  diagonals equal to the magic constant.

- A panmagic square is a magic square all of whose broken diagonals sum
  to the magic constant. Ollerenshaw calls this a “pandiagonal” square.

- A most-perfect square has all 2-by-2 arrays anywhere within the square
  summing to \\2S\\ where \\S=n^2+1\\; and all pairs of integers \\n/2\\
  distant along the same major (NW-SE) diagonal sum to \\S\\ (note that
  the \\S\\ used here differs from Ollerenshaw's because her squares are
  numbered starting at zero). The first condition is tested by
  `is.2x2.correct()` and the second by `is.bree.correct()`.

  All most-perfect squares are panmagic.

- A normal square is one that contains \\n^2\\ consecutive integers
  (typically starting at 0 or 1).

- A sparse matrix is one whose nonzero entries are consecutive integers,
  starting at 1.

- An associative square (also regular square) is a magic square in which
  \\a\_{i,j}+a\_{n+1-i,n+1-j}=n^2+1\\. Note that an associative
  semimagic square is magic; see also
  [`is.square.palindromic()`](https://robinhankin.github.io/magic/reference/is.square.palindromic.md).
  The definition extends to magic hypercubes: a hypercube `a` is
  associative if `a+arev(a)` is constant.

- An ultramagic square is pandiagonal and associative.

- A latin square of size \\n\times n\\ is one in which each column and
  each row comprises the integers 1 to n (not necessarily in that
  order). Function `is.latin()` is a wrapper for
  [`is.latinhypercube()`](https://robinhankin.github.io/magic/reference/is.magichypercube.md)
  because there is no natural way to present the extra information given
  when `give.answers` is `TRUE` in a manner consistent with the other
  functions documented here.

- An antimagic square is one whose row sums and column sums are
  consecutive integers; a totally antimagic square is one whose row
  sums, column sums, and two unbroken diagonals are consecutive
  integers. Observe that an antimagic square is not necessarily totally
  antimagic, and vice-versa.

- A heterosquare has all rowsums and column sums distinct; a totally
  heterosquare \[NB nonstandard terminology\] has all rowsums,
  columnsums, and two long diagonals distinct.

- A square is sam (or SAM) if it is sparse and antimagic; it is stam (or
  STAM) if it is sparse and totally antimagic. See documentation at
  `SAM`.

## Value

Returns `TRUE` if the square is semimagic, etc. and `FALSE` if not.

If `give.answers` is taken as an argument and is `TRUE`, return a list
of at least five elements. The first element of the list is the answer:
it is `TRUE` if the square is (semimagic, magic, panmagic) and `FALSE`
otherwise. Elements 2-5 give the result of a call to
[`allsums()`](https://robinhankin.github.io/magic/reference/allsums.md),
viz: rowwise and columnwise sums; and broken major (ie NW-SE) and minor
(ie NE-SW) diagonal sums.

Function `is.bree.correct()` also returns the sums of elements distant
\\n/2\\ along a major diagonal (`diag.sums`); and function
`is.2x2.correct()` returns the sum of each \\2\times 2\\ submatrix
(`tbt.sums`); for other size windows use
[`subsums()`](https://robinhankin.github.io/magic/reference/subsums.md)
directly. Function `is.mostperfect()` returns both of these.

Function `is.semimagic.default()` returns `TRUE` if the argument is
semimagic \[with respect to [`sum()`](https://rdrr.io/r/base/sum.html)\]
using a faster method than `is.semimagic()`.

## Note

Functions that take a `func` argument apply that function to each row,
column, and diagonal as necessary. If `func` takes its default value of
[`sum()`](https://rdrr.io/r/base/sum.html), the sum will be returned; if
[`prod()`](https://rdrr.io/r/base/prod.html), the product will be
returned, and so on. There are many choices for this argument that
produce interesting tests; consider `func=max`, for example. With this,
a “magic” square is one whose row, sum and (unbroken) diagonals have
identical maxima. Thus `diag(5)` is magic with respect to
[`max()`](https://rdrr.io/r/base/Extremes.html), but `diag(6)` isn't.

Argument `boolean` is designed for use with non-default values for the
`func` argument; for example, a latin square is semimagic with respect
to `func=function(x){all(diff(sort(x))==1)}`.

Function `is.magic()` is vectorized; if a list is supplied, the defaults
are assumed.

## References

<https://mathworld.wolfram.com/MagicSquare.html>

## Author

Robin K. S. Hankin

## See also

[`minmax`](https://robinhankin.github.io/magic/reference/minmax.md),[`is.perfect`](https://robinhankin.github.io/magic/reference/is.magichypercube.md),[`is.semimagichypercube`](https://robinhankin.github.io/magic/reference/is.magichypercube.md),[`sam`](https://robinhankin.github.io/magic/reference/sam.md)

## Examples

``` r
is.magic(magic(4))
#> [1] TRUE

is.magic(diag(7),func=max)  # TRUE
#> [1] TRUE
is.magic(diag(8),func=max)  # FALSE
#> [1] FALSE

stopifnot(is.magic(magic(3:8)))

is.panmagic(panmagic.4())
#> [1] TRUE
is.panmagic(panmagic.8())
#> [1] TRUE

data(Ollerenshaw)
is.mostperfect(Ollerenshaw)
#> [1] TRUE

proper.magic <- function(m){is.magic(m) & is.normal(m)}
proper.magic(magic(20))
#> [1] TRUE
```
