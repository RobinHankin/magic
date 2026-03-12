# Rotates an array about two specified dimensions

Rotates an array about two specified dimensions by any number of 90
degree turns

## Usage

``` r
arot(a, rights = 1,pair=1:2)
```

## Arguments

- a:

  The array to be rotated

- rights:

  Integer; number of right angles to turn

- pair:

  A two-element vector containing the dimensions to rotate with default
  meaning to rotate about the first two dimensions

## Author

Robin K. S. Hankin

## Note

Function `arot()` is not exactly equivalent to octave's `rotdim()`; in
`arot()` the order of the elements of `pair` matters because the
rotation is clockwise when viewed in the `(pair[1],pair[2])` direction.
Compare octave's `rotdim()` in which `pair` is replaced with
`sort(pair)`.

Note also that the rotation is about the first two dimensions specified
by `pair` but if `pair` has more than two elements then these dimensions
are also permuted.

Also note that function `arot()` does not treat singleton dimensions
specially.

## See also

[`arev`](https://robinhankin.github.io/magic/reference/arev.md)

## Examples

``` r
a <- array(1:16,rep(2,4))
arot(a)
#> , , 1, 1
#> 
#>      [,1] [,2]
#> [1,]    3    4
#> [2,]    1    2
#> 
#> , , 2, 1
#> 
#>      [,1] [,2]
#> [1,]    7    8
#> [2,]    5    6
#> 
#> , , 1, 2
#> 
#>      [,1] [,2]
#> [1,]   11   12
#> [2,]    9   10
#> 
#> , , 2, 2
#> 
#>      [,1] [,2]
#> [1,]   15   16
#> [2,]   13   14
#> 
```
