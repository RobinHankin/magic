# Hadamard matrices

Various functionality for Hadamard matrices

## Usage

``` r
sylvester(k)
is.hadamard(m)
```

## Arguments

- k:

  Function `sylvester()` gives the `k`-th Sylvester matrix

- m:

  matrix

## Details

A Hadamard matrix is a square matrix whose entries are either +1 or -1
and whose rows are mutually orthogonal.

## References

“Hadamard matrix.” *Wikipedia, The Free Encyclopedia.* 19 Jan 2009,
18:21 UTC. 20 Jan 2009

## Author

Robin K. S. Hankin

## Examples

``` r
is.hadamard(sylvester(4))
#> [1] TRUE
image(sylvester(5))

```
