# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
suppressMessages(library(RCurl))
gasurl <- getURL("https://docs.google.com/spreadsheet/pub?key=0AnFamthOzwySdEotQWVNREZQeFVXZEItS2JtYVQzTmc&output=csv")
gasdata <- read.csv(text = gasurl)
gasdata <- subset(gasdata[-c(13:24),])