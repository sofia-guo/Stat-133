#Triple outputs
vec <- c(seq(3, 50, 10))

for(j in c(1:length(vec))) {
  print(vec[j] * 3)
}

#create vec2 to store values
vec2 <- rep(0, length(vec))

for (i in c(1:length(vec))) {
  vec2[i] <- vec[i] *3
  print(vec2)
}

#Summation Series 1
vec3 <- c(1, rep(1/2,100))
for (k in 1:length(vec3)) {
  sum1 <- vec3[k]**(k-1)
}
sum1
#converges to zero as n increases

#Summation Series 2
vec4 <- c(1, rep(1/9,100))
for (k in 1:length(vec4)) {
  sum2<- vec4[k]**(k-1)
}
sum2
#converges to zero as n increases

#Arithmetic Series
vec5 <- rep(3, 500)
for (n in 1:length(vec5)) {
  sum3 <- (3 + 3*(n-1))
}
sum3
#diverges to positive infinity

#Geometric Sequence
vec6 <- rep(3,12)
for (n in 1:length(vec6)) {
  sum4 <- (3*2^(n-1))
}
sum4
#diverges to positive infinity

#Sine Approximation
x
for (i in seq(0, 10, 2)) {
  sum5[i] <- (x[i]^(i+1))/factorial(i+1)
}
sum5
sin(x)
#the smaller n is, the more inaccurate the approximation

#For loop with a matrix
set.seed((123))
X <- matrix(rnorm(12), nrow = 4, ncol =3)
X
# empty matrix Y
Y <- matrix(NA, nrow = 4, ncol = 3)

# for loop to get matrix Y
for (i in 1:nrow(X)) {
  for (j in 1:ncol(X)) {
    if (X[i, j] > 0) {
      X[i,j] <- sqrt(X[i, j])
    }
    else if (X[i, j] < 0) {
      X[i, j] <- (X[i,j])^2
    }
    Y[i,j] <- X[i,j] 
  }
}
Y

#Make a reduce function
#' @title reduce(x)
#' @description reduce number until odd
#' @param x numeric input
#' @return last prime factor
reduce <- function(x) {
  while (x %% 2 ==0) {
    print(x)
    x <- x /2
  }
  return(x)
}
reduce(898128000)

#Average
#using for loop
x <- 1:100
y = 0
for (i in 1:length(x)) {
  sum8 <- (x[i]/100)
}
sum8

#using while loop
while (x == x) {
  print(sum(x)/length(x))
  if (sum(x/length(x)) == sum(x)/length(x)) {
    break
  }
}

#using repeat loop
repeat {
  print(sum(x)/length(x))
  if (sum(x/length(x)) == sum(x)/length(x)) {
    break
  }
}

#Standard deviation

#using for loop
x <- 1:100
n <- length(x)
for (i in 1:n) {
  sum9 <- (1/(n-1)) * (x[i] - mean(x))^2
}
sum9

#using while loop
while (x == x) {
  print((1/(n-1)) * (x[i] - mean(x))^2)
  if ((1/(n-1)) * (x[i] - mean(x))^2 == (1/(n-1)) * (x[i] - mean(x))^2) {
    break
  }
}

#using repeat loop
repeat {
  print((1/(n-1)) * (x[i] - mean(x))^2)
  if ((1/(n-1)) * (x[i] - mean(x))^2 == (1/(n-1)) * (x[i] - mean(x))^2) {
    break
  }
}

#Geometric Mean: the nth root of the product of n numbers

#using for loop
x <- 1:100
n <- length(x)
sum10 <- 1
for (i in 1:n) {
  sum10 <- (sum10 * x[i])^(1/n)
}
sum10


#using while loop
while (x == x) {
  print(x[i]^(1/n))
  if (x[i]^(1/n) == x[i]^(1/n)) {
    break
  }
}

#using repeat loop
repeat {
  print(x[i]^(1/n))
  if (x[i]^(1/n) == x[i]^(1/n)) {
    break
  }
}

#Distance Matrix of letters
num_letters <- length(LETTERS)
set.seed(123)
values <- sample.int(num_letters) 
distances <- values %*% t(values)
diag(distances) <- 0
dimnames(distances) <- list(LETTERS, LETTERS)
distances[1:5, 1:5]

vec <- c('E', 'D', 'A')

#Write a function to calculate distance between vector letters

#' @title get_dist()
#' @description total distance between letters in matrix
#' @param distances matrix input of distances btwn letters, ltrs character vec of upper case letters
#' @return total distance between letters in vector

get_dist <- function(distances, ltrs) {
  results <- rep(0, length(ltrs))
    for (i in 1:(length(ltrs) - 1)) {
      results[i] <- distances[ltrs[i], ltrs[i+1]]
    }
    return(sum(results))
  }

get_dist(distances, vec)

err <- c('E', 'D', ')')
get_dist(distances, err)

#Test Function
cal <- c('C', 'A', 'L')
get_dist(distances, cal)

stats <- c('S', 'T', 'A', 'T', 'S')
get_dist(distances, stats)

oski <- c('O', 'S', 'K', 'I')
get_dist(distances, oski)

zzz <- rep('Z', 3)
get_dist(distances, zzz)

lets <- LETTERS
get_dist(distances, lets)

first <- c('S', 'O', 'F', 'I', 'A')
get_dist(distances, first)

last <- c('G', 'U', 'O')
get_dist(distances, last)

strings <- list(
  cal = cal,
  stats = stats,
  oski = oski,
  zzz = zzz,
  lets = lets,
  first = first,
  last = last
)

#making strings_dists
strings_dist <- rep(0, length(strings))
for (i in 1:length(strings)) {
  strings_dist[i] <- get_dist(distances, strings[[i]])
}

strings_dist