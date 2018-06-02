# ============================================================
# Title: archive-functions.R
# Author: Sofia Guo
# Date:  4/13/18
# Description: contains functions for archive manipulation for hw04
# ============================================================

#Write read_archive
#' @Title: read_archive
#' @Description: take name of package and return data frame of html archive
#' @Input: character string name of package
#' @Output: data frame

read_archive <- function(x) {
  url <- ('http://cran.r-project.org/src/contrib/Archive/x')
  url_x <- gsub('x', x, url)
  tbl_html <- readHTMLTable(url_x)
  tbl <- na.omit(as.data.frame(tbl_html[[1]], stringsAsFactors = FALSE))
  tbl <- tbl[-1,-1]
  tbl <- subset(tbl, select =-(Description))
  return(tbl)
}

read_archive('stringr')

#1.2) Data Cleaning
#write clean_archive() taking output of read_archive() and retuning 'tidy' table with:
  # Name as chr
  # version as chr
  # date as date
  # size as numeric (in KB, must be converted to KB if in MB, use for loop)

#Write sub functions first

#Extract a date from factor
clean_date <- function(x) {
  x_chr <- as.character(x$`Last modified`)
  x$`Last modified` <- x_chr
  date <- x$`Last modified`
  date_chr <- str_extract_all(date, pattern = '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
  date_date <- as.Date(unlist(date_chr))
  return(date_date)
}

#Test
clean_date(read_archive('stringr'))

#Extract a version
extract_version <- function(x) {
    x_chr <- as.character(x$Name)
    x$Name <- x_chr
    ver <- x$Name
    #Split name from version
    ver_split <- str_split(ver, pattern = '_')
    ver_1 <- unlist(ver_split)
    ver_2 <- ver_1[c(FALSE, TRUE)]
    #Split version number from file type
    ver_3_split <- str_split(ver_2, pattern = '.tar')
    ver_4 <- unlist(ver_3_split)
    ver_5 <- ver_4[c(TRUE, FALSE)]
    return(ver_5)
}

#Test
length(extract_version(read_archive('stringr')))

#extract package name
package_name <- function(x) {
  x_sep <- unlist(str_split(x$Name, pattern = '_'))
  x_name <- x_sep[c(TRUE, FALSE)]
  return(x_name)
}
#Test
package_name(read_archive('stringr'))

#Convert and extract package sizes
convert_size <- function(x) {
  size_chr <- as.character(x$Size)
      size_counts <- rep(0, length(size_chr))
      for (i in seq_along(size_chr)) {
        if (str_sub(size_chr[i], start = -1) == 'K') {
          size_counts[i] <- (as.double(str_replace(size_chr[i], pattern = 'K', replacement = '')))
        }
        
        else if (str_sub(size_chr[i], start = -1) == 'M') {
            size_counts[i] <- 1000*(as.double(str_replace(size_chr[i], pattern = 'M', replacement = '')))
          }
      }
      return(size_counts)
}

#test
convert_size(read_archive('stringr'))

#Write clean_archive
#' @Title: clean_archive
#' @Description: take output of read_archive and return tidy table
#' @Input: data frame from HTML
#' @Output: clean data frame

clean_archive <- function(x) {
  #clean and add version column
  x <- mutate(x, version = extract_version(x))
  #clean the name column to name of package only
  x$Name <- package_name(x)
  #clean the date column
  x$`Last modified` <- clean_date(x)
  #convert size
  x$Size <- convert_size(x)
  #rename last modified
  names(x)[names(x)=='Last modified'] <- 'date'
  #rename names
  names(x)[names(x)=='Name'] <- 'name'
  #rename size
  names(x)[names(x)=='Size'] <- 'size'
  #reorder columns
  x <- x[c('name', 'version', 'date', 'size')]
  return(x)
}

clean_archive(read_archive('stringr'))

raw_data <- read_archive('stringr')
clean_data <- clean_archive(raw_data)

#1.3) Timeline plot
library(ggplot2)

#Write plot_archive
plot_archive <- function(x) {
  return(ggplot(x, aes(date, size)) + geom_step(x, mapping=aes(date, size)))
}

#Test
plot_archive(clean_data)

#1.5) Archives of other packages
#dplyr
raw_data_dplyr <- read_archive('dplyr')

clean_archive(raw_data_dplyr)
clean_data_dplyr <- clean_archive(raw_data_dplyr)

#XML
raw_data_xml <- read_archive('XML')
clean_data_xml <- clean_archive(raw_data_xml)

#ggplot2
raw_data_ggplot2 <- read_archive('ggplot2')
clean_data_ggplot2 <- clean_archive(raw_data_ggplot2)

#knitr
raw_data_knitr <- read_archive('knitr')
clean_data_knitr <- clean_archive(raw_data_knitr)

plot_archive(clean_data_dplyr)
plot_archive(clean_data_knitr)
