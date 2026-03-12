# Binds arrays corner-to-corner

Array generalization of `blockdiag()`

## Usage

``` r
adiag(... , pad=as.integer(0), do.dimnames=TRUE)
adiag2(a, b, pad=as.integer(0), do.dimnames=TRUE)
```

## Arguments

- a, b, ...:

  Arrays to be joined

- pad:

  Value to pad array with; note default keeps integer status of arrays

- do.dimnames:

  Boolean, with default `TRUE` meaning to return dimnames if possible.
  Set to `FALSE` if performance is an issue

## Details

Function `adiag2()` binds two arrays together, corner-to-corner.
Function `adiag()` binds any number of arrays together. Because the
function is associative provided `pad` is of length 1, this page
discusses the two array case implemented by `adiag2()`.

If the first argument is a list, it is interpreted as a list of arrays
to be bound together.

Suppose `x <- adiag(a,b)` and `dim(a)=c(a_1,...,a_d)`,
`dim(b)=c(b_1,...,b_d)`. Then we have `all(dim(x)==dim(a)+dim(b))`; and
`x[1:a_1,...,1:a_d]==a` and
`x[(a_1+1):(a_1+b_1),...,(a_d+1):(a_d+b_d)]==b`.

Dimnames are preserved, if both arrays have non-null dimnames, and
`do.dimnames` is `TRUE`.

Argument `pad` is usually a length-one vector, but any vector is
acceptable; standard recycling is used. Be aware that the output array
(of dimension `dim(a)+dim(b)`) is filled with (copies of) `pad` *before*
`a` and `b` are copied. This can be confusing.

## Value

Returns an array of dimensions `dim(a)+dim(b)` as described above.

## Author

Peter Wolf with some additions by Robin Hankin

## Note

In `adiag(a,b)`, if `a` is a length-one vector, it is coerced to an
array of dimensions `rep(1,length(dim(b)))`; likewise `b`. If both `a`
and `b` are length-one vectors, return `diag(c(a,b))`.

If `a` and `b` are arrays, function `adiag()` requires
`length(dim(a))==length(dim(b))` (the function does not guess which
dimensions have been dropped; see examples section). In particular, note
that vectors are not coerced except if of length one.

`adiag()` is used when padding magic hypercubes in the context of
evaluating subarray sums.

## See also

[`subsums`](https://robinhankin.github.io/magic/reference/subsums.md),
[`apad`](https://robinhankin.github.io/magic/reference/apad.md)

## Examples

``` r
 a <- array( 1,c(2,2))
 b <- array(-1,c(2,2))
 adiag(a,b)
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    1    0    0
#> [2,]    1    1    0    0
#> [3,]    0    0   -1   -1
#> [4,]    0    0   -1   -1

 ## dropped dimensions can count:

 b2 <- b1 <- b
 dim(a) <- c(2,1,2)
 dim(b1) <- c(2,2,1)
 dim(b2) <- c(1,2,2)

 dim(adiag(a,b1))
#> [1] 4 3 3
 dim(adiag(a,b2))
#> [1] 3 3 4

## dimnames are preserved if not null:

a <- matrix(1,2,2,dimnames=list(col=c("red","blue"),size=c("big","small"))) 
b <- 8
dim(b) <- c(1,1)
dimnames(b) <- list(col=c("green"),size=c("tiny"))
adiag(a,b)   #dimnames preserved
#>        size
#> col     big small tiny
#>   red     1     1    0
#>   blue    1     1    0
#>   green   0     0    8
adiag(a,8)   #dimnames lost because second argument has none.
#>      [,1] [,2] [,3]
#> [1,]    1    1    0
#> [2,]    1    1    0
#> [3,]    0    0    8

## non scalar values for pad can be confusing:
q <- matrix(0,3,3)
adiag(q,q,pad=1:4)
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    0    0    0    3    1    3
#> [2,]    0    0    0    4    2    4
#> [3,]    0    0    0    1    3    1
#> [4,]    4    2    4    0    0    0
#> [5,]    1    3    1    0    0    0
#> [6,]    2    4    2    0    0    0

## following example should make the pattern clear:
adiag(q,q,pad=1:36)
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    0    0    0   19   25   31
#> [2,]    0    0    0   20   26   32
#> [3,]    0    0    0   21   27   33
#> [4,]    4   10   16    0    0    0
#> [5,]    5   11   17    0    0    0
#> [6,]    6   12   18    0    0    0


# Now, a use for arrays with dimensions of zero extent:
z <- array(dim=c(0,3))
colnames(z) <- c("foo","bar","baz")

adiag(a,z)        # Observe how this has
#>       size
#> col    big small foo bar baz
#>   red    1     1   0   0   0
#>   blue   1     1   0   0   0
                  # added no (ie zero) rows to "a" but
                  # three extra columns filled with the pad value

adiag(a,t(z))
#>       size
#> col    big small
#>   red    1     1
#>   blue   1     1
#>   foo    0     0
#>   bar    0     0
#>   baz    0     0
adiag(z,t(z))     # just the pad value
#>     foo bar baz
#> foo   0   0   0
#> bar   0   0   0
#> baz   0   0   0
```
