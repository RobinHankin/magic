# Comparison of two magic squares

Compares two magic squares according to Frenicle's method. Mnemonic is
the old Fortran “.GT.” (for “Greater Than”) comparison et seq.

To compare magic square `a` with magic square `b`, their elements are
compared in rowwise order: `a[1,1]` is compared with `b[1,1]`, then
`a[1,2]` with `b[1,2]`, up to `a[n,n]`. Consider the first element that
is different, say `[i,j]`. Then `a<b` if `a[i,j]<b[i,j]`.

The generalization to hypercubes is straightforward: comparisons are
carried out natural order.

## Usage

``` r
eq(m1, m2)
ne(m1, m2)
gt(m1, m2)
lt(m1, m2)
ge(m1, m2)
le(m1, m2)
m1 %eq% m2
m1 %ne% m2
m1 %gt% m2
m1 %lt% m2
m1 %ge% m2
m1 %le% m2
```

## Arguments

- m1:

  First magic square

- m2:

  Second magic square

## Author

Robin K. S. Hankin

## Note

Rather clumsy function definition due to the degenerate case of testing
two identical matrices (`min(NULL)` is undefined).

The two arguments are assumed to be matrices of the same size. If not,
an error is given.

## See also

[`as.standard`](https://robinhankin.github.io/magic/reference/as.standard.md)

## Examples

``` r
magic(4) %eq% magic.4n(1)
#> [1] FALSE
eq(magic(4) , magic.4n(1))
#> [1] FALSE
```
