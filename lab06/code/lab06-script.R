# Title: Lab06
# Description: This script runs dplyr and ggplot explorations.
# Input(s): data file 'nba2017-players.data'
# Output(s): data file 'nba2017-players.csv'
# Author(s): Sofia Guo
# Date: 3/1/2018

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

nba <- read_csv('nba2017-players.csv')
warriors <- data.frame(arrange(filter(nba, team == 'GSW'), salary))
warriors

write.csv(warriors, file = '../data/warriors.csv')

lakers <- arrange(filter(nba, team == 'LAL'), desc(experience))
write_csv(lakers, '../data/lakers.csv')

#sinking R data
sink(file = '../output/data-structure.txt')
str(data.frame(nba))
sink()

sink(file = '../output/summary-warriors.txt')
summary(warriors)
sink()

sink(file = '../output/summary-lakers.txt')
summary(lakers)
sink()

#saving base plots
png(filename = "../images/scatterplot-height-weight.png")
plot(nba$height, nba$weight, pch = 20,
     xlab = "Height", ylab = 'Height')
dev.off()

png(filename = "../images/scatterplot-height-weight-hd.png")
plot(nba$height, nba$weight, pch = 40,
     xlab = "Height", ylab = 'Height')
dev.off()

jpeg(filename = "../images/histogram-age.jpeg", width = 600, height = 400)
hist(nba$age)
dev.off()

pdf(file = '../images/histogram-age.pdf', width = 7, height = 5)
hist(nba$age)
dev.off()

#Exporting some ggplots
#Use ggplot() to make a scatterplot of points and salary, and store it in a ggplot object named gg_pts_salary. 
gg_pts_salary <- ggplot(nba, aes(points, salary)) + geom_point()
ggsave(filename = '../images/points_salary.pdf', gg_pts_salary, width = 7, height = 5, units = 'in') 

#scatter of height and weight
gg_ht_wt_positions <- ggplot(nba, aes(height, weight)) + geom_point() + facet_grid(~ position)
ggsave(filename = '../images/height_weight_by_position.pdf', gg_ht_wt_positions, width = 6, height = 4, units = "in")

#More dplyr
#player names of Lakers
nba %>% 
  filter(team == 'LAL') %>% 
  select('player')
#name and salary of GSW PG's
nba %>% 
  filter(team == 'GSW'& position == 'PG') %>% 
  select('player', 'salary')
#name age and team of players with 10+ yrs experience and making 10 mill or less
nba %>%
  filter(experience >= 10 & salary <= 10000000) %>%
  select('player', 'age','team')
#select the name, team, height, and weight, of rookie players, 20 years old, displaying only the first five occurrences (i.e. rows).
nba %>%
  filter(experience == 0 & age == 20) %>%
  slice(1:5)
#data frame gsw_mpg that contains variables for players, experience, and min per game sorted in descending order
gsw_mpg <- nba %>%
            filter(team == "GSW") %>%
            mutate(min_per_game = minutes/games) %>%
            select('player', 'experience', 'min_per_game') %>%
            arrange(desc(min_per_game))
#display avg points3 by team in ascending order of the bottom 5 teams
nba %>% 
  group_by(team) %>% 
  summarize(points3avg = mean(points3))
#obtain mean and stdev of age for PF with 5 and 10 years of experience
nba %>%
  filter(experience == c(5, 10) & position == 'PF') %>%
  summarize(agemean = mean(age), stdage = sd(age))
  
