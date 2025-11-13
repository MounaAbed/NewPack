# Multivariate Gaussian Distribution

Description

## Usage

``` r
mvnpdf_invC(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)
```

## Arguments

- x:

  a matrix with n columns and p rows

- mean:

  a vector of means

- Log:

  logical parameter, with default value to TRUE.

- varcoM:

  a variance-covariance matrix

## Value

return a list containing the matrix x, and a vector of length n of the
multivariate normal distribution density values at those points

## Details

Details

## Examples

``` r
y <- mvpdf(x = matrix(c(1,2)) ,mean=rep(1,2),varcoM = diag(2),Log=TRUE)
```
