#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double cov_yx(NumericVector y, NumericVector x) {
  // Size of vector
  int n = x.size();

  // Sum value
  double sum_x = 0;
  // For loop, note cpp index shift to 0
  for(int i = 0; i < n; i++){
    // Shorthand for sum = sum + x[i]
    sum_x += x[i];
  }
  double mean_x = sum_x / n;

  // Compute mean y
  double sum_y = 0;
  for(int i = 0; i < n; i++){
    sum_y += y[i];
  }
  double mean_y = sum_y / n;

  // Compute cov(y,x)
  double sum = 0;
  for(int i = 0; i < n; i++){
    sum += (y[i]-mean_y) * (x[i]-mean_x);
  }
  double covxy = sum / (n-1);

  return covxy;
}

