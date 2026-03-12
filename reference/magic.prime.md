# Magic squares prime order

Produces magic squares of prime order using the standard method

## Usage

``` r
magic.prime(n,i=2,j=3)
```

## Arguments

- n:

  The order of the square

- i:

  row number of increment

- j:

  column number of increment

## Details

Claimed to work for order any prime \\p\\ with \\(p,ij)=1\\, but I've
tried it (with the defaults for `i` and `j`) for many composite integers
of the form \\6n+1\\ and \\6n-1\\ and found no exceptions; indeed, they
all seem to be panmagic. It is not clear to me when the process works
and when it doesn't.

## Author

Robin K. S. Hankin

## Examples

``` r
magic.prime(7)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    1    9   17   25   33   41   49
#> [2,]   40   48    7    8   16   24   32
#> [3,]   23   31   39   47    6   14   15
#> [4,]   13   21   22   30   38   46    5
#> [5,]   45    4   12   20   28   29   37
#> [6,]   35   36   44    3   11   19   27
#> [7,]   18   26   34   42   43    2   10
f <- function(n){is.magic(magic.prime(n))}
all(sapply(6*1:30+1,f))
#> [1] TRUE
all(sapply(6*1:30-1,f))
#> [1] TRUE

is.magic(magic.prime(9,i=2,j=4),give.answers=TRUE)
#> $answer
#> [1] FALSE
#> 
#> $rowsums
#> [1] 369 369 369 369 369 369 369 369 369
#> 
#> $colsums
#> [1] 369 369 369 369 369 369 369 369 369
#> 
#> $majors
#> [1] 360 369 378 360 369 378 360 369 378
#> 
#> $minors
#> [1] 450 288 369 450 288 369 450 288 369
#> 
magic.prime(7,i=2,j=4)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    1    9   17   25   33   41   49
#> [2,]   39   47    6   14   15   23   31
#> [3,]   28   29   37   45    4   12   20
#> [4,]   10   18   26   34   42   43    2
#> [5,]   48    7    8   16   24   32   40
#> [6,]   30   38   46    5   13   21   22
#> [7,]   19   27   35   36   44    3   11
```
