library(readr)
abalone <- read.table("abalone.data", sep = ",")

head(abalone)
tail(abalone)
str(abalone, vec.len = 1)

column_names <- c(
  'sex',
  'length',
  'diameter',
  'height',
  'whole_weight',
  'shucked_weight',
  'viscera_weight',
  'shell_weight',
  'rings'
)

column_types <- c(
  'character',
  'real',
  'real',
  'real',
  'real',
  'real',
  'real',
  'real',
  'integer'   
)

abalone <- read.table(
  'abalone.data',
  col.names = column_names,
  colClasses = column_types,
  sep = ","
)

str(abalone, vec.len = 1)

read.csv("abalone.data", col.names = column_names, colClasses = column_types)

ct <- 'cdddddddi'

read_csv("abalone.data", col_names = column_names, col_types = ct)

download.file('http://archive.ics.uci.edu/ml/machine-learning-databases/bridges/bridges.data.version1', 'bridges.data')

bridges1 <- read.table('bridges.data')
bridges2 <- read.csv('bridges.data')

#create vector of classes for first five columns
firstfive <- c(rep("character", 5), rep("NULL", 8))

bridges3 <- read.table('bridges.data', header = FALSE, sep = ",", colClasses = firstfive)
ncol(bridges3)

str(bridges1)
summary(bridges1)
head(bridges1)
tail(bridges1)
dim(bridges1)
names(bridges1)
colnames(bridges1)
nrow(bridges1)
ncol(bridges1)

library(dplyr)
bridges1sep <- separate(bridges1, "V1", c("Identifier",
                         "River",
                         "Location",
                         "Erected",
                         "Purpose",
                         "Length",
                         "Lanes",
                         "Clear-G",
                         "T-OR-D",
                         "Material",
                         "Span",
                         "Rel-L",
                         "Type"), sep = ",", fill = "warn")
select(bridges1sep)
colnames(bridges1sep)

#GSW Data Frames
Player <- c("Thompson", 
            "Curry", 
            "Green", 
            "Durant", 
            "Pachulia")
Position <- c('SG', 'PG', 'PF', 'SF', 'C')
Salary <- c(16663575, 12112359, 15330435, 26540100, 2898000)
Points <- c(1742, 1999, 776, 1555, 426)
PPG <- c(22.3, 25.3, 10.2, 25.1, 6.1)
Rookie <- c(rep('False', 5))

GSW.data <- data.frame(Player,
                       Position,
                       Salary,
                       Points,
                       PPG,
                       Rookie)
GSWlist.data <- list(Player,
                     Position,
                     Salary,
                     Points,
                     PPG,
                     Rookie)
GSW1 <- data.frame(GSWlist.data)

str(GSW1)
Position <- factor(Position)
class(Salary)
Points <- as.integer(Points)
class(Points)
class(PPG)
Rookie <- as.logical(Rookie)
GSWlist.data <- list(Player,
                     Position,
                     Salary,
                     Points,
                     PPG,
                     Rookie)
GSW1 <- data.frame(GSWlist.data)
str(GSW1)

bound <- cbind(Player, Position, Salary, Points, PPG, Rookie)
data.frame(bound)

#NBA Players
dat <- read.csv('nba2017-players.csv', stringsAsFactors = FALSE)
dim(dat)
head(dat)
tail(dat)
str(dat, vec.len = 1)
summary(dat)
ncol(dat)
nrow(dat)
dat[446:441, ]
dat[ ,4]
heights70 <- dat[dat$'height' < 70, ] 
summary(heights70)
C <- dat[dat$'position' == 'C', ]
C[ ,c(1,9)]
dat[dat$'player' == 'Kevin Durant', ]
dat[dat$'college' == "University of California, Los Angeles", ]
ave(dat$height)
