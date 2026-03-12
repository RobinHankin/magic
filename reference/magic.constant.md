# Magic constant of a magic square or hypercube

Returns the magic constant: that is, the common sum for all rows,
columns and (broken) diagonals of a magic square or hypercube

## Usage

``` r
magic.constant(n,d=2,start=1)
```

## Arguments

- n:

  Order of the square or hypercube

- d:

  Dimension of hypercube, defaulting to `d=2` (a square)

- start:

  Start value. Common values are 0 and 1

## Details

If `n` is an integer, interpret this as the order of the square or
hypercube; return \\n({\rm start}+n^d-1)/2\\.

If `n` is a square or hypercube, return the magic constant for a normal
array (starting at 1) of the same dimensions as `n`.

## Author

Robin K. S. Hankin

## See also

[`magic`](https://robinhankin.github.io/magic/reference/magic.md)

## Examples

``` r
magic.constant(4)
#> [1] 34
```
