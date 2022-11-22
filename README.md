##1. Instruction
Compute the estimated coefficients and statistics from linear models.
Make the conclusion from the result of the function whether there is a significant association between the response and the covariates.

##2. Mathmetical Formula
<br/> 
$\hat{\beta}=(X^TX)^{-1}X^TY$
<br/> 
$\hat{Y}=\hat{\beta}X$
<br/> 
$\hat{\epsilon}=Y-\hat{Y}$
<br/> 
$H=X(X^TX)^{-1}X^T$
<br/> 
$SSR=Y^T(H-1/n)Y$
<br/> 
$MSR=SSR/(p-1)$
<br/> 
$\hat{\sigma^2}=\frac{\hat{\epsilon}^T\hat{\epsilon}}/{n-p}$
<br/> 
$Var(\hat{\beta})=X^TX\hat{\sigma^2}$
<br/> 
$SE(\hat{\beta})=\sqrt{Var(\hat{\beta})}$
<br/> 
$F=\frac{MSR}/{\hat{\sigma^2}}$
<br/> 
$t=\frac{\hat{\beta}}/{SE(\hat{\beta})}$
<br/> 

##3. Install
npm install

##4. Reference
lm() function


