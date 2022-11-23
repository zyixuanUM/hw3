test_that("multiplication works", {
  lm1 <- linear_model(Y~X, data)
  list1 <- as.data.frame(lm1[[1]])
  fit<-lm(Y~X)
  sfit <- summary(fit)
  compare_list1 <- as.data.frame(sfit$coefficients)
  expect_equal(list1[,1],compare_list1[,1], tolerance=1.5e-05)
})
