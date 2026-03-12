# Strachey's algorithm for magic squares

Uses Strachey's algorithm to produce magic squares of singly-even order.

## Usage

``` r
strachey(m, square=magic.2np1(m))
```

## Arguments

- m:

  magic square produced of order `n=2m+1`

- square:

  magic square of order `2m+1` needed for Strachey's method. Default
  value gives the standard construction, but the method will work with
  any odd order magic square

## Details

Strachey's method essentially places four identical magic squares of
order \\2m+1\\ together to form one of \\n=4m+2\\. Then
\\0,n^2/4,n^2/2,3n^2/4\\ is added to each square; and finally, certain
squares are swapped from the top subsquare to the bottom subsquare.

See the final example for an illustration of how this works, using a
zero matrix as the submatrix. Observe how some 75s are swapped with some
0s, and some 50s with some 25s.

## Author

Robin K. S. Hankin

## See also

[`magic.4np2`](https://robinhankin.github.io/magic/reference/magic.4np2.md),[`lozenge`](https://robinhankin.github.io/magic/reference/lozenge.md)

## Examples

``` r
 strachey(3)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#>  [1,]  177  186  195    1   10   19   28  128  137   146    99   108    68
#>  [2,]  185  194  154    9   18   27   29  136  145   105   107   116    76
#>  [3,]  193  153  155   17   26   35   37  144  104   106   115   124    84
#>  [4,]    5  161  163  172   34   36   45  103  112   114   123   132    85
#>  [5,]  160  162  171   33   42   44    4  111  113   122   131   140    93
#>  [6,]  168  170  179   41   43    3   12  119  121   130   139   141    52
#>  [7,]  169  178  187   49    2   11   20  120  129   138   147   100    60
#>  [8,]   30   39   48  148  157  166  175   79   88    97    50    59   117
#>  [9,]   38   47    7  156  165  174  176   87   96    56    58    67   125
#> [10,]   46    6    8  164  173  182  184   95   55    57    66    75   133
#> [11,]  152   14   16   25  181  183  192   54   63    65    74    83   134
#> [12,]   13   15   24  180  189  191  151   62   64    73    82    91   142
#> [13,]   21   23   32  188  190  150  159   70   72    81    90    92   101
#> [14,]   22   31   40  196  149  158  167   71   80    89    98    51   109
#>       [,14]
#>  [1,]    77
#>  [2,]    78
#>  [3,]    86
#>  [4,]    94
#>  [5,]    53
#>  [6,]    61
#>  [7,]    69
#>  [8,]   126
#>  [9,]   127
#> [10,]   135
#> [11,]   143
#> [12,]   102
#> [13,]   110
#> [14,]   118
 strachey(2,square=magic(5))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]   84   77   25   18   11   59   52   75   68    36
#>  [2,]   78   96   19   12   10   53   71   69   62    35
#>  [3,]   22   95   88    6    4   72   70   63   56    29
#>  [4,]   91   89    7    5   23   66   64   57   55    48
#>  [5,]   90   83    1   24   17   65   58   51   74    42
#>  [6,]    9    2  100   93   86   34   27   50   43    61
#>  [7,]    3   21   94   87   85   28   46   44   37    60
#>  [8,]   97   20   13   81   79   47   45   38   31    54
#>  [9,]   16   14   82   80   98   41   39   32   30    73
#> [10,]   15    8   76   99   92   40   33   26   49    67

 strachey(2,square=magic(5)) %eq%  strachey(2,square=t(magic(5)))
#> [1] FALSE
 #should be FALSE

 #Show which numbers have been swapped:
 strachey(2,square=matrix(0,5,5))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]   75   75    0    0    0   50   50   50   50    25
#>  [2,]   75   75    0    0    0   50   50   50   50    25
#>  [3,]    0   75   75    0    0   50   50   50   50    25
#>  [4,]   75   75    0    0    0   50   50   50   50    25
#>  [5,]   75   75    0    0    0   50   50   50   50    25
#>  [6,]    0    0   75   75   75   25   25   25   25    50
#>  [7,]    0    0   75   75   75   25   25   25   25    50
#>  [8,]   75    0    0   75   75   25   25   25   25    50
#>  [9,]    0    0   75   75   75   25   25   25   25    50
#> [10,]    0    0   75   75   75   25   25   25   25    50

 #It's still magic, but not normal:
  is.magic(strachey(2,square=matrix(0,5,5)))
#> [1] TRUE
```
