# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.



suppressMessages(library(mosaic))
suppressMessages(library(ggplot2))
install.packages("faraway", quiet = T)
suppressMessages(library(faraway))

data(ozone)

colnames(ozone)[1] <- "OzoneConc"

require(stats)

regressionAnalysis <- function(mod, graph = FALSE) {
  
  s <- summary(mod)
  rsquared <- round(s$r.squared, digits=3)
  df <- getDataFrame(mod)
  
  variables <- c()
  coefs <- c()
  p.vals <- c()
  numLoops <- ncol(df) #counts the response, but not the intercept, so it works
  
  for(i in 1:numLoops) {
    variables <- c(variables, rownames(s$coefficients)[i])
    coefs <- c(coefs, round(s$coefficients[i,1], digits=3))
    p.vals <- c(p.vals, round(s$coefficients[i,4], digits=4))
  }
  
  dat <- data.frame(terms = variables, coefficients = coefs, p.values = p.vals)
  
  if(graph == TRUE) {
    residGraph <- residGraph(mod)
    residGraph <- residGraph + geom_hline(yintercept = 0, type = "shortdash", color = "red")
    solutionOutput <- list(Model.Values = dat, R.Squared = rsquared, Residuals.Graph = residGraph)
    return(solutionOutput)
  }
  
  else {
    if(ncol(df) >2) {return(list(Model.Values = dat, R.Squared = rsquared))}
    else {
      eqn <- paste("The equation of the standard curve is:", 
                   names(df)[1], "=", coefs[1], "+", coefs[2], "*", names(df)[2]) 
      solutionOutput <- list(Model.Values = dat, R.Squared = rsquared, Equation = eqn)
      return(solutionOutput)
    }
  }
}  

getDataFrame <- function(mod) {
  return(model.frame(mod))
}

residGraph <- function(mod) {
  df <- getDataFrame(mod)
  r <- residuals(mod)
  f <- fitted(mod)
  ggplot(df, aes(x=f,y=r)) + geom_point() + labs(title="Residuals Vs. Fitted Values", x = "Fitted Values", y = "Residuals")
}

getResponse <- function(mod) {
  df <- getDataFrame(mod)
  return(names(df)[1])
}

getExplanatory <- function(mod) {
  df <- getDataFrame(mod)
  return(names(df)[2])
}



require(mosaic)
require(ggplot2)
require(stats)

inverseFunction <- function(mod, responseVal) {
  #the equation
  intercept <- getIntercept(mod)
  slope <- getSlopeVal(mod)
  graph <- outputGraph(mod)
  return(list(inversePrediction = (responseVal - intercept)/slope, Graph = graph))  
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
