# Plot of the mvpdf function

Plot of the mvpdf function

## Usage

``` r
# S3 method for class 'mvpdf'
plot(x, ...)
```

## Arguments

- x:

  an object of class `mvpdf` resulting from a call of the
  [`mvpdf()`](https://mounaabed.github.io/NewPack/reference/mvpdf.md)
  function.

- ...:

  graphical parameters passed to
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) function.

## Value

Nothing is returned, only a plot is given.

## Examples

``` r
pdfvalues <- mvpdf(x=matrix(seq(-3, 3, by = 0.1), nrow = 1), Log=FALSE)
#> Error in handler$value(value, visible): class name too long in 'pkgdown_print'
plot(pdfvalues)
#> Error in plot(pdfvalues): class name too long in 'plot'
```
