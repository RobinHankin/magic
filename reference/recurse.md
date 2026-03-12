# Recursively apply a permutation

Recursively apply a permutation to a vector an arbitrary number of
times. Negative times mean apply the inverse permutation.

## Usage

``` r
recurse(perm, i, start = seq_along(perm))
```

## Arguments

- perm:

  Permutation (integers 1 to `length(start)` in some order)

- start:

  Start vector to be permuted

- i:

  Number of times to apply the permutation. `i=0` gives `start` by
  definition and negative values use the inverse permutation

## Author

Robin K. S. Hankin

## See also

[`hudson`](https://robinhankin.github.io/magic/reference/hudson.md)

## Examples

``` r
n <- 15
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=0))
#>  [1] a b c d e f g h i j k l m n o
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=1))
#>  [1] o a b c d e f g h i j k l m n
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=2))
#>  [1] n o a b c d e f g h i j k l m

noquote(recurse(start=letters[1:n],perm=sample(n),i=1))
#>  [1] l j b n a k d e h f o i g m c
noquote(recurse(start=letters[1:n],perm=sample(n),i=2))
#>  [1] d n a j m h f l k b e g i o c
```
