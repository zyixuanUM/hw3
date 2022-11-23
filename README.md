## Instruction
<br/> 
Compute the estimated coefficients and statistics from linear models.
<br/> 
Make the conclusion from the result of the function whether there is a significant association between the response and the covariates.
<br/> 

Rcpp function
<br/>
Compute the covariance between y and x.

## Mathmetical Formula

$\hat{\beta}=(X^TX)^{-1}X^TY$
<br/> 
$\hat{Y}=\hat{\beta}X$
<br/> 
$\hat{\epsilon}=Y-\hat{Y}$
<br/> 
$H=X(X^TX)^{-1}X^T$
<br/> 
$SSY=Y^T(I_n-1/n)Y$
<br/> 
$SSR=Y^T(H-1/n)Y$
<br/>
$SSE=Y^T(I_n-H)Y$
<br/>
$MSR=SSR/(p-1)$
<br/> 
$MSE=SSE/(n-p)$
<br/> 
$\hat{\sigma^2}=\frac{\hat{\epsilon}^T\hat{\epsilon}}{n-p}$
<br/> 
$R^2=\frac{SSR}{SSY}$
<br/> 
$R^2_{adjusted}=1-\frac{SSE/(n-p)}{SSY/(n-1)}$
<br/> 
$Var(\hat{\beta})=X^TX\hat{\sigma^2}$
<br/> 
$SE(\hat{\beta})=\sqrt{Var(\hat{\beta})}$
<br/> 
$F=\frac{MSR}{\hat{\sigma^2}}$
<br/> 
$t=\frac{\hat{\beta}}{SE(\hat{\beta})}$
<br/> 
$cov(Y,X)=\frac{1}{n-1}\Sigma{(Y_i-\bar{Y})(X_i-\bar{X})}$

## Install
<br/> 
npm install
<br/> 

## Test Cases
<br/>
X <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
<br/>
Y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
<br/>
data <- data.frame(Y,X)
<br/>
linear_model(Y~X, data)

x <- cbind(mtcars$disp, mtcars$drat)
<br/>
y <- mtcars$mpg
<br/>
linear_model(y~x, mtcars)

<br/>
cov_yx(Y,X) #run R cpp function
<br/>
all.equal(cov_yx(Y,X),cov(X,Y))

## Comparison
<br/> 
Use all.equal() and expect_equal() in testthat to compare the results between linear_model() and lm().


## Reference
<br/> 
Linear regression model lm() function.
<br/> 
Coviance cov() function.


