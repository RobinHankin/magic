# Row, column, and two diagonal sums of arrays

Returns all rowsums, all columnsums, and all (broken) diagonal sums of a
putative magic square.

## Usage

``` r
allsums(m,func=NULL, ...)
```

## Arguments

- m:

  The square to be tested

- func:

  Function, with default `NULL` interpreted
  as[`sum()`](https://rdrr.io/r/base/sum.html), to be applied to the
  square rowwise, columnwise, and diagonalwise

- ...:

  Further arguments passed to `func()`

## Value

Returns a list of four elements. In the following, “sums” means “the
result of applying func()”.

- rowsums:

  All \\n\\ row sums

- colsums:

  All \\n\\ column sums

- majors:

  All \\n\\ broken major diagonals (northwest-southeast). First element
  is the long (unbroken) major diagonal, tested by
  [`is.magic()`](https://robinhankin.github.io/magic/reference/is.magic.md)

- minors:

  All \\n\\ broken minor diagonals (northeast-southwest). First element
  is the long (unbroken) minor diagonal.

## Author

Robin K. S. Hankin

## Note

If `func()` returns a vector, then the `allsums()` returns a list whose
columns are the result of applying `func()`. See third and fourth
examples below.

Used by
[`is.magic()`](https://robinhankin.github.io/magic/reference/is.magic.md)
et seq.

The major and minor diagonals would benefit from being recoded in C.

## See also

[`is.magic`](https://robinhankin.github.io/magic/reference/is.magic.md),[`is.semimagic`](https://robinhankin.github.io/magic/reference/is.magic.md),[`is.panmagic`](https://robinhankin.github.io/magic/reference/is.magic.md)

## Examples

``` r
allsums(magic(7))
#> $rowsums
#> [1] 175 175 175 175 175 175 175
#> 
#> $colsums
#> [1] 175 175 175 175 175 175 175
#> 
#> $majors
#> [1] 175 175 175 175 175 175 175
#> 
#> $minors
#> [1] 175 126  77  28 322 273 224
#> 
allsums(magic(7),func=max)
#> $rowsums
#> [1] 49 43 44 45 46 47 48
#> 
#> $colsums
#> [1] 45 44 43 49 48 47 46
#> 
#> $majors
#> [1] 47 43 46 49 45 48 44
#> 
#> $minors
#> [1] 28 21 14  7 49 42 35
#> 

allsums(magic(7),func=range)
#> $rowsums
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    2    3    4    5    6    7    1
#> [2,]   49   43   44   45   46   47   48
#> 
#> $colsums
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    4    3    2    1    7    6    5
#> [2,]   45   44   43   49   48   47   46
#> 
#> $majors
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    3    6    2    5    1    4    7
#> [2,]   47   43   46   49   45   48   44
#> 
#> $minors
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   22   15    8    1   43   36   29
#> [2,]   28   21   14    7   49   42   35
#> 
allsums(magic(7),func=function(x){x[1:2]})
#> $rowsums
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   20   12    4   45   37   29   28
#> [2,]   11    3   44   36   35   27   19
#> 
#> $colsums
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   20   11    2   49   40   31   22
#> [2,]   12    3   43   41   32   23   21
#> 
#> $majors
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   20   11    2   49   40   31   22
#> [2,]    3   43   41   32   23   21   12
#> 
#> $minors
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   22   20   11    2   49   40   31
#> [2,]   23   21   12    3   43   41   32
#> 


allsums(magic(7),sort)
#> $rowsums
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    2    3    4    5    6    7    1
#> [2,]   11   12   13   14    8    9   10
#> [3,]   20   21   15   16   17   18   19
#> [4,]   22   23   24   25   26   27   28
#> [5,]   31   32   33   34   35   29   30
#> [6,]   40   41   42   36   37   38   39
#> [7,]   49   43   44   45   46   47   48
#> 
#> $colsums
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    4    3    2    1    7    6    5
#> [2,]   12   11   10    9    8   14   13
#> [3,]   20   19   18   17   16   15   21
#> [4,]   28   27   26   25   24   23   22
#> [5,]   29   35   34   33   32   31   30
#> [6,]   37   36   42   41   40   39   38
#> [7,]   45   44   43   49   48   47   46
#> 
#> $majors
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    3    6    2    5    1    4    7
#> [2,]    8   11   14   10   13    9   12
#> [3,]   20   16   19   15   18   21   17
#> [4,]   25   28   24   27   23   26   22
#> [5,]   30   33   29   32   35   31   34
#> [6,]   42   38   41   37   40   36   39
#> [7,]   47   43   46   49   45   48   44
#> 
#> $minors
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]   22   15    8    1   43   36   29
#> [2,]   23   16    9    2   44   37   30
#> [3,]   24   17   10    3   45   38   31
#> [4,]   25   18   11    4   46   39   32
#> [5,]   26   19   12    5   47   40   33
#> [6,]   27   20   13    6   48   41   34
#> [7,]   28   21   14    7   49   42   35
#> 
  # beware! compare apply(magic(7),1,sort) and apply(magic(7),2,sort)
```
