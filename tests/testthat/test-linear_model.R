test_that("multiplication works", {
  rm(list = c("linear_model"))
  lm1 <- linear_model(Y~X, data)
  list1 <- as.data.frame(lm1[[1]])
  fit<-lm(Y~X)
  sfit <- summary(fit)
  compare_list1 <- as.data.frame(sfit$coefficients)
  expect_equal(list1[,1],round(compare_list1[,1],4)) # estimated coefficients
  expect_equal(list1[,2],round(compare_list1[,2],4)) # std.error
  expect_equal(list1[,3],round(compare_list1[,3],4)) # t statistics
  expect_equal(list1[,4],round(compare_list1[,4],4)) # p-values from t statistics

  list2 <- as.data.frame(lm1[[2]])
  compare_list2 <- as.data.frame(sfit$fstatistic)
  expect_equal(as.numeric(list2[,1]),round(compare_list2[1,],4)) # F statistics

  list3 <- as.data.frame(lm1[[3]])
  compare_list3 <- cbind(as.data.frame(sfit$r.squared),as.data.frame(sfit$adj.r.squared))
  compare_list3 <- cbind(as.data.frame(sfit$sigma), compare_list3)
  expect_equal(list3[,1],round(compare_list3[,1],4)) # sigma
  expect_equal(list3[,2],round(compare_list3[,2],4)) # R-squared
  expect_equal(list3[,3],round(compare_list3[,3],4)) # adjusted R-squared
})
