# Panmagic squares of order 4

Creates all fundamentally different panmagic squares of order 4.

## Usage

``` r
panmagic.4(vals = 2^(0:3))
```

## Arguments

- vals:

  a length four vector giving the values which are combined in each of
  the \\2^4\\ possible ways. Thus `vals = 2^sample(0:3)` always gives a
  normal square (0-15 in binary).

## References

<https://www.grogono.com/magic/index.php>

## Author

Robin K. S. Hankin

## See also

[`panmagic.6npm1`](https://robinhankin.github.io/magic/reference/panmagic.6npm1.md)

## Examples

``` r
panmagic.4()
#>      [,1] [,2] [,3] [,4]
#> [1,]    6   12    7    9
#> [2,]   15    1   14    4
#> [3,]   10    8   11    5
#> [4,]    3   13    2   16
panmagic.4(2^c(1,3,2,0))
#>      [,1] [,2] [,3] [,4]
#> [1,]    7   12   13    2
#> [2,]   14    1    8   11
#> [3,]    4   15   10    5
#> [4,]    9    6    3   16
panmagic.4(10^(0:3))
#>      [,1] [,2] [,3] [,4]
#> [1,]  102 1012  111 1001
#> [2,] 1111    1 1102   12
#> [3,] 1002  112 1011  101
#> [4,]   11 1101    2 1112
```
