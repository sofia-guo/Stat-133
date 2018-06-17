# ============================================================
# Title: lab10
# Author: Sofia Guo
# Date: 4/5/2018
# Description: script file for lab on regular expressions
# ============================================================

#Load packages
library(dplyr)
library(stringr)
library(plotly)

#name data file
dat <- read.csv('mobile-food-sf.csv', stringsAsFactors = FALSE)

#Plots with Plotly
day_freqs <- table(dat$DayOfWeekStr)

barplot(day_freqs, border = NA, las = 3)

plot_ly(x = names(day_freqs),
        y = day_freqs,
        type = 'bar')
#putting data in a tibble
# day frequencies table
day_counts <- dat %>% 
  select(DayOfWeekStr) %>%
  group_by(DayOfWeekStr) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

day_counts

#passing day_counts to plot_ly
plot_ly(day_counts, 
        x = ~DayOfWeekStr, 
        y = ~count,
        type = 'bar')
#reordering the bars
plot_ly(day_counts, 
        x = ~reorder(DayOfWeekStr, count), 
        y = ~count,
        type = 'bar')
# ===========================================
#changing times using column starttime
# toy string
time1 <- '10AM'

#hour
str_sub(time1, start =1, end =2)

#period
str_sub(time1, start = 3, end = 4)

#subset hour and periods with str_sub()
times <- c('12PM', '10AM', '9AM', '8AM', '2PM')

# subset time
str_sub(times, end = -3)

# subset period
str_sub(times, start = -2)

#using function str_replace()
str_replace(times, pattern = 'AM|PM', replacement = '')

#Using times, create a numeric vector hours containing just the number time (i.e. hour)
hour <- str_sub(times, end = -3)
hours <- as.double(hour)
hours

#Using times, create a character vector periods containing the period, e.g. AM or PM
periods <- str_sub(times, start = -2)
periods

#Use plot_ly() to make a barchart of the counts for AM and PM values.
periodsdat <- as.data.frame(periods)

library(magrittr)

periods_table <- periodsdat %>%
  group_by(periods) %>%
  summarise(count = n())

periods_table

plot_ly(periods_table, x = ~periods,
        y = ~count,
        type = 'bar')

#Write R code to create a vector start24 that contains the hour in 24hr scale.
converted_24 <- function(x) {
  time_counts <- rep(0, length(x))
  for (i in seq_along(x)) {
  if (x[i] == '12PM') {
    time_counts[i] <- (as.double(str_replace(x[i], pattern = 'AM|PM', replacement = '')))
  }
    
  else if ((str_sub(x[i], start = -2)) == 'PM') {
    time_counts[i] <- (as.double(str_replace(x[i], pattern = 'AM|PM', replacement = ''))) + 12
  }
  else if (x[i] == '12AM') {
    time_counts[i] <- (as.double(str_replace(x[i], pattern = 'AM|PM', replacement = ''))) -12
  }
  else {
    time_counts[i] <- (as.double(str_replace(x[i], pattern = 'AM|PM', replacement = '')))
      }
  }
  return(time_counts)
  }
converted_24(times)

#With the starting and ending hours, calculate the duration, and add one more column duration to the data frame dat:
start <- converted_24(dat$starttime)
end <- converted_24(dat$endtime)
dat <- mutate(dat, duration = end-start)
dat

#Latitude and Longitude Coordinates
#definte vector with more location values to generalize code
locs <- dat$Location

#remove the parentheses
loc1 <- str_replace_all(locs, pattern = '\\(|\\)', replacement = '')
#remove the commas
lat_lon <- str_split(loc1, pattern = ',')
#use str_split() to create list lat_lon containing lat and longitude values
lat <- lapply(lat_lon, function(x) x[1])

#Create list of longitudes
lon <- lapply(lat_lon, function(x) x[2])

#convert both to vector
lat <- as.numeric(unlist(lat))
lon <- as.numeric(unlist(lon))

#add to data set
dat <- mutate(dat, lat = lat, lon = lon)
dat

#Plotting locations on a map
plot_ly(dat, x = ~lon, y = ~lat, type = 'scatter', mode = 'markers')

#RgoogleMaps
library(RgoogleMaps)
# coordinates for center of the map
center <- c(mean(dat$lat, na.rm = TRUE), mean(dat$lon, na.rm = TRUE))

# zoom value
zoom <- min(MaxZoom(range(dat$lat, na.rm = TRUE), 
                    range(dat$lon, na.rm = TRUE)))

# san francisco map
map1 <- GetMap(center=center, zoom=zoom, destfile = "san-francisco.png")
PlotOnStaticMap(map1, dat$lat, dat$lon, col = '#ed4964', pch = 20)

#Maps with 'ggmap'
library(ggmap)
# add variables 'lat' and 'lon' to the data frame
dat <- na.omit(dat)

# ggmap typically asks you for a zoom level, 
# but we can try using ggmap's make_bbox function:
sbbox <- make_bbox(lon = dat$lon, lat = dat$lat, f = .1)
sbbox

# get a 'terrain' map
sf_map <- get_map(location = sbbox, maptype = "terrain", source = "google")
sf_map

#plot terrain map
ggmap(sf_map) + 
  geom_point(data = dat, 
             mapping = aes(x = lon, y = lat), 
             color = "red", alpha = 0.2, size = 1)
#Look for specific types of food
foods <- dat$optionaltext[1:10]

#match burritos and Burritos
str_detect(foods, "Burritos")
str_detect(foods, 'burritos')

#try other pattern
str_detect(foods, 'tacos')
str_detect(foods, 'quesadillas')

#create data frame burritos by subestting
burritos <- subset(dat, optionaltext ='burritos')
burritos

#use lat and ln to display map of locations with burritos
ggmap(sf_map) + 
  geom_point(data = burritos, 
             mapping = aes(x = lon, y = lat), 
             color = "red", alpha = 0.2, size = 1)
