# Pad arrays

Generalized padding for arrays of arbitrary dimension

## Usage

``` r
apad(a, l, e = NULL, method = "ext", post = TRUE)
```

## Arguments

- a:

  Array to be padded

- l:

  Amount of padding to add. If a vector of length greater than one, it
  is interpreted as the extra extent of `a` along each of its dimensions
  (standard recycling is used). If of length one, interpret as the
  dimension to be padded, in which case the amount is given by argument
  `l`.

- e:

  If `l` is of length one, the amount of padding to add to dimension `l`

- method:

  String specifying the values of the padded elements. See details
  section.

- post:

  Boolean, with default `TRUE` meaning to append to `a` and `FALSE`
  meaning to prepend.

## Details

Argument `method` specifies the values of the padded elements. It can be
either “`ext`”, “`mirror`”, or “`rep`”.

Specifying `ext` (the default) uses a padding value given by the
“nearest” element of `a`, as measured by the Manhattan metric.

Specifying `mirror` fills the array with alternate mirror images of `a`;
while `rep` fills it with unreflected copies of `a`.

## Author

Robin K. S. Hankin

## Note

Function `apad()` does not work with arrays with dimensions of zero
extent: what to pad it with? To pad with a particular value, use
[`adiag()`](https://robinhankin.github.io/magic/reference/adiag.md).

The function works as expected with vectors, which are treated as
one-dimensional arrays. See examples section.

Function `apad()` is distinct from
[`adiag()`](https://robinhankin.github.io/magic/reference/adiag.md),
which takes two arrays and binds them together. Both functions create an
array of the same dimensionality as their array arguments but with
possibly larger extents. However, the functions differ in the values of
the new array elements. Function
[`adiag()`](https://robinhankin.github.io/magic/reference/adiag.md) uses
a second array; function `apad()` takes the values from its primary
array argument.

## See also

[`adiag`](https://robinhankin.github.io/magic/reference/adiag.md)

## Examples

``` r
apad(1:10,4,method="mirror")
#>  [1]  1  2  3  4  5  6  7  8  9 10 10  9  8  7


a <- matrix(1:30,5,6)

apad(a,c(4,4))
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    1    6   11   16   21   26   26   26   26    26
#>  [2,]    2    7   12   17   22   27   27   27   27    27
#>  [3,]    3    8   13   18   23   28   28   28   28    28
#>  [4,]    4    9   14   19   24   29   29   29   29    29
#>  [5,]    5   10   15   20   25   30   30   30   30    30
#>  [6,]    5   10   15   20   25   30   30   30   30    30
#>  [7,]    5   10   15   20   25   30   30   30   30    30
#>  [8,]    5   10   15   20   25   30   30   30   30    30
#>  [9,]    5   10   15   20   25   30   30   30   30    30
apad(a,c(4,4),post=FALSE)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    1    1    1    1    1    6   11   16   21    26
#>  [2,]    1    1    1    1    1    6   11   16   21    26
#>  [3,]    1    1    1    1    1    6   11   16   21    26
#>  [4,]    1    1    1    1    1    6   11   16   21    26
#>  [5,]    1    1    1    1    1    6   11   16   21    26
#>  [6,]    2    2    2    2    2    7   12   17   22    27
#>  [7,]    3    3    3    3    3    8   13   18   23    28
#>  [8,]    4    4    4    4    4    9   14   19   24    29
#>  [9,]    5    5    5    5    5   10   15   20   25    30

apad(a,1,5)
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    1    6   11   16   21   26
#>  [2,]    2    7   12   17   22   27
#>  [3,]    3    8   13   18   23   28
#>  [4,]    4    9   14   19   24   29
#>  [5,]    5   10   15   20   25   30
#>  [6,]    5   10   15   20   25   30
#>  [7,]    5   10   15   20   25   30
#>  [8,]    5   10   15   20   25   30
#>  [9,]    5   10   15   20   25   30
#> [10,]    5   10   15   20   25   30

apad(a,c(5,6),method="mirror")
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
#>  [1,]    1    6   11   16   21   26   26   21   16    11     6     1
#>  [2,]    2    7   12   17   22   27   27   22   17    12     7     2
#>  [3,]    3    8   13   18   23   28   28   23   18    13     8     3
#>  [4,]    4    9   14   19   24   29   29   24   19    14     9     4
#>  [5,]    5   10   15   20   25   30   30   25   20    15    10     5
#>  [6,]    5   10   15   20   25   30   30   25   20    15    10     5
#>  [7,]    4    9   14   19   24   29   29   24   19    14     9     4
#>  [8,]    3    8   13   18   23   28   28   23   18    13     8     3
#>  [9,]    2    7   12   17   22   27   27   22   17    12     7     2
#> [10,]    1    6   11   16   21   26   26   21   16    11     6     1
apad(a,c(5,6),method="mirror",post=FALSE)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
#>  [1,]   30   25   20   15   10    5    5   10   15    20    25    30
#>  [2,]   29   24   19   14    9    4    4    9   14    19    24    29
#>  [3,]   28   23   18   13    8    3    3    8   13    18    23    28
#>  [4,]   27   22   17   12    7    2    2    7   12    17    22    27
#>  [5,]   26   21   16   11    6    1    1    6   11    16    21    26
#>  [6,]   26   21   16   11    6    1    1    6   11    16    21    26
#>  [7,]   27   22   17   12    7    2    2    7   12    17    22    27
#>  [8,]   28   23   18   13    8    3    3    8   13    18    23    28
#>  [9,]   29   24   19   14    9    4    4    9   14    19    24    29
#> [10,]   30   25   20   15   10    5    5   10   15    20    25    30
```
