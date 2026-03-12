# Shift origin of arrays and vectors

Shift origin of arrays and vectors.

## Usage

``` r
shift(x, i=1)
ashift(a, v=rep(1,length(dim(a))))
```

## Arguments

- x:

  Vector to be shifted

- i:

  Number of places elements to be shifted, with default value of 1
  meaning to put the last element first, followed by the first element,
  then the second, etc

- a:

  Array to be shifted

- v:

  Vector of numbers to be shifted in each dimension, with default value
  corresponding to `shift()`ing each dimension by 1 unit. If the length
  of `v` is less than `length(dim(a))`, it is padded with zeros (thus a
  scalar value of `i` indicates that the first dimension is to be
  shifted by `i` units)

## Details

Function `shift(x,n)` returns \\P^n(x)\\ where \\P\\ is the permutation
\\(n,1,2,\ldots,n-1)\\.

Function `ashift` is the array generalization of this: the \\n^{\rm
th}\\ dimension is shifted by `v[n]`. In other words,
`ashift(a,v)=a[shift(1:(dim(a)[1]),v[1]),...,shift(1:(dim(a)[n]),v[n])]`.
It is named by analogy with
[`abind()`](https://rdrr.io/pkg/abind/man/abind.html) and
[`aperm()`](https://rdrr.io/r/base/aperm.html).

This function is here because a shifted semimagic square or hypercube is
semimagic and a shifted pandiagonal square or hypercube is pandiagonal
(note that a shifted magic square is not necessarily magic, and a
shifted perfect hypercube is not necessarily perfect).

## Author

Robin K. S. Hankin

## Examples

``` r
shift(1:10,3)
#>  [1]  8  9 10  1  2  3  4  5  6  7
m <- matrix(1:100,10,10)
ashift(m,c(1,1))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]  100   10   20   30   40   50   60   70   80    90
#>  [2,]   91    1   11   21   31   41   51   61   71    81
#>  [3,]   92    2   12   22   32   42   52   62   72    82
#>  [4,]   93    3   13   23   33   43   53   63   73    83
#>  [5,]   94    4   14   24   34   44   54   64   74    84
#>  [6,]   95    5   15   25   35   45   55   65   75    85
#>  [7,]   96    6   16   26   36   46   56   66   76    86
#>  [8,]   97    7   17   27   37   47   57   67   77    87
#>  [9,]   98    8   18   28   38   48   58   68   78    88
#> [10,]   99    9   19   29   39   49   59   69   79    89
ashift(m,c(0,1))    #note columns shifted by 1, rows unchanged.
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]   91    1   11   21   31   41   51   61   71    81
#>  [2,]   92    2   12   22   32   42   52   62   72    82
#>  [3,]   93    3   13   23   33   43   53   63   73    83
#>  [4,]   94    4   14   24   34   44   54   64   74    84
#>  [5,]   95    5   15   25   35   45   55   65   75    85
#>  [6,]   96    6   16   26   36   46   56   66   76    86
#>  [7,]   97    7   17   27   37   47   57   67   77    87
#>  [8,]   98    8   18   28   38   48   58   68   78    88
#>  [9,]   99    9   19   29   39   49   59   69   79    89
#> [10,]  100   10   20   30   40   50   60   70   80    90
ashift(m,dim(m))    #m unchanged (Mnemonic).
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    1   11   21   31   41   51   61   71   81    91
#>  [2,]    2   12   22   32   42   52   62   72   82    92
#>  [3,]    3   13   23   33   43   53   63   73   83    93
#>  [4,]    4   14   24   34   44   54   64   74   84    94
#>  [5,]    5   15   25   35   45   55   65   75   85    95
#>  [6,]    6   16   26   36   46   56   66   76   86    96
#>  [7,]    7   17   27   37   47   57   67   77   87    97
#>  [8,]    8   18   28   38   48   58   68   78   88    98
#>  [9,]    9   19   29   39   49   59   69   79   89    99
#> [10,]   10   20   30   40   50   60   70   80   90   100
```
