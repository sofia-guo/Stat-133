hw05-sofia-guo
================
Sofia Guo
April 27, 2018

Using dieroller to solve De Mere's problem
==========================================

Problem 1:
----------

``` r
#load package
library(dieroller)

#define die
die1 <- die()

#create empty vector to store number of 6's
freq_6 <- rep(0, 1000)

#roll die four times, 1000 games, collect all 6's
for (i in 1:1000) {
  freq_6[i] <- summary(roll(die1, 4))$freqs$count[5]
}

#number of games where at least one 6
sum(freq_6 >=1)
```

    ## [1] 513

``` r
#compute relative frequency of getting at least on 6
relative_freq_6 <- sum(freq_6 >= 1)/1000
relative_freq_6
```

    ## [1] 0.513

``` r
1-(5/6)^4
```

    ## [1] 0.5177469

Problem 2:
==========

``` r
#create empty vector to store number of 6's
freq_6_d1 <- rep(0, 1000)
freq_6_d2 <- rep(0, 1000)

#roll die four times, 1000 games, collect all 6's
for (i in 1:1000) {
  freq_6_d1[i] <- summary(roll(die1, 24))$freqs$count[5]
  freq_6_d2[i] <- summary(roll(die1, 24))$freqs$count[5]
}

#count number of 0's in one vector
non_double_6 <- sum(freq_6_d2 == 0)

#find number of games
num_games_6_II <- 1000-non_double_6
num_games_6_II
```

    ## [1] 988

``` r
#find relative probability
rel_prob_6_II <- 1000-non_double_6/1000
rel_prob_6_II
```

    ## [1] 999.988

``` r
1-(35/36)^24
```

    ## [1] 0.4914039
