#' Multivariate Gaussian Distribution
#'
#' Description
#'
#' Details
#'
#' @param x a matrix with n columns and p rows
#' @param mean a vector of means
#' @param varcoM a variance-covariance matrix
#' @param Log  logical parameter, with default value to TRUE.
#'
#' @returns return a list containing the matrix x, and a vector of length n of the multivariate normal distribution density values at those points
#' @export
#' @importFrom mvtnorm dmvnorm
#' @examples y <- mvpdf(x = matrix(c(1,2)) ,mean=rep(1,2),varcoM = diag(2),Log=TRUE)
mvnpdf_invC <- function(x, mean =  rep(0, nrow(x)),
                       varcovM = diag(nrow(x)), Log = TRUE) {
  n <- ncol(x)
  p <- nrow(x)
  x0 <- x - mean
  Rinv <- inv_C(varcovM)
  LogDetvarcovM <- log(det(varcovM))

  y <- rep(NA, n)
  for (j in 1:n) {
    yj <- - p/2 * log(2*pi) - 0.5 * LogDetvarcovM -
      0.5 * t(x0[, j]) %*% Rinv %*% x0[, j]
    y[j] <- yj
  }

  if (!Log) {
    y <- exp(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)
}
