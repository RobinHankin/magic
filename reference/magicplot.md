# Joins consecutive numbers of a magic square.

A nice way to graphically represent normal magic squares. Lines are
plotted to join successive numbers from 1 to \\n^2\\. The plot method
produces pleasing images for many magic squares.

## Usage

``` r
magicplot(m, number = TRUE, do.circuit = FALSE, ...)
```

## Arguments

- m:

  Magic square to be plotted

- number:

  Boolean variable with default `TRUE` meaning to include the numbers on
  the plot

- do.circuit:

  Boolean variable with default `TRUE` meaning to include the line
  joining \\n^2\\ to 1

- ...:

  Extra parameters passed to
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)

## Author

Robin K. S. Hankin

## Examples

``` r
magicplot(magic.4n(2))
```
