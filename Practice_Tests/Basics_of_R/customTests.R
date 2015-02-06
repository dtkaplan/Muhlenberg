# Put custom tests in this file.
# Checks if a user's deparsed expression contains the given parameter, arg, followed by
# any number of blanks and an equal sign. To be used in conjunction with swirl's expr_uses_func
# to test whether a given function is called with a given keyword.
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