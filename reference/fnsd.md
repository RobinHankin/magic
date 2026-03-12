# First non-singleton dimension

Given an array, returns the first non-singleton dimension. Useful for
emulating some of Matlab / Octave's multidimensional functions.

If `n` is supplied, return the first `n` nonsingleton dimensions.

## Usage

``` r
fnsd(a,n)
```

## Arguments

- a:

  An array

- n:

  Integer. Return the first `n` nonsingleton dimensions

## Value

Returns an integer vector with elements in the range `1` to
`length(dim(a))`.

## Author

Robin K. S. Hankin

## Note

Treats zero-extent dimensions as singletons.

Case `n=0` now treated sensibly (returns a zero-length vector).

## See also

[`arev`](https://robinhankin.github.io/magic/reference/arev.md)

## Examples

``` r
a <- array(1:24,c(1,1,1,1,2,1,3,4))
fnsd(a)
#> [1] 5
fnsd(a,2)
#> [1] 5 7
```
