# =========================================================================
# Author: Sofia Guo
# Date: 3/22/18
# Title: Lab 09
# Description: File contains lab 09 test code
# =========================================================================

#test following vectors
x <- c(1, 2, 3, 4, 5)
y <- c(1, 2, 3, 4, NA)
z <- c(TRUE, FALSE, TRUE)
w <- letters[1:5]

# load the source code of the functions to be tested
source("functions.R")

# context with one test that groups expectations
context("Test for range value") 

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_range(x), 4)
  expect_length(stat_range(x), 1)
  expect_type(stat_range(x), 'double')
})


#use y to test stat_range()
test_that("range works as expected", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(stat_range(y), NA_real_)
  expect_length(stat_range(y), 1)
})

#use z
test_that("range works as expected", {
  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(stat_range(z), 1L)
  expect_length(stat_range(z), 1)
  expect_type(stat_range(z), 'integer')
})

#use w
test_that("range works as expected", {
  w <- letters[1:5]
  expect_error(stat_range(w))
})

# ==================================================
#Testing for stat centers
# context with one test that groups expectations
context("Test for measures") 

test_that("mean and median are true", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_centers(x), c(3, 3))
  expect_length(stat_centers(x), 2)
  expect_type(stat_centers(x), 'double')
})

#Testing for stat centers
test_that("range, IQR and SD are accurate", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_spreads(x), c(4, 2, sd(x)))
  expect_length(stat_spreads(x), 3)
  expect_type(stat_spreads(x), 'double')
})
