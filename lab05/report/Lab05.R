library(dplyr)
library(ggplot2)
library(readr)
setwd("C:/Users/Sammy/Desktop/lab05/data")
dat <- read_csv('nba2017-players.csv')
#select first five rows
firstfive <- slice(dat, 1:5)
firstfive
#selct rows 10, 15, 20...
everyfive <- slice(dat, seq(10,50,5))
everyfive
#select last 5 rows
lastfive <- slice(dat,(441-4):441)
lastfive
#select players height < 70 inches
sev <- filter(dat, height < 70)
sev
#select GSW
GSW <- filter(dat, team == 'GSW')
GSW
#LAL names
LAL <- filter(dat, team == 'LAL')
LALnames <- select(LAL, player)
LALnames
#name and salary of GSW point guards
GSWpg <- select((filter(GSW, position == 'PG')), player, salary)
GSWpg
#name, team, height, weight of 10+ yrs making 10 mill or less
abc <- filter(dat, experience >=10, salary <= 10000000)
abcd <- select(abc, player, team, height, weight)
abcd
#name, team, height, weight of rookie players 20 yrs making 10 mill or less
bc <- filter(dat, experience ==0, age ==20, salary <= 10000000)
bcd <- select(abc, player, team, height, weight)
bcd

#add new variable product with height X weight
mutate(GSW, product = height*weight)
#new data frame with logs
gsw3 <- mutate(GSW, log_height = log(height), log_weight = log(weight))
gsw3
#use original frame to filter and arrange players with height <71 in incr order
library(magrittr)
dat %>% filter(height < 71) %>% arrange(height)
#display the name, team, and salary, of the top-5 highest paid players
dat %>% arrange(desc(salary)) %>% slice(1:5) %>% select(player, team, salary)
#display the name, team, and points3, of the top 10 three-point players
dat %>% arrange(desc(points3)) %>% slice(1:10) %>% select(player, team, points3)
#gsw_mpg with plers, experience, and mins per game sorted by min per game in descending order
gsw_mpg <- GSW %>% mutate(min_per_game = minutes/games) %>% arrange(desc(min_per_game)) %>% select(player, experience, min_per_game)
gsw_mpg

#use summarise() to get the largest height value.
summarize(dat, max(height))
#use summarise() to get the standard deviation of points3.
summarize(dat, sd(points3))
#use summarise() and group_by() to display the median of three-points, by team.
summarize(group_by(dat, team), threeptmedian = median(points3))
#display the average triple points by team, in ascending order, of the bottom-5 teams (worst 3pointer teams)
slice(arrange(summarize(group_by(dat, team), avgtp = mean(points3)), avgtp), 1:5)
#obtain the mean and standard deviation of age, for Power Forwards, with 5 and 10 years (including) years of experience.
exp <- dat[dat$experience == 5&10, ]
slice(summarize(group_by(exp, position), avg = mean(age), std = sd(age)), 2)

#Using ggplot2
#make scatterplot of height and weight
ggplot(data = dat, aes(x = height, y = weight)) + geom_point()
#scatterplot of height and weight with names of the players
ggplot(data = dat, aes(x = height, y = weight)) + geom_point() + geom_text(data = dat, label = dat$player)
#Get a scatter plot of height and weight, for ALL the warriors, displaying their names with geom_label().
ggplot(data = GSW, aes(x = height, y = weight)) +geom_point() + geom_label(data = GSW, label = GSW$player)
#Get a density plot of salary (for all NBA players).
ggplot(data = dat, aes(x = player, y= salary)) + geom_density(data = dat)
#Get a histogram of points2 with binwidth of 50 (for all NBA players).
ggplot(dat, aes(points2)) + geom_histogram(binwidth=50)
#Get a barchart of the position frequencies (for all NBA players).
ggplot(dat, aes(position)) + geom_bar()
#Make a scatterplot of experience and salary of all Centers, and use geom_smooth() to add a regression line.
centers <- dat[dat$position == "C", ]
ggplot(centers, aes(x=experience, y=salary)) + geom_point() + geom_smooth(method=lm)
#Repeat the same scatterplot of experience and salary of all Centers, but now use geom_smooth() to add a loess line (i.e. smooth line).
ggplot(centers, aes(x=experience, y=salary)) + geom_point() + geom_smooth()

#Faceting
#Make scatterplots of experience and salary faceting by position
ggplot(dat, aes(experience, salary)) + geom_point() + facet_grid(~ position)
#Make scatterplots of experience and salary faceting by team
ggplot(dat, aes(experience, salary)) + geom_point() + facet_grid(~ team)
#Make density plots of age faceting by team
ggplot(dat, aes(age)) + geom_density(kernel= "gaussian") + facet_grid(~ team)
#Make scatterplots of height and weight faceting by position
ggplot(dat, aes(height, weight)) + geom_point() +facet_grid(~ position)
#Make scatterplots of height and weight, with a 2-dimensional density, geom_density2d(), faceting by position
ggplot(dat, aes(height, weight)) + geom_point() + geom_density2d() + facet_grid(~ position)
#Make a scatterplot of experience and salary for the Warriors, but this time add a layer with theme_bw() to get a simpler background
ggplot(dat, aes(experience, salary)) + geom_point() + theme_bw()
#Repeat any of the previous plots but now adding a leyer with another theme e.g. theme_minimal(), theme_dark(), theme_classic()
ggplot(dat, aes(height, weight)) + geom_point() + geom_density2d() + facet_grid(~ position) + theme_classic()
