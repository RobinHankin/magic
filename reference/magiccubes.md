# Magic cubes of order 3

A list of four elements listing each fundamentally different magic cube
of order 3

## Usage

``` r
data(magiccubes)
```

## Source

Originally discovered by Hendricks

## Examples

``` r
data(magiccubes)
magiccubes$a1
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    2   22   18
#> [2,]   13    9   20
#> [3,]   27   11    4
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]   16    3   23
#> [2,]   21   14    7
#> [3,]    5   25   12
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]   24   17    1
#> [2,]    8   19   15
#> [3,]   10    6   26
#> 
sapply(magiccubes,is.magichypercube)
#>   a1   a2   a3   a4 
#> TRUE TRUE TRUE TRUE 
```
