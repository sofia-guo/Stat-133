hw04-sofia-guo
================
Sofia
April 13, 2018

1.4) Archive of Stringr
=======================

``` r
library(XML)
library(readr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(magrittr)
library(stringr)
library(ggplot2)
```

    ## Warning: package 'ggplot2' was built under R version 3.4.4

``` r
#source functions
source('../code/archive-functions.R')
raw_data <- read_archive('stringr')
clean_data <- clean_archive(raw_data)
plot_archive(clean_data)
```

![](images/unnamed-chunk-1-1.png)

``` r
#all data on one plot
combined <- group_by(rbind(clean_data, clean_data_dplyr, clean_data_ggplot2, clean_data_knitr, clean_data_xml), name)

#Combined graph
ggplot(combined, aes(date, size), scales = free) + geom_step(combined, mapping=aes(date, size))
```

![](images/unnamed-chunk-1-2.png)

``` r
#Facetted graph
ggplot(combined, aes(date, size)) + geom_step(combined, mapping=aes(date, size)) + facet_wrap(~name)
```

![](images/unnamed-chunk-1-3.png)

2) Regex Functions
==================

``` r
source('../code/regex-functions.R')

#Splitting Characters
split_chars('Go Bears!')
```

    ## [1] "G" "o" " " "B" "e" "a" "r" "s" "!"

``` r
split_chars('Expecto Patronum')
```

    ##  [1] "E" "x" "p" "e" "c" "t" "o" " " "P" "a" "t" "r" "o" "n" "u" "m"

``` r
#Number of Vowels
vec <- split_chars('Go Bears!')
num_vowels(vec)
```

    ## vowels1
    ## a e o 
    ## 1 1 1

``` r
#Counting Vowels
count_vowels("The quick brown fox jumps over the lazy dog")
```

    ## vowels1
    ## a e i o u 
    ## 1 3 1 4 2

``` r
count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAXY DOG")
```

    ## vowels1
    ## a e i o u 
    ## 1 3 1 4 2

``` r
#reversing characters
reverse_chars('gattaca')
```

    ## [1] "a" "a" "a" "c" "g" "t" "t"

``` r
reverse_chars('Lumox Maxima')
```

    ##  [1] " " "a" "a" "i" "L" "m" "m" "M" "o" "u" "x" "x"

``` r
#Reversing sentences by Words
reverse_words("sentence! this reverse")
```

    ## [1] "c(\"sentence!\", \"this\", \"reverse\")"

``` r
reverse_words('string')
```

    ## [1] "string"

3) Data Emotion in Text
=======================

``` r
#read csv
tweet <- read.csv('../data/text-emotion.csv', stringsAsFactors = FALSE)
sum_tweet <- summary(nchar(tweet$content))
sum_tweet
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   43.00   69.00   73.44  103.00  184.00

``` r
#histogram
hist(sum_tweet)
```

![](images/unnamed-chunk-3-1.png)

``` r
#3.2) Number of mentions
content <- str_c(tweet$content, sep = "", collapse = TRUE)
str_count(content, '@')
```

    ## [1] 20336

``` r
#3.3) Hashtags
str_count(content, '#')
```

    ## [1] 972
