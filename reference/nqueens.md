# N queens problem

Solves the N queens problem for any n-by-n board.

## Usage

``` r
bernhardsson(n)
bernhardssonA(n)
bernhardssonB(n)
```

## Arguments

- n:

  Size of the chessboard

## Details

Uses a direct transcript of Bo Bernhardsson's method.

All solutions (up to reflection and translation) for the 8-by-8 case
given in the examples.

## References

- Bo Bernhardsson 1991. “Explicit solutions to the n-queens problem for
  all \\n\\”. *SIGART Bull.*, 2(2):7

- Weisstein, Eric W. “Queens Problem” From *MathWorld–A Wolfram Web
  Resource* <https://mathworld.wolfram.com/QueensProblem.html>

## Author

Robin K. S. Hankin

## Examples

``` r
bernhardsson(7)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    1    0    0    0    0    0    0
#> [2,]    0    0    1    0    0    0    0
#> [3,]    0    0    0    0    1    0    0
#> [4,]    0    0    0    0    0    0    1
#> [5,]    0    1    0    0    0    0    0
#> [6,]    0    0    0    1    0    0    0
#> [7,]    0    0    0    0    0    1    0

a <-
  matrix(
         c(3,6,2,7,1,4,8,5,
           2,6,8,3,1,4,7,5,
           6,3,7,2,4,8,1,5,
           3,6,8,2,4,1,7,5,
           4,8,1,3,6,2,7,5,
           7,2,6,3,1,4,8,5,
           2,6,1,7,4,8,3,5,
           1,6,8,3,7,4,2,5,
           1,5,8,6,3,7,2,4,
           2,4,6,8,3,1,7,5,
           6,3,1,8,4,2,7,5,
           4,6,8,2,7,1,3,5)
         ,8,12)

out <- array(0L,c(8,8,12))
for(i in 1:12){
  out[cbind(seq_len(8),a[,i],i)] <- 1L
}

```
