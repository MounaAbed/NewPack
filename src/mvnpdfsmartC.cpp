#include <RcppArmadillo.h>
using namespace arma;
using namespace Rcpp;
// [[Rcpp::depends(RcppArmadillo)]]
//'inverting a matrix
//'
//'@param A a matrix
//'
//'@export
// [[Rcpp::export]]

List mvnpdfsmartC(const arma::mat& x,
                  const arma::vec& mean,
                  const arma::mat& varcoM,
                  const bool Log = true)  {

  int n = x.n_rows;
  int p = x.n_cols;

  arma::mat x0 = x.each_col() - mean;

  arma::mat Rinv = arma::inv(varcoM);
  double LogDetvarcovM = log(det(varcoM));

  arma::vec y(n);

  for (int j = 0; j <n; j++) {
    double yj = - p/2 * log(2*M_PI) - 0.5 * LogDetvarcovM -
      0.5 * as_scalar(x0.col(j).t() * Rinv * x0.col(j));
    y[j] = yj;
  }

  if (!Log)
    y = arma::exp(y);

  return List::create(_["x"] = x,
                      _["y"] = y);

}



// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

/*** R
mvnpdfsmartC(x = matrix(1.96, nrow = 2, ncol = n), Log = FALSE)
*/
