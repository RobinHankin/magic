# Conway's lozenge algorithm for magic squares

Uses John Conway's lozenge algorithm to produce magic squares of odd
order.

## Usage

``` r
lozenge(m)
```

## Arguments

- m:

  magic square returned is of order `n=2m+1`

## Author

Robin Hankin

## See also

[`magic.4np2`](https://robinhankin.github.io/magic/reference/magic.4np2.md)

## Examples

``` r
lozenge(4)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
#>  [1,]   50   60   70   80    9   10   20   30   40
#>  [2,]   58   68   78    7   17   27   28   38   48
#>  [3,]   66   76    5   15   25   35   45   46   56
#>  [4,]   74    3   13   23   33   43   53   63   64
#>  [5,]    1   11   21   31   41   51   61   71   81
#>  [6,]   18   19   29   39   49   59   69   79    8
#>  [7,]   26   36   37   47   57   67   77    6   16
#>  [8,]   34   44   54   55   65   75    4   14   24
#>  [9,]   42   52   62   72   73    2   12   22   32
all(sapply(1:10,function(n){is.magic(lozenge(n))}))
#> [1] TRUE
```
