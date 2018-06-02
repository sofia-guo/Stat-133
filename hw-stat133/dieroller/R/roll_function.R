#' @title Roll
#' @description Creates an object of class 'roll'
#' @param die object of class 'die'
#' @param times number of times rolled
#' @return an object of class roll
#' @return \item{rolls}{vector of roll outputs}
#' @return \item{sides}{vector with sides of die}
#' @return \item{prob}{vector of probabilities for each side of the die}
#' @return \item{total}{total number of tosses}
#' @return \item{total}{total number of rolls = times}
#' @export
#' @examples
#' fair rolls
#' set.seed(123)
#' fair_die <- die()
#' fair_50rolls <- roll(fair_die, times=50)

roll <- function(x, times) {
  check_times(times)
  outputs <- sample(x$sides, times, replace = TRUE, prob = x$prob)
  object <- list(
    rolls = outputs,
    sides = x$sides,
    prob = x$prob,
    total = times)
  class(object) <- "roll"
  object
}


# private function to check validity of times
check_times <- function(times) {
  if (!is.numeric(times)) {
    stop("\n'times' must be numeric")
  }
  if(times<=0) {
    stop("\n'times' must be postiive and nonzero")
  }
  if (any(is.na(times))) {
    stop("\n'times' cannot contain missing values")
  }
  TRUE
}


#' @export
print.roll <- function(x, ...) {
  cat('object "roll"\n\n')
  print(x$rolls)
}

#' @export
summary.roll <- function(x, ...) {
  count <- rep(0, length(x$sides))
  for (i in 1:length(x$sides)) {
    count[i] <- sum(x$rolls == x$sides[i])
  }
  freqs <- data.frame(
    sides = x$sides,
    count = count,
    prop = count/x$total)
  obj <- list(freqs = freqs)
  class(obj) <- "summary.roll"
  obj
}


#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freqs)
}

#' @export
plot.roll <- function(x, ...) {
  tbl <- table(x$rolls)/x$total
  barplot(tbl, xlab = "sides of die", ylab = 'relative frequencies')
}



#' @export
#' #replacement method
"[<-.roll" <- function(x, i, value) {
  x$rolls[i] <- value
}


#' @export
#' #extraction method
"[.roll" <- function(x, i) {
  x$rolls[i]
}


#' @export
"+.roll" <- function(x, incr) {
  roll(x, (x$total + incr))
}


#' @rdname roll
#' @param x an R object
#' @export
is.roll <- function(x) {
  inherits(x, "roll")
}


#' @rdname toss
#' @export
as.roll <- function(x) {
  x_roll <- die(unique(x))
  roll(xroll, x)
}
