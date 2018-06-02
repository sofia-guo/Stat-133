# ============================================================
# Title: regex-functions.R
# Author: Sofia Guo
# Date:  4/13/18
# Description: contains functions for regex for hw04
# ============================================================

#Write split_chars function

split_chars <- function(x) {
  unlist(strsplit(x, ''))
}
bears <- "Go Bears!"
bears1 <- split_chars(bears)


#Write num_vowels()
num_vowels <- function(x) {
  lower <- tolower(x)
  vowels <- c('a', 'e', 'i', 'o', 'u')
  vowels1 <- lower[lower %in% vowels]
  counts <- table(vowels1)
  return(counts)
}

#Counting vowels
count_vowels <- function(x) {
  split <- split_chars(x)
  vowels <- num_vowels(split)
  return(vowels)
}

#Reverse characters
reverse_chars <- function(x) {
  split <- split_chars(x)
  return(str_c(str_sort(split), sep = ""))
}

#Reverse words
reverse_words <- function(x) {
  split <- str_split(x, pattern = ' ')
  reverse <- str_sort(split, decreasing = TRUE)
  return((reverse))
}
