# ================================================================
# Title: HW 03
# Author: Sofia Guo
# Date: 3/23/18
# Description: code for #3 of binomial functions for hw03
# ================================================================

#write function determining if value is integer
#' @title is_integer
#' @description test if numeric value is integer
#' @input a numeric value, single number
#' @output TRUE if integer, FALSE otherwise
is_integer <- function(x) {
  if (x %% 1 > 0) {
    return(FALSE)
  }
  else {
    return(TRUE)
  }
}

#Test Function
#TRUE
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)

#FALSE
is_integer(2.1)
is_integer(pi)
is_integer(0.01)

#write function determining if value is positive
#' @title is_positive
#' @description test if numeric value is positive
#' @input a numeric value, single number
#' @output TRUE if positive, FALSE otherwise
is_positive <- function(x) {
  if (x > 0) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

#Test Function
is_positive(0.01)
is_positive(2)

#FALSE
is_positive(-2)
is_positive(0)

#write function determining if value is nonnegative
#' @title is_nonnegative
#' @description test if numeric value is nonnegative
#' @input a numeric value, single number
#' @output TRUE if nonnegative, FALSE otherwise
is_nonnegative <- function(x) {
  if (x >= 0) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

#Test Function
is_nonnegative(0)
is_nonnegative(2)

#FALSE
is_nonnegative(-0.00001)
is_nonnegative(-2)

#write function determining if value is positive integer
#' @title is_positive_integer
#' @description test if numeric value is positive integer
#' @input a numeric value, single number
#' @output TRUE if positive integer, FALSE otherwise
is_positive_integer <- function(x) {
  if (is_positive(x) == TRUE & is_integer(x) == TRUE) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

#Test Function
is_positive_integer(2)
is_positive_integer(2L)

#FALSE
is_positive_integer(0)
is_positive_integer(-2)

#write function determining if value is nonnegative integer
#' @title is_positive_integer
#' @description test if numeric value is positive integer
#' @input a numeric value, single number
#' @output TRUE if positive integer, FALSE otherwise
is_nonneg_integer <- function(x) {
  if (is_nonnegative(x) == TRUE & is_integer(x) == TRUE) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

#Test
#TRUE
is_nonneg_integer(0)
is_nonneg_integer(1)

#FALSE
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)

#write function determining if value is probability
#' @title is_probability
#' @description test if numeric value is probability
#' @input a numeric value, single number
#' @output TRUE if positive integer, FALSE otherwise
is_probability <- function(x) {
  if (x >= 0 & x <= 1) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

#Test function
#TRUE
is_probability(0)
is_probability(0.5)
is_probability(1)

#FALSE
is_probability(-1)
is_probability(1.0000001)

#write function calculating factorial of nonnegative integer n
#' @title bin_factorial
#' @description calculate factorial of nonnegative integer
#' @input a numeric value, single number
#' @output numeric value
bin_factorial <- function(n) {
  fact1 <- seq(1, n)
  fact2 <- rep(0, n)
  for (i in 1:n) {
    fact2[i] <- fact1[i]
  }
  return(prod(fact2))
}

#Test function
bin_factorial(5)
bin_factorial(0)
bin_factorial(4)

#write function calculating number of combos in which k successes can occur in n trials
#' @title bin_combinations
#' @description calculate number of combinations 
#' @input n, numeric number of trials, k numeric successes
#' @output numeric value, combinations
bin_combinations <- function(n, k) {
  return((bin_factorial(n))/(bin_factorial(k)*bin_factorial(n-k)))
}

#Test
bin_combinations(n = 5, k = 2)
bin_combinations(10, 3)
bin_combinations(4, 4)

#write function calculating probability of event given n trials, k successes and p prob
#' @title bin_probability
#' @description calculate probability of binomial variable event
#' @input n, numeric number of trials, k numeric successes, p numeric probability
#' @output numeric value, probability
bin_probability <- function(trials, success, prob) {
  if (is_nonneg_integer(trials) == TRUE & is_nonneg_integer(success) == TRUE & is_probability(prob) == TRUE) {
    return((bin_combinations(trials, success))*prob^success * (1-prob)^(trials-success))
  }
  else {
    stop("trials must be nonnegative or probability must be valid")
  }
}

bin_probability(5, 2, 0.5)

#write function showing the probability distribution of event given n trials and p prob
#' @title bin_distribution
#' @description display the probability distribution of binomial variable event
#' @input n, numeric number of trials, p numeric probability
#' @output data frame with columns success and probability 
bin_distribution <- function(trials,prob){
  success <- seq(0, (trials), 1)
  probability <- rep(0, length(success))
  for (i in 0:trials) {
    probability[i] <- bin_probability(trials, i, prob) 
  }
  return(data.frame(success,probability))
}

bin_distribution(5, 0.5)

