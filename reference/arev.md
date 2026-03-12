# Reverses some dimensions; a generalization of rev

A multidimensional generalization of
[`rev()`](https://rdrr.io/r/base/rev.html): given an array `a`, and a
Boolean vector `swap`, return an array of the same shape as `a` but with
dimensions corresponding to `TRUE` elements of `swap` reversed. If
`swap` is not Boolean, it is interpreted as the dimensions along which
to swap.

## Usage

``` r
arev(a, swap = TRUE)
```

## Arguments

- a:

  Array to be reversed

- swap:

  Vector of Boolean variables. If `swap[i]` is `TRUE`, then dimension
  `i` of array `a` is reversed. If `swap` is of length one, recycle to
  `length(dim(a))`

## Details

If `swap` is not Boolean, it is equivalent to `1:n %in% swap` (where `n`
is the number of dimensions). Thus multiple entries are ignored, as are
entries greater than `n`.

If `a` is a vector, `rev(a)` is returned.

Function `arev()` handles zero-extent dimensions as expected.

Function `arev()` does not treat singleton dimensions specially, and is
thus different from Octave's `flipdim()`, which (if supplied with no
second argument) flips the first nonsingleton dimension. To reproduce
this, use `arev(a,fnsd(a))`.

## Author

Robin K. S. Hankin

## See also

[`ashift`](https://robinhankin.github.io/magic/reference/shift.md)

## Examples

``` r
a <- matrix(1:42,6,7)
arev(a)  #Note swap defaults to TRUE
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   42   36   30   24   18   12    6
#> [2,]   41   35   29   23   17   11    5
#> [3,]   40   34   28   22   16   10    4
#> [4,]   39   33   27   21   15    9    3
#> [5,]   38   32   26   20   14    8    2
#> [6,]   37   31   25   19   13    7    1

b <- magichypercube.4n(1,d=4)
arev(b,c(TRUE,FALSE,TRUE,FALSE))
#> , , 1, 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]   52  201  197   64
#> [2,]  206   55   59  194
#> [3,]  207   54   58  195
#> [4,]   49  204  200   61
#> 
#> , , 2, 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  221   40   44  209
#> [2,]   35  218  214   47
#> [3,]   34  219  215   46
#> [4,]  224   37   41  212
#> 
#> , , 3, 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  237   24   28  225
#> [2,]   19  234  230   31
#> [3,]   18  235  231   30
#> [4,]  240   21   25  228
#> 
#> , , 4, 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]    4  249  245   16
#> [2,]  254    7   11  242
#> [3,]  255    6   10  243
#> [4,]    1  252  248   13
#> 
#> , , 1, 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  141  120  124  129
#> [2,]  115  138  134  127
#> [3,]  114  139  135  126
#> [4,]  144  117  121  132
#> 
#> , , 2, 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  100  153  149  112
#> [2,]  158  103  107  146
#> [3,]  159  102  106  147
#> [4,]   97  156  152  109
#> 
#> , , 3, 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]   84  169  165   96
#> [2,]  174   87   91  162
#> [3,]  175   86   90  163
#> [4,]   81  172  168   93
#> 
#> , , 4, 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  189   72   76  177
#> [2,]   67  186  182   79
#> [3,]   66  187  183   78
#> [4,]  192   69   73  180
#> 
#> , , 1, 3
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]   77  184  188   65
#> [2,]  179   74   70  191
#> [3,]  178   75   71  190
#> [4,]   80  181  185   68
#> 
#> , , 2, 3
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  164   89   85  176
#> [2,]   94  167  171   82
#> [3,]   95  166  170   83
#> [4,]  161   92   88  173
#> 
#> , , 3, 3
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  148  105  101  160
#> [2,]  110  151  155   98
#> [3,]  111  150  154   99
#> [4,]  145  108  104  157
#> 
#> , , 4, 3
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  125  136  140  113
#> [2,]  131  122  118  143
#> [3,]  130  123  119  142
#> [4,]  128  133  137  116
#> 
#> , , 1, 4
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  244    9    5  256
#> [2,]   14  247  251    2
#> [3,]   15  246  250    3
#> [4,]  241   12    8  253
#> 
#> , , 2, 4
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]   29  232  236   17
#> [2,]  227   26   22  239
#> [3,]  226   27   23  238
#> [4,]   32  229  233   20
#> 
#> , , 3, 4
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]   45  216  220   33
#> [2,]  211   42   38  223
#> [3,]  210   43   39  222
#> [4,]   48  213  217   36
#> 
#> , , 4, 4
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,]  196   57   53  208
#> [2,]   62  199  203   50
#> [3,]   63  198  202   51
#> [4,]  193   60   56  205
#> 
```
