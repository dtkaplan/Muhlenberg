# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
suppressMessages(library(ggplot2))
suppressMessages(library(mosaic))
mussel= read.csv("http://www.macalester.edu/~ajohns24/data/mussels.csv")
colnames(mussel)[13] <- "AvgOxygen"