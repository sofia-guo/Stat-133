# ====================================================
# Title: Lab12
# Author: Sofia Guo
# Date: 4/19/18
# Description: work with package rvest to extract html elements
# ====================================================


#Load packages
library(XML)
library(xml2)
library(rvest)
library(magrittr)
library(stringr)
library(rvest)

#Motivation
# Assemble url (so it fits on screen)
basket <- "https://www.basketball-reference.com"
gsw <- "/teams/GSW/2017.html"
gsw_url <- paste0(basket, gsw)

# download HTML file to your working directory
download.file(gsw_url, 'gsw-roster-2017.html')

# Read GSW Roster html table
gsw_roster <- readHTMLTable('gsw-roster-2017.html')
gsw_roster

nba_html <- paste0(basket, "/leagues/NBA_2017.html")

xml_doc <- read_html(nba_html)


xml_text <- xml_doc %>% html_text()

# content of h2 nodes
xml_doc %>%
  html_nodes("h2") %>%
  html_text() 

# content of h1 nodes
xml_doc %>%
  html_nodes("h1") %>%
  html_text() 

# content of strong nodes
xml_doc %>%
  html_nodes("strong") %>%
  html_text() 

# content of button nodes
xml_doc %>%
  html_nodes("button") %>%
  html_text() 

# node with an attribute
xml_doc %>%
  html_nodes("p.listhead") %>%
  html_text()

#extracting the <a> values inside <li>
xml_doc %>%
  html_nodes(xpath = '//ul[@class=""]/li/a') %>%
  html_text()

# extracting first table 
xml_table1 <- xml_doc %>%
  html_nodes("table") %>%
  extract(1)

class(xml_table1)

tbl1 <- html_table(xml_table1)

head(tbl1)

# extracting second table 
xml_table2 <- xml_doc %>%
  html_nodes("table") %>%
  extract(2)

#simultaneous extraction
xml_tables <- xml_doc %>%
  html_nodes("table") %>%
  extract(1:2)

xml_tables %>% 
  html_nodes("a") %>%
  html_text()

# href attributes
hrefs <- xml_tables %>% 
  html_nodes("a") %>%
  html_attr("href")

#create teams vector
teams <- unlist(str_extract_all(hrefs, '[A-Z][A-Z][A-Z]'))
teams

#create character vector files with .csv
files <- rep('', length(teams))
filenames <- rep('x-roster-2017.csv', length(teams))

for (i in 1:length(teams)){
  files[i] <- gsub('x', teams[i], filenames[i])
}

files

# modify with `hrefs[1]`
basket <- "https://www.basketball-reference.com"
gsw <- "/teams/GSW/2017.html"
gsw_url <- paste0(basket, gsw)

bos <- hrefs[1]
team_url <- paste0(basket, bos)

#download team file
download.file(team_url, 'team-roster-2017.html')

# Read team Roster html table
team_roster <- readHTMLTable('team-roster-2017.html')

#store data frame in csv file
write.csv(team_roster, 'BOS-roster-2017.csv')
