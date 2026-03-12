# Panmagic squares of order 4n, 6n+1 and 6n-1

Produce a panmagic square of order \\4n\\ or \\6n\pm 1\\ using a
classical method

## Usage

``` r
panmagic.6npm1(n)
panmagic.6np1(m)
panmagic.6nm1(m)
panmagic.4n(m)
```

## Arguments

- m:

  Function `panmagic.6np1(m)` returns a panmagic square of order
  \\n=6m+1\\ for \\m\geqslant 1\\, and function `panmagic.6nm1(m)`
  returns a panmagic square of order \\n=6m-1\\ for \\m\geqslant 1\\,
  using a classical method.

  Function `panmagic.4n(m)` returns a magic square of order \\n=4m\\

- n:

  Function `panmagic.6npm1(n)` returns a panmagic square of order \\n\\
  where \\n=6m\pm 1\\

## Details

Function `panmagic.6npm1(n)` will return a square if `n` is not of the
form \\6m\pm 1\\, but it is not necessarily magic.

## References

“Pandiagonal magic square.” *Wikipedia, The Free Encyclopedia.*
Wikimedia Foundation, Inc. 13 February 2013

## Author

Robin K. S. Hankin

## See also

[`magic`](https://robinhankin.github.io/magic/reference/magic.md)

## Examples

``` r
panmagic.6np1(1)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    1   13   18   23   35   40   45
#> [2,]   37   49    5   10   15   27   32
#> [3,]   24   29   41   46    2   14   19
#> [4,]   11   16   28   33   38   43    6
#> [5,]   47    3    8   20   25   30   42
#> [6,]   34   39   44    7   12   17   22
#> [7,]   21   26   31   36   48    4    9
panmagic.6npm1(13)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#>  [1,]    1   25   36   47   58   69   80  104  115   126   137   148   159
#>  [2,]  145  169   11   22   33   44   55   66   90   101   112   123   134
#>  [3,]  120  131  155  166    8   19   30   41   65    76    87    98   109
#>  [4,]   95  106  130  141  152  163    5   16   27    51    62    73    84
#>  [5,]   70   81   92  116  127  138  149  160    2    26    37    48    59
#>  [6,]   45   56   67   91  102  113  124  135  146   157    12    23    34
#>  [7,]   20   31   42   53   77   88   99  110  121   132   156   167     9
#>  [8,]  164    6   17   28   52   63   74   85   96   107   118   142   153
#>  [9,]  139  150  161    3   14   38   49   60   71    82    93   117   128
#> [10,]  114  125  136  147  158   13   24   35   46    57    68    79   103
#> [11,]   89  100  111  122  133  144  168   10   21    32    43    54    78
#> [12,]   64   75   86   97  108  119  143  154  165     7    18    29    40
#> [13,]   39   50   61   72   83   94  105  129  140   151   162     4    15

all(sapply(panmagic.6np1(1:3),is.panmagic))
#> [1] TRUE
```
