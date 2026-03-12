# Magic squares of order 4n+2

Produces a magic square of order \\4n+2\\ using Conway's “LUX” method

## Usage

``` r
magic.4np2(m)
```

## Arguments

- m:

  returns a magic square of order \\n=4m+2\\ for \\m\geqslant 1\\, using
  Conway's “LUX” construction

## References

<https://mathworld.wolfram.com/MagicSquare.html>

## Author

Robin K. S. Hankin

## Note

I am not entirely happy with the method used: it's too complicated

## See also

[`magic`](https://robinhankin.github.io/magic/reference/magic.md)

## Examples

``` r
magic.4np2(1)
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]   32   29    4    1   24   21
#> [2,]   30   31    2    3   22   23
#> [3,]   12    9   17   20   28   25
#> [4,]   10   11   18   19   26   27
#> [5,]   13   16   36   33    5    8
#> [6,]   14   15   34   35    6    7
is.magic(magic.4np2(3))
#> [1] TRUE
```
