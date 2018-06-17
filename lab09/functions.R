# =========================================================================
# Author: Sofia Guo
# Date: 3/22/18
# Title: Lab 09
# Description: File contains functions for lab 09
# =========================================================================

#load library
library(testthat)

#create basic function to compute the overall range of numeric vector
#' @title stat_range
#' @description computes the range of a numeric vector
#' @input a numeric vector
#' @output the range value (max-min)
stat_range <- function(x) {
  return(max(x) - min(x))
}

#Write function stat_centers()
#' @title stat_centers()
#' @description computes measures of center such as Median and Mean
#' @input numeric vector
#' @output a numeric vector with median and mean
stat_centers <- function(x) {
  mean <- mean(x)
  median <- median(x)
  return(c(mean, median))
}

#Write function stat_spreads()
#' @title stat_spreads()
#' @description  computes measures of spread like range IQR, STD
#' @input numeric vector
#' @output numeric vector with range, iqr, and std
stat_spreads <- function(x) {
  range <- stat_range(x)
  IQR <- IQR(x)
  std <- sd(x)
  return(c(range, IQR, std))
}

