# Extracts broken diagonals

Returns broken diagonals of a magic square

## Usage

``` r
diag.off(a, offset = 0, nw.se = TRUE)
```

## Arguments

- a:

  Square matrix

- offset:

  vertical offset

- nw.se:

  Boolean variable with `TRUE` meaning trace diagonals along the
  northwest-southeast direction (point `[1,n]` to `[n,1]`).

## Details

Useful when testing for panmagic squares. The first element is always
the unbroken one (ie `[1,1]` to `[n,n]` if `nw.se` is `TRUE` and `[1,n]`
to `[n,1]` if `nw.se` is `FALSE`.

## Author

Robin K. S. Hankin

## See also

[`is.panmagic`](https://robinhankin.github.io/magic/reference/is.magic.md)

## Examples

``` r
diag.off(magic(10),nw.se=FALSE,offset=0)
#>  [1] 43 44 46 48 50 52 54 53 58 57
diag.off(magic(10),nw.se=FALSE,offset=1)
#>  [1] 34 41 39 45 23 49 27 56 31 60
```
