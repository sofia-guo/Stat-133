#' @title Die
#' @description Creates an object of class "die'
#' @param sides vector of die sides
#' @param prob vector of die probabilities
#' @return an object of class die
#' @export
#' @examples
#'
#' default
#' fair_die <- die()
#'
#' # weird die
#' weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
#'
#' # loaded die
#' loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#'
#' # bad die
#' bad_die <- die(sides = c('a', 'b', 'c', 'd', 'e'))

die <- function(sides = seq(1, 6), prob = rep(1/6, 6)) {
  check_sides(sides)
  check_prob(prob)

  object <- list(
    sides = sides,
    prob = prob)
  class(object) <- "die"
  object
}


# private function to check vector of sides
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'prob' must be a vector of length 6")
  }
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}


# private function to check vector of probabilities
check_prob <- function(prob) {
  if (length(prob) != 6| !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}



#' @export
print.die <- function(x, ...) {
  cat('object "die"\n\n')
  sides <- x$sides
  prob <- x$prob
  print(data.frame(sides, prob, stringsAsFactors = FALSE))
}

