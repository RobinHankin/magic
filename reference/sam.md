# Sparse antimagic squares

Produces an antimagic square of order \\m\\ using Gray and MacDougall's
method.

## Usage

``` r
sam(m, u, A = NULL, B = A)
```

## Arguments

- m:

  Order of the magic square (not “`n`”: the terminology follows Gray and
  MacDougall)

- u:

  See details section

- A, B:

  Start latin squares, with default `NULL` meaning to use `circulant(m)`

## Details

In Gray's terminology, `sam(m, n)` produces a \\SAM(2m, 2u+1, 0)\\.

The method is not vectorized.

To test for these properties, use functions such as
[`is.antimagic()`](https://robinhankin.github.io/magic/reference/is.magic.md),
documented under `is.magic.Rd`.

## References

I. D. Gray and J. A. MacDougall 2006. “Sparse anti-magic squares and
vertex-magic labelings of bipartite graphs”, *Discrete Mathematics*,
volume 306, pp2878-2892

## Author

Robin K. S. Hankin

## See also

[`magic`](https://robinhankin.github.io/magic/reference/magic.md),[`is.magic`](https://robinhankin.github.io/magic/reference/is.magic.md)

## Examples

``` r
sam(6,2)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
#>  [1,]   18   24    0    0    0    0    7   43   55     0     0     0
#>  [2,]    0   17   23    0    0    0    0    8   44    56     0     0
#>  [3,]    0    0   16   22    0    0    0    0    9    45    57     0
#>  [4,]    0    0    0   15   21    0    0    0    0    10    46    58
#>  [5,]    0    0    0    0   14   20   59    0    0     0    11    47
#>  [6,]   19    0    0    0    0   13   48   60    0     0     0    12
#>  [7,]   31   37   49    0    0    0    6   30    0     0     0     0
#>  [8,]    0   32   38   50    0    0    0    5   29     0     0     0
#>  [9,]    0    0   33   39   51    0    0    0    4    28     0     0
#> [10,]    0    0    0   34   40   52    0    0    0     3    27     0
#> [11,]   53    0    0    0   35   41    0    0    0     0     2    26
#> [12,]   42   54    0    0    0   36   25    0    0     0     0     1

jj <- matrix(c(
     5, 2, 3, 4, 1,
     3, 5, 4, 1, 2,
     2, 3, 1, 5, 4,
     4, 1, 2, 3, 5, 
     1, 4, 5, 2, 3), 5, 5)

is.sam(sam(5, 2, B = jj))
#> [1] TRUE
```
