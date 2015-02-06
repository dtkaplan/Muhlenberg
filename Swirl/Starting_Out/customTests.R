# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.# Checks if a user's deparsed expression contains the given parameter, arg, followed by
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
aes_arg <- function(arg){
  e <- get("e", parent.frame())
  expr <- deparse(e$expr)
  #rexpr <- paste0("aes\\([[:blank:]]*(,)?[[:blank:]]*(x[[:blank:]]*=[[:blank:]]*)?(y[[:blank:]]*=[[:blank:]]*)?", arg)
  #rexpr <- paste0(rexpr,"[[:blank:]]*(,)?.*\\)")
  rexpr <- paste0("aes\\(.*?(?<!fill = )", arg, ".*?\\)")
  return(isTRUE(as.logical(grep(rexpr, expr, perl=TRUE))))
}

