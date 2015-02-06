# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

suppressMessages(install.packages("stats"))
install.packages("stats", quiet = T)

suppressMessages(library(mosaic))
suppressMessages(library(ggplot2))
suppressMessages(library(stats))



fish = fetchGoogle ("https://docs.google.com/spreadsheet/pub?key=0ApAFnYUaVcr3dDFPQ2pWZ2xQTEljTnpFSDdSMkNpZ3c&output=csv")

require(stats)
require(mosaic)
require(ggplot2)

require(stats)

regressionAnalysis <- function(model) {
  #calculates the values
  rsquared <- summary(model)$r.squared
  p.value.intercept <- summary(model)$coefficients[1,4]
  p.value.slope <- summary(model)$coefficients[2,4]
  intercept <- summary(model)$coefficients[1,1]
  slope <- summary(model)$coefficients[2,1]
  
  slopeName <- rownames(summary(model)$coefficients)[2]
  
  dat <- data.frame(terms = c("Intercept", slopeName), coefficients = c(intercept, slope), 
                    p.values = c(p.value.intercept, p.value.slope))
  
  solutionOutput <- list(Model.Values = dat, R.Squared = rsquared)
  solutionOutput
}  

anovaSummary <- function(model) {
  slopeName <- getExplanatory(model)
  p.value <- summary(aov(mod))[[1]][["Pr(>F)"]][1]
  paste("The p-value on the", slopeName, "variable is", p.value)
}

getDataFrame <- function(mod) {
  return(model.frame(mod))
}

getResponse <- function(mod) {
  df <- getDataFrame(mod)
  return(names(df)[1])
}

getExplanatory <- function(mod) {
  df <- getDataFrame(mod)
  return(names(df)[2])
}

inversePredict <- function(mod, responseVal) {
  #the equation
  intercept <- getIntercept(mod)
  slope <- getSlopeVal(mod)
  graph <- outputGraph(mod)
  graph <- graph + geom_hline(yintercept = responseVal, linetype = "dashed", colour = "red")
  explVal <- (responseVal - intercept)/slope
  graph <- graph + geom_vline(xintercept = explVal, linetype = "dashed", colour = "red")
  return(list(inversePrediction = explVal, Graph = graph))  
}

getSlopeVal <- function(mod) {
  return(summary(mod)$coefficients[2,1])
}

getIntercept <- function(mod) {
  return(summary(mod)$coefficients[1,1])
}

outputGraph <- function(mod) {
  df <- getDataFrame(mod)
  ggplot(df, aes(getDataFrame(mod)[,2], getDataFrame(mod)[,1])) + geom_point() + 
    labs(title="", x = getExplanatory(mod), y = getResponse(mod)) + stat_smooth(method = "lm", se = FALSE)
}

getDataFrame <- function(mod) {
  return(model.frame(mod))
}

getResponse <- function(mod) {
  df <- getDataFrame(mod)
  return(names(df)[1])
}

getExplanatory <- function(mod) {
  df <- getDataFrame(mod)
  return(names(df)[2])
}
