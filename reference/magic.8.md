# Regular magic squares of order 8

Returns all 90 regular magic squares of order 8

## Usage

``` r
magic.8(...)
```

## Arguments

- ...:

  ignored

## Value

Returns an array of dimensions `c(8, 8, 90)` of which each slice is an
8-by-8 magic square.

## References

<https://www.grogono.com/magic/index.php>

## Author

Robin K. S. Hankin

## Examples

``` r
h <- magic.8()
h[,,1]
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
#> [1,]    1    9   48   40   32   24   49   57
#> [2,]    2   10   47   39   31   23   50   58
#> [3,]   62   54   19   27   35   43   14    6
#> [4,]   61   53   20   28   36   44   13    5
#> [5,]   60   52   21   29   37   45   12    4
#> [6,]   59   51   22   30   38   46   11    3
#> [7,]    7   15   42   34   26   18   55   63
#> [8,]    8   16   41   33   25   17   56   64

stopifnot(apply(h,3,is.magic))
```
