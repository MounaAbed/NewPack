#' Multivariate Gaussian Distribution
#'
#' Description : dddd
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
mvpdf <- function(x,mean=rep(0,nrow(x)),varcoM = diag(nrow(x)),Log=TRUE){
  n <- ncol(x)
  p <- nrow(x)
  x0 <- x - mean
  Rinv <- solve(varcoM)
  LogDetvarcoM <- log(det(varcoM))

  y <- NULL
  for(j in 1:n){
    yj <- -p/2 * log(2*pi) - 0.5 * LogDetvarcoM - 0.5 * t(x0[,j]) %*% x0[,j]
    y <- c(y,yj)
  }

  if (!Log){
    y <- exp(y)
  }

  res <- list(x=x,y=y)
  class(res) <- list(x=x,y=y)
  return(res)
}
