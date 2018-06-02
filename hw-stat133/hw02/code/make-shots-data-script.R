<<<<<<< HEAD
#Title: GSW Shots Data
#Description: Prepared data on GSW player shot stats
#Input(s): player-name.csv files
#Output: shots-data.csv

#Reading in the five data sets
stephen <- read.csv('stephen-curry.csv', stringsAsFactors = FALSE)
andre <- read.csv('andre-iguodala.csv', stringsAsFactors = FALSE)
kevin <- read.csv('kevin-durant.csv', stringsAsFactors = FALSE)
draymond <- read.csv('draymond-green.csv', stringsAsFactors = FALSE)
klay <- read.csv('klay-thompson.csv', stringsAsFactors = FALSE)

#Adding names to each
stephen$name <- 'Stephen Curry'
andre$name <- 'Andre Iguodala'
kevin$name <- 'Kevin Durant'
draymond$name <- 'Draymond Green'
klay$name <- 'Klay Thompson'

#changing shot_made_flag to "missed shot" or "made shot"
stephen$shot_made_flag[stephen$shot_made_flag=='y'] <- 'made shot'
stephen$shot_made_flag[stephen$shot_made_flag=='n'] <- 'missed shot'

andre$shot_made_flag[andre$shot_made_flag=='y'] <- 'made shot'
andre$shot_made_flag[andre$shot_made_flag=='n'] <- 'missed shot'

kevin$shot_made_flag[kevin$shot_made_flag=='y'] <- 'made shot'
kevin$shot_made_flag[kevin$shot_made_flag=='n'] <- 'missed shot'

klay$shot_made_flag[klay$shot_made_flag=='y'] <- 'made shot'
klay$shot_made_flag[klay$shot_made_flag=='n'] <- 'missed shot'

draymond$shot_made_flag[draymond$shot_made_flag=='y'] <- 'made shot'
draymond$shot_made_flag[draymond$shot_made_flag=='n'] <- 'missed shot'

#add column minute containing minute number where shot occurred
stephen$minute <- (stephen$period)*12 - stephen$minutes_remaining
andre$minute <- (andre$period)*12 - andre$minutes_remaining
kevin$minute <- (kevin$period)*12 - kevin$minutes_remaining
klay$minute <- (klay$period)*12 - klay$minutes_remaining
draymond$minute <- (draymond$period)*12 - draymond$minutes_remaining

#send summary output of each fram into individual text files
sink(file = '../output/stephen-curry-summary.txt')
summary(stephen)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(andre)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(kevin)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(klay)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(draymond)
sink()

#stack the tables into one single data frame
library(tibble)
library(dplyr)
shotsdata <- bind_rows(stephen, andre, kevin, klay, draymond)
shotsdata
#export as shots-data.csv
sink(file = '../data/shots-data.csv')
write.csv(shotsdata)
sink()

#send summary output of assembled table
sink(file = '../output/shots-summary.txt')
summary(shotsdata)
=======
#Title: GSW Shots Data
#Description: Prepared data on GSW player shot stats
#Input(s): player-name.csv files
#Output: shots-data.csv

#Reading in the five data sets
stephen <- read.csv('stephen-curry.csv', stringsAsFactors = FALSE)
andre <- read.csv('andre-iguodala.csv', stringsAsFactors = FALSE)
kevin <- read.csv('kevin-durant.csv', stringsAsFactors = FALSE)
draymond <- read.csv('draymond-green.csv', stringsAsFactors = FALSE)
klay <- read.csv('klay-thompson.csv', stringsAsFactors = FALSE)

#Adding names to each
stephen$name <- 'Stephen Curry'
andre$name <- 'Andre Iguodala'
kevin$name <- 'Kevin Durant'
draymond$name <- 'Draymond Green'
klay$name <- 'Klay Thompson'

#changing shot_made_flag to "missed shot" or "made shot"
stephen$shot_made_flag[stephen$shot_made_flag=='y'] <- 'made shot'
stephen$shot_made_flag[stephen$shot_made_flag=='n'] <- 'missed shot'

andre$shot_made_flag[andre$shot_made_flag=='y'] <- 'made shot'
andre$shot_made_flag[andre$shot_made_flag=='n'] <- 'missed shot'

kevin$shot_made_flag[kevin$shot_made_flag=='y'] <- 'made shot'
kevin$shot_made_flag[kevin$shot_made_flag=='n'] <- 'missed shot'

klay$shot_made_flag[klay$shot_made_flag=='y'] <- 'made shot'
klay$shot_made_flag[klay$shot_made_flag=='n'] <- 'missed shot'

draymond$shot_made_flag[draymond$shot_made_flag=='y'] <- 'made shot'
draymond$shot_made_flag[draymond$shot_made_flag=='n'] <- 'missed shot'

#add column minute containing minute number where shot occurred
stephen$minute <- (stephen$period)*12 - stephen$minutes_remaining
andre$minute <- (andre$period)*12 - andre$minutes_remaining
kevin$minute <- (kevin$period)*12 - kevin$minutes_remaining
klay$minute <- (klay$period)*12 - klay$minutes_remaining
draymond$minute <- (draymond$period)*12 - draymond$minutes_remaining

#send summary output of each fram into individual text files
sink(file = '../output/stephen-curry-summary.txt')
summary(stephen)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(andre)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(kevin)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(klay)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(draymond)
sink()

#stack the tables into one single data frame
library(tibble)
library(dplyr)
shotsdata <- bind_rows(stephen, andre, kevin, klay, draymond)
shotsdata
#export as shots-data.csv
sink(file = '../data/shots-data.csv')
write.csv(shotsdata)
sink()

#send summary output of assembled table
sink(file = '../output/shots-summary.txt')
summary(shotsdata)
>>>>>>> 98aebd82c21e4ca13d630d895fdffb40db07cde1
sink()