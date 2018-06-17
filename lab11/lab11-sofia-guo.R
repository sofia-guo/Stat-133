# ===========================================================================
# Title: lab 11
# Author: Sofia Guo
# Date: 4/12/18
# Description: simulations in R and creating a basic shiny app
# ===========================================================================

#Computing Probabilities

#create two character vectors box1 and box2
box1 <- c('blue', 'blue', 'red')
box2 <- c('blue', 'blue', rep('red',3), 'white')

#random experiment using runif(1)
repetitions <- 1000
drawn_balls <- matrix(data = NA, 1000, 4)

random_number <- runif(1)
for (i in 1:repetitions) {
  
  if (random_number > 0.5) {
    drawn_balls[i,] <- sample(box1, 4, replace = TRUE)
  } else if (random_number <= 0.5) {
    drawn_balls[i,] <- sample(box2, 4)
  }
}

drawn_balls
head(balls)

#compute the proportion of samples containing 0-4 blue balls
rows <- nrow(drawn_balls)
blues <- rep(0, rows)

for (i in 1:rows) {
    blues[i] <- sum(drawn_balls[i,] =='blue')
  }

proportions <- as.data.frame(table(blues))
proportions %>% mutate(proportion = Freq/repetitions)

#Relative frequencies
reps <- seq(1, 1000)

zeroes <- cumsum(blues == 0)/reps
ones <- cumsum(blues == 1)/reps
twos <- cumsum(blues == 2)/reps
threes <- cumsum(blues == 3)/reps
fours <- cumsum(blues == 3)/reps

relative_freqs <- data.frame(reps, zeroes,ones, twos, threes, fours)
head(relative_freqs)
ncol(relative_freqs)

#plot relative frequencies of blue balls

#ungroup
library(ggplot2)
library(reshape2)

blue_plot <- as.data.frame(melt(relative_freqs, id.vars = 'reps'))


ggplot(blue_plot, aes(reps, value, col=variable)) + geom_line()

head(blue_plot)
