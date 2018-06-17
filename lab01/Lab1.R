
# Exercise 1
80 + 20 + 527 + 10 + 1500 + 83
phone <- 80
phone

#Exercise 2
transportation <- 20
groceries <- 527
gym <- 10
rent <- 1500
other <- 83

# variables
total <- sum(transportation, groceries, gym, rent, other, phone)
total
#total expenses

semester <- total * 5
semester
#semester expenses

year <- semester * 2
year
#year expenses

# Exercise 3
expenses <- c(phone, transportation, groceries, gym, rent, other)
expenses
barplot(expenses)
decreasing <-  sort(expenses, decreasing = TRUE)
barplot(decreasing)
names(expenses) <- c('phone', 'transportation', 'groceries', 'gym', 'rent', 'other')
barplot(decreasing, names.arg = names(expenses))

#Pythagoras
#Calculate the hypotenuse of a right triangle with legs of length 3 and 4
a = 3
b = 4
c = sqrt(a^2 + b^2)
c

#binomial probability
n = 5
> k = 2
> p = 0.5
> choose(n, k)
[1] 10
> choose(n, k)*p^k*(1-p)^(n-k)
[1] 0.3125
> choose(n, k) * p^k * (1-p)^(n-k)
[1] 0.3125
> n = 10
> choose(n, k) * p^k * (1-p)^(n-k)
[1] 0.04394531
> n = 10
> k = 3
> p = 1/6
> choose(n, k) * p^k * (1-p)^(n-k)
[1] 0.1550454
> dbinom(2,5, 0.5)
[1] 0.3125
> dbinom(3, 3, 1/6)
[1] 0.00462963
> dbinom(2, 5, .35)
[1] 0.3364156
> 1- dbinom(3, 5, .35)
[1] 0.8188531
> dbinom(4, 5, .35) + dbinom(5, 5, .35)
[1] 0.0540225

