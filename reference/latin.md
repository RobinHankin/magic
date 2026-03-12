# Random latin squares

Various functionality for generating random latin squares. Function
`latin()` itself is a synonym for
[`circulant()`](https://robinhankin.github.io/magic/reference/circulant.md)
and is documented at `circulant.Rd`.

## Usage

``` r
incidence(a)
is.incidence(a, include.improper)
is.incidence.improper(a)
unincidence(a)
inc_to_inc(a)
another_latin(a)
another_incidence(i)
rlatin(n,size=NULL,start=NULL,burnin=NULL)
```

## Arguments

- a:

  A latin square

- i:

  An incidence array

- n,include.improper,size,start,burnin:

  Various control arguments; see details section

## Details

- Function `latin()`, when called with a

- Function `incidence()` takes an integer array (specifically, a latin
  square) and returns the incidence array as per Jacobson and Matthew
  1996

- Function `is.incidence()` tests for an array being an incidence array;
  if argument `include.improper` is `TRUE`, admit an improper array

- Function `is.incidence.improper()` tests for an array being an
  improper array

- Function `unincidence()` converts an incidence array to a latin square

- Function `another_latin()` takes a latin square and returns a
  different latin square

- Function `another_incidence()` takes an incidence array and returns a
  different incidence array

- Function `rlatin()` generates a (Markov) sequence of random latin
  squares, arranged in a 3D array. Argument `n` specifies how many to
  generate; argument `size` gives the size of latin squares generated;
  argument `start` gives the start latin square (it must be latin and is
  checked with
  [`is.latin()`](https://robinhankin.github.io/magic/reference/is.magic.md));
  argument `burnin` gives the burn-in value (number of Markov steps to
  discard).

  Default value of `NULL` for argument `size` means to take the size of
  argument `start`; default value of `NULL` for argument `start` means
  to use `circulant(size)`

  As a special case, if argument `size` and `start` both take the
  default value of `NULL`, then argument `n` is interpreted as the size
  of a single random latin square to be returned; the other arguments
  take their default values. This ensures that “`rlatin(n)`” returns a
  single random \\n\times n\\ latin square.

A latin square is an \\n\\-by-\\n\\ matrix containing integers \\1\\ to
\\n\\ arranged so each number occurs exactly once in each row and once
in each column.

From Jacobson and Matthew 1996, an \\n\times n\\ latin square LS is
equivalent to an \\n\times n\times n\\ array A with entries 0 or 1; the
dimensions of A are identified with the rows, columns and symbols of LS;
a 1 appears in cell \\(r,c,s)\\ of A iffi the symbol \\s\\ appears in
row \\r\\, column \\s\\ of LS. Jacobson and Matthew call this an
incidence cube.

The notation is readily generalized to latin hypercubes and
`incidence()` is dimensionally vectorized.

An improper incidence cube is an incidence cube that includes a single
\\-1\\ entry; all other entries must be 0 or 1; and all line sums must
equal 1.

## References

M. T. Jacobson and P. Matthews 1996. “Generating uniformly distributed
random latin squares”. *Journal of Combinatorial Designs*, volume 4, No.
6, pp405–437

## Author

Robin K. S. Hankin

## See also

[`is.magic`](https://robinhankin.github.io/magic/reference/is.magic.md),[`circulant`](https://robinhankin.github.io/magic/reference/circulant.md)

## Examples

``` r
rlatin(5)
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    5    3    4    2    1
#> [2,]    4    2    3    1    5
#> [3,]    2    1    5    3    4
#> [4,]    1    5    2    4    3
#> [5,]    3    4    1    5    2
rlatin(n=2, size=4, burnin=10)
#> , , 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]    3    2    1    4
#> [2,]    1    4    3    2
#> [3,]    2    3    4    1
#> [4,]    4    1    2    3
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]    3    2    1    4
#> [2,]    1    4    2    3
#> [3,]    2    3    4    1
#> [4,]    4    1    3    2
#> 

# An example that allows one to optimize an objective function
# [here f()] over latin squares:
gr <- function(x){ another_latin(matrix(x,7,7)) }
set.seed(0)
index <- sample(49,20)
f <- function(x){ sum(x[index])}
jj <- optim(par=as.vector(latin(7)), fn=f, gr=gr, method="SANN", control=list(maxit=10))
best_latin <- matrix(jj$par,7,7)
print(best_latin)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    1    6    3    4    5    2    7
#> [2,]    5    1    2    3    4    7    6
#> [3,]    7    2    4    6    3    1    5
#> [4,]    6    5    7    1    2    3    4
#> [5,]    4    7    5    2    1    6    3
#> [6,]    3    4    1    7    6    5    2
#> [7,]    2    3    6    5    7    4    1
print(f(best_latin))
#> [1] 68

#compare starting value:
f(circulant(7))
#> [1] 73

```
