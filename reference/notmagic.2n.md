# An unmagic square

Returns a square of order \\n=2m\\ that has been claimed to be magic,
but isn't.

## Usage

``` r
notmagic.2n(m)
```

## Arguments

- m:

  Order of square is \\n=2m\\

## References

“Magic Squares and Cubes”, Andrews, (book)

## Author

Robin K. S. Hankin

## Note

This took me a whole evening to code up. And I was quite pleased with
the final vectorized form: it matches Andrews's (8 by 8) example square
exactly. What a crock

## Examples

``` r
  notmagic.2n(4)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
#> [1,]    1   16   17   32   33   48   49   64
#> [2,]   63   50   47   34   31   18   15    2
#> [3,]    3   14   19   30   35   46   51   62
#> [4,]   61   52   45   36   29   20   13    4
#> [5,]    5   12   21   28   37   44   53   60
#> [6,]   59   54   43   38   27   22   11    6
#> [7,]    7   10   23   26   39   42   55   58
#> [8,]   57   56   41   40   25   24    9    8
  is.magic(notmagic.2n(4))
#> [1] FALSE
  is.semimagic(notmagic.2n(4))
#> [1] FALSE
```
