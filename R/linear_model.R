#'Linear_model
#'
#'Compute the estimated coefficients and statistics from linear models.
#'
#'@param formula  input response and variables
#'@param data  input the data frame
#'
#'@return The estimated coefficients and statistics of t test and F test
#'
#'@examples X <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
#'Y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
#'data <- data.frame(Y,X)
#'linear_model(Y~X, data)
#'
#'x <- cbind(mtcars$disp, mtcars$drat)
#'y <- mtcars$mpg
#'linear_model(y~x, mtcars)
#'
#'@export
#'

linear_model <- function(formula, data){
  attach(data, warn.conflicts = FALSE)
  Y <- model.frame(formula)[,1]
  X <- model.matrix(formula)
  n <- nrow(X)
  p <- ncol(X)

  #Estimate betahat and var(betahat)
  beta_hat <- solve(t(X)%*%X) %*% t(X) %*% Y
  Y_hat <- X %*% beta_hat
  e_hat <- Y - Y_hat

  #Estimate SSs and R squared
  H <- X %*% solve(t(X) %*% X) %*% t(X)
  n_1 <- matrix(1,n,n)
  SSY <- t(Y) %*% (diag(n) - n_1 / n) %*% Y
  SSR <- t(Y) %*% (H - n_1 / n) %*% Y
  SSE <- t(Y) %*% (diag(n) - H) %*% Y
  MSR <- SSR / (p-1)
  MSE <- SSE/(n-p)
  sigma_2hat <- t(e_hat) %*% e_hat / (n-p) #SSE/(n-p)
  R_squared <- SSR / SSY
  adjusted_Rsquared <- 1 - SSE/(n-p) / (SSY/(n-1))

  #Variance and se of betahat
  var_betahat <- diag(solve(t(X) %*% X)) * c(sigma_2hat)
  se_betahat <- sqrt(var_betahat)

  #Conduct F-test and t-test
  F_stat = MSR / sigma_2hat
  t_stat = c(beta_hat / se_betahat)
  F_pvalue = 1 - pf(q = F_stat, df1 = p-1, df2 = n-p)
  t_pvalue = c(2 * (1 - pt(q = abs(t_stat), df = n-p)))

  #Output a list
  li <- list(cbind(Estimate = round(c(beta_hat),4), Std_Err = round(se_betahat,4),
                   t_stat = round(t_stat, 4), p_value = round(t_pvalue, 4)),
             cbind(F_stat = round(F_stat, 4), F_pvalue = round(F_pvalue, 4)),
             cbind(MSE = round(sqrt(MSE), 4),
                   R_squared = round(R_squared, 4),
                   adjusted_Rsquared = round(adjusted_Rsquared, 4)))

  if(F_pvalue < 0.001){
    li[[2]][2] = "< 0.001"
  }

  names(li)[[1]] <- "Summary of the coefficents"
  names(li)[[2]] <- "F test: F statistics and p value"
  names(li)[[3]] <- "Residual standard error and R squared and adjusted R squared"

  return(li)
}
