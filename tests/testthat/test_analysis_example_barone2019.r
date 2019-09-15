context("Checking analysis example: barone2019")

library(metadat)
library(metafor)

## Make copy of dataset
dat <- metadat::dat.barone2019

# First model 
res <- rma(yi=logit.p., sei = sei, data=dat, slab = paste(Author, Year)) 
res

test_that("Returns rma object", {
  expect_is(res, "rma.uni")
})

test_that("results are correct for the random-effects model.", {
  expect_identical(round(res$k, digits = 2), 56)
  expect_identical(round(as.numeric(res$beta[,1]), digits = 7), 0.5662584)
  expect_identical(round(as.numeric(res$tau2), digits = 7), 0.4949573)
})
