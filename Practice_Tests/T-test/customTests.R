# Put custom tests in this file.
uses_arg <- function(arg){
  # Get e, an environment holding swirl's state, from the calling function.
  e <- get("e", parent.frame())
  # The expression which the user has entered is e$expr. It's a call or an expression.
  # Deparse it to a character string. 
  expr <- deparse(e$expr)
  # Form an appropriate regular expression 
  rexp <- paste0(arg,"[[:blank:]*]=")
  # Grep for it:
  return(isTRUE(as.logical(grep(rexp, expr))))
}