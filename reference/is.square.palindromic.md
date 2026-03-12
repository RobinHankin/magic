# Is a square matrix square palindromic?

Implementation of various properties presented in a paper by Arthur T.
Benjamin and K. Yasuda

## Usage

``` r
is.square.palindromic(m, base=10, give.answers=FALSE)
is.centrosymmetric(m)
is.persymmetric(m)
```

## Arguments

- m:

  The square to be tested

- base:

  Base of number expansion, defaulting to 10; not relevant for the
  “sufficient” part of the test

- give.answers:

  Boolean, with `TRUE` meaning to return additional information

## Details

The following tests apply to a general square matrix `m` of size
\\n\times n\\.

- A centrosymmetric square is one in which `a[i,j]=a[n+1-i,n+1-j]`; use
  `is.centrosymmetric()` to test for this (compare an *associative*
  square). Note that this definition extends naturally to hypercubes: a
  hypercube `a` is centrosymmetric if `all(a==arev(a))`.

- A persymmetric square is one in which `a[i,j]=a[n+1-j,n+1-i]`; use
  `is.persymmetric()` to test for this.

- A matrix is square palindromic if it satisfies the rather complicated
  conditions set out by Benjamin and Yasuda (see refs).

## Value

These functions return a list of Boolean variables whose value depends
on whether or not `m` has the property in question.

If argument `give.answers` takes the default value of `FALSE`, a Boolean
value is returned that shows whether the sufficient conditions are met.

If argument `give.answers` is `TRUE`, a detailed list is given that
shows the status of each individual test, both for the necessary and
sufficient conditions. The value of the second element (named
`necessary`) is the status of their Theorem 1 on page 154.

Note that the necessary conditions do not depend on the base `b`
(technically, neither do the sufficient conditions, for being a square
palindrome requires the sums to match for *every* base `b`. In this
implementation, “sufficient” is defined only with respect to a
particular base).

## References

Arthur T. Benjamin and K. Yasuda. *Magic “Squares” Indeed!*, American
Mathematical Monthly, vol 106(2), pp152-156, Feb 1999

## Author

Robin K. S. Hankin

## Note

Every associative square is square palindromic, according to Benjamin
and Yasuda.

Function `is.square.palindromic()` does not yet take a `give.answers`
argument as does, say,
[`is.magic()`](https://robinhankin.github.io/magic/reference/is.magic.md).

## Examples

``` r
is.square.palindromic(magic(3))
#> [1] TRUE
is.persymmetric(matrix(c(1,0,0,1),2,2))
#> [1] TRUE

#now try a circulant:
a <- matrix(0,5,5)
is.square.palindromic(circulant(10))  #should be TRUE
#> [1] TRUE
```
