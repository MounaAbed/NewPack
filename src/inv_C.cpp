#include <RcppArmadillo.h>
using namespace arma;
// [[Rcpp::depends(RcppArmadillo)]]
//'inverting a matrix
//'
//'@param A a matrix
//'
//'@export
// [[Rcpp::export]]

arma::mat inv_C(arma::mat A) {
  mat invA = inv(A);
  return invA;
}
