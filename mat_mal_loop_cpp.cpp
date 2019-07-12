#include <RcppArmadillo.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::export]]
Rcpp::List mat_mal(arma::mat A, arma::mat B){
  // Setups
  int Col_a = A.n_cols;
  int Row_a = A.n_rows;
  int Row_b = B.n_rows;
  int Col_b = B.n_cols;
  // bool conformable;
  arma::mat result(Row_a, Col_b);
  
  // Task
  // conformable = (Col_a == Row_b);
  if (Col_a == Row_b) {
    result = A * B;
  } else {
    stop("Error: non-conformable arguments\n");
  }
  return Rcpp::List::create(Rcpp::Named("MatrixMultiplication") = result);
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

# /*** R
# a <- matrix(1:6, ncol = 3); a
# b <- matrix(-4:4, nrow = 3); b
# mat_mal(a, b)
# */
