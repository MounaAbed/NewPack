#' Plot of the mvpdf function
#'
#' @param x an object of class \code{mvpdf} resulting from a call of the
#' \code{mvpdf()} function.
#' @param ... graphical parameters passed to \code{plot()} function.
#'
#' @return Nothing is returned, only a plot is given.
#' @export
#'
#' @examples
#' pdfvalues <- mvpdf(x=matrix(seq(-3, 3, by = 0.1), nrow = 1), Log=FALSE)
#' plot(pdfvalues)
plot.mvpdf <- function(x, ...) {
  plot(x$x, x$y, type = "l", ...)
}
