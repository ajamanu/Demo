# This is a awesome function
# It takes a number and gives you 
# the corresponding letter in the
# alphabet.
# 2016-02-27
# YOUR name 

# RBA Text Analytics.R
# Text Analytics of the RBA's Monetary policy Decision
# Created by Aja Manu 05/08/16

# clear environment
rm(list=ls())

# Set work directory
setwd("C:/Users/amanu.CPE/Documents/R/Text Analytics")

# Load Packages
require(tm)
require(NLP)
require(openNLP)
library(SnowballC) # for Text mining
library(wordcloud)
library(RColorBrewer)

# Load data
data <- Corpus(DirSource("C:/Users/amanu.CPE/Documents/R/Text Analytics/Data"))

# Pre-process data
corpus <- tm_map(data, content_transformer(tolower))
corpus[[1]]$content # view email text
corpus <- tm_map(corpus, PlainTextDocument) # convert to plain text doc
corpus <- tm_map(corpus, removePunctuation) # remove punctuation
corpus <- tm_map(corpus, removeWords, stopwords("english")) # remove english stop words
corpus <- tm_map(corpus, stemDocument) # stem words

# Create document term matrix
dtm <- DocumentTermMatrix(corpus) # create document term matrix
dtm # Summary stats on dtm