# magic hypercubes

Returns `TRUE` if a hypercube is semimagic, magic, perfect

## Usage

``` r
is.semimagichypercube(a, give.answers=FALSE, func=sum, boolean=FALSE, ...)
is.diagonally.correct(a, give.answers = FALSE, func=sum, boolean=FALSE, ...) 
is.magichypercube(a, give.answers = FALSE, func=sum, boolean=FALSE, ...) 
is.perfect(a, give.answers = FALSE, func=sum, boolean=FALSE)
is.latinhypercube(a, give.answers=FALSE)
is.alicehypercube(a,ndim,give.answers=FALSE, func=sum, boolean=FALSE)
```

## Arguments

- a:

  The hypercube (array) to be tested

- give.answers:

  Boolean, with `TRUE` meaning to also return the sums

- func:

  Function to be applied across each dimension

- ndim:

  In `is.alicehypercube()`, dimensionality of subhypercube to take sums
  over. See the details section

- boolean:

  Boolean, with `TRUE` meaning that the hypercube is deemed magic,
  semimagic, etc, if all applications of `func` evaluate to `TRUE`. If
  `boolean` is `FALSE`, the hypercube is magic etc if all applications
  of `func` are identical

- ...:

  Further arguments passed to `func()`

## Details

(Although apparently non-standard, here a hypercube is defined to have
dimension \\d\\ and order \\n\\—and thus has \\n^d\\ elements).

- A semimagic hypercube has all “rook's move” sums equal to the magic
  constant (that is, each \\\sum a\[i_1,i_2,\ldots,i\_{r-1},,i\_{r+1},
  \ldots,i_d\]\\ with \\1\leqslant r\leqslant d\\ is equal to the magic
  constant for all values of the \\i\\'s). In `is.semimagichypercube()`,
  if `give.answers` is `TRUE`, the sums returned are in the form of an
  array of dimension `c(rep(n,d-1),d)`. The first `d-1` dimensions are
  the coordinates of the projection of the summed elements onto the
  surface hypercube. The last dimension indicates the dimension along
  which the sum was taken over.

  Optional argument `func`, defaulting to
  [`sum()`](https://rdrr.io/r/base/sum.html), indicates the function to
  be taken over each of the `d` dimensions. Currently requires `func` to
  return a scalar.

- A Latin hypercube is one in which each line of elements whose
  coordinates differ in only one dimension comprises the numbers \\1\\
  to \\n\\ (or \\0\\ to \\n-1\\), not necessarily in that order. Each
  integer thus appears \\n^{d-1}\\ times.

- A magic hypercube is a semimagic hypercube with the additional
  requirement that all \\2^{d-1}\\ long (ie extreme point-to-extreme
  point) diagonals sum correctly. Correct diagonal summation is tested
  by `is.diagonally.correct()`; by specifying a function other than
  [`sum()`](https://rdrr.io/r/base/sum.html), criteria other than the
  diagonals returning the correct sum may be tested.

- An Alice hypercube is a different generalization of a semimagic square
  to higher dimensions. It is named for A. M. Hankin (“Alice”), who
  originally suggested it.

  A semimagic hypercube has all one-dimensional subhypercubes (ie lines)
  summing correctly. An Alice hypercube is one in which all
  `ndim`-dimensional subhypercubes have the same sum, where `ndim` is a
  fixed integer argument. Thus, if `a` is a hypercube of size \\n^d\\,
  `is.alicehypercube(a,ndim)` returns `TRUE` if all `n^{d-ndim}`
  subhypercubes have the same sum.

  For example, if `a` is four-dimensional with dimension \\5\times
  5\times 5\times 5\\ then `is.alicehypercube(a,1)` is `TRUE` if and
  only if `a` is a semimagic hypercube: all \\{4\choose 1}5^3=500\\
  one-dimensional subhypercubes have the same sum. Then
  `is.alicehypercube(a,2)` is `TRUE` if all 2-dimensional subhypercubes
  (ie all \\{4\choose 2}\times 5^2=150\\ of the \\5\times 5\\ squares,
  for example `a[,2,4,]` and `a[1,1,,]`) have the same sum. Then
  `is.alicehypercube(a,3)` means that all 3d subhypercubes (ie all
  \\{4\choose 3}\times 5^1=20\\ of the \\5\times 5\times 5\\ cubes, for
  example `a[,,1,]` and `a[4,,,]`) have the same sum. For any hypercube
  `a`, `is.alicehypercube(a,dim(a))` returns `TRUE`.

  A semimagic hypercube is an Alice hypercube for any value of `ndim`.

- A perfect magic hypercube (use `is.perfect()`) is a magic hypercube
  with all nonbroken diagonals summing correctly. This is a seriously
  restrictive requirement for high dimensional hypercubes. As yet, this
  function does not take a `give.answers` argument.

- A pandiagonal magic hypercube, also Nasik hypercube (or sometimes just
  a perfect hypercube) is a semimagic hypercube with all diagonals,
  including broken diagonals, summing correctly. This is not
  implemented.

The terminology in this area is pretty confusing.

In `is.magichypercube()`, if argument `give.answers=TRUE` then a list is
returned. The first element of this list is Boolean with `TRUE` if the
array is a magic hypercube. The second element and third elements are
answers from`is.semimagichypercube()` and `is.diagonally.correct()`
respectively.

In `is.diagonally.correct()`, if argument `give.answers=TRUE`, the
function also returns an array of dimension `c(q,rep(2,d))` (that is,
\\q\times 2^d\\ elements), where \\q\\ is the length of `func()` applied
to a long diagonal of `a` (if \\q=1\\, the first dimension is dropped).
If \\q=1\\, then in dimension `d` having index 1 means `func()` is
applied to elements of `a` with the \\d^{\rm th}\\ dimension running
over `1:n`; index 2 means to run over `n:1`. If \\q\>1\\, the index of
the first dimension gives the index of `func()`, and subsequent
dimensions have indices of 1 or 2 as above and are interpreted in the
same way.

An example of a function for which these two are not identical is given
below.

If `func=f` where `f` is a function returning a vector of length `i`,
`is.diagonally.correct()` returns an array `out` of dimension
`c(i,rep(2,d))`, with `out[,i_1,i_2,...,i_d]` being `f(x)` where `x` is
the appropriate long diagonal. Thus the \\2^d\\ equalities
`out[,i_1,i_2,...,i_d]==out[,3-i_1,3-i_2,...,3-i_d]` hold if and only if
`identical(f(x),f(rev(x)))` is `TRUE` for each long diagonal (a
condition met, for example, by
[`sum()`](https://rdrr.io/r/base/sum.html) but not by the identity
function or `function(x){x[1]}`).

## References

- R. K. S. Hankin 2005. “Recreational mathematics with R: introducing
  the magic package”. R news, 5(1)

- Richards 1980. “Generalized magic cubes”. *Mathematics Magazine*,
  volume 53, number 2, (March).

## Author

Robin K. S. Hankin

## Note

On this page, “subhypercube” is restricted to rectangularly-oriented
subarrays; see the note at `subhypercubes`.

Not all subhypercubes of a magic hypercube are necessarily magic! (for
example, consider a 5-dimensional magic hypercube `a`. The square `b`
defined by `a[1,1,1,,]` might not be magic: the diagonals of `b` are not
covered by the definition of a magic hypercube). Some subhypercubes of a
magic hypercube are not even semimagic: see below for an example.

Even in three dimensions, being perfect is pretty bad. Consider a
\\5\times5\times 5\\ (ie three dimensional), cube. Say
`a=magiccube.2np1(2)`. Then the square defined by
`sapply(1:n,function(i){a[,i,6-i]}, simplify=TRUE)`, which is a
subhypercube of `a`, is not even semimagic: the rowsums are incorrect
(the colsums must sum correctly because `a` is magic). Note that the
diagonals of this square are two of the “extreme point-to-point”
diagonals of `a`.

A pandiagonal magic hypercube (or sometimes just a perfect hypercube) is
semimagic and in addition the sums of all diagonals, including broken
diagonals, are correct. This is one seriously bad-ass requirement. I
reckon that is a total of \\\frac{1}{2}\left( 3^d-1\right)\cdot
n^{d-1}\\ correct summations. This is not coded up yet; I can't see how
to do it in anything like a vectorized manner.

## See also

[`is.magic`](https://robinhankin.github.io/magic/reference/is.magic.md),
[`allsubhypercubes`](https://robinhankin.github.io/magic/reference/allsubhypercubes.md),
[`hendricks`](https://robinhankin.github.io/magic/reference/hendricks.md)

## Examples

``` r
library(abind)
is.semimagichypercube(magiccube.2np1(1))
#> [1] TRUE
is.semimagichypercube(magichypercube.4n(1,d=4))
#> [1] TRUE

is.perfect(magichypercube.4n(1,d=4))
#> [1] FALSE

# Now try an array with minmax(dim(a))==FALSE:
a <- abind(magiccube.2np1(1),magiccube.2np1(1),along=2)
is.semimagichypercube(a,g=TRUE)$rook.sums
#> [[1]]
#>      [,1] [,2] [,3]
#> [1,]   42   42   42
#> [2,]   42   42   42
#> [3,]   42   42   42
#> [4,]   42   42   42
#> [5,]   42   42   42
#> [6,]   42   42   42
#> 
#> [[2]]
#>      [,1] [,2] [,3]
#> [1,]   84   84   84
#> [2,]   84   84   84
#> [3,]   84   84   84
#> 
#> [[3]]
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]   42   42   42   42   42   42
#> [2,]   42   42   42   42   42   42
#> [3,]   42   42   42   42   42   42
#> 

# is.semimagichypercube() takes further arguments:
mymax <- function(x,UP){max(c(x,UP))}
not_mag  <- array(1:81,rep(3,4))
is.semimagichypercube(not_mag,func=mymax,UP=80)  # FALSE
#> [1] FALSE
is.semimagichypercube(not_mag,func=mymax,UP=81)  # TRUE
#> [1] TRUE


a2 <- magichypercube.4n(m=1,d=4)
is.diagonally.correct(a2)
#> [1] TRUE
is.diagonally.correct(a2,g=TRUE)$diag.sums
#> , , 1, 1
#> 
#>      [,1] [,2]
#> [1,]  514  514
#> [2,]  514  514
#> 
#> , , 2, 1
#> 
#>      [,1] [,2]
#> [1,]  514  514
#> [2,]  514  514
#> 
#> , , 1, 2
#> 
#>      [,1] [,2]
#> [1,]  514  514
#> [2,]  514  514
#> 
#> , , 2, 2
#> 
#>      [,1] [,2]
#> [1,]  514  514
#> [2,]  514  514
#> 

## To extract corner elements (note func(1:n) != func(n:1)):
is.diagonally.correct(a2,func=function(x){x[1]},g=TRUE)$diag.sums 
#> , , 1, 1
#> 
#>      [,1] [,2]
#> [1,]    1   13
#> [2,]    4   16
#> 
#> , , 2, 1
#> 
#>      [,1] [,2]
#> [1,]   49   61
#> [2,]   52   64
#> 
#> , , 1, 2
#> 
#>      [,1] [,2]
#> [1,]  193  205
#> [2,]  196  208
#> 
#> , , 2, 2
#> 
#>      [,1] [,2]
#> [1,]  241  253
#> [2,]  244  256
#> 


#Now for a subhypercube of a magic hypercube that is not semimagic:
is.magic(allsubhypercubes(magiccube.2np1(1))[[10]])
#> [1] FALSE

data(hendricks)
is.perfect(hendricks)
#> [1] TRUE


#note that Hendricks's magic cube also has many broken diagonals summing
#correctly:

a <- allsubhypercubes(hendricks)
ld <- function(a){length(dim(a))}

jj <- unlist(lapply(a,ld))
f <- function(i){is.perfect(a[[which(jj==2)[i]]])}
all(sapply(1:sum(jj==2),f))
#> [1] TRUE

#but this is NOT enough to ensure that it is pandiagonal (but I
#think hendricks is pandiagonal).


is.alicehypercube(magichypercube.4n(1,d=5),4,give.answers=TRUE)
#> $answer
#> [1] TRUE
#> 
#> $alice.sums
#>        [,1]   [,2]   [,3]   [,4]   [,5]
#> [1,] 131200 131200 131200 131200 131200
#> [2,] 131200 131200 131200 131200 131200
#> [3,] 131200 131200 131200 131200 131200
#> [4,] 131200 131200 131200 131200 131200
#> 
```
