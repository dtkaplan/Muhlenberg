foo <- getURL("https://dl.dropboxusercontent.com/u/5098197/MuhlenbergWorkshop/example1.Rmd")

# Temporary file
fname <- tempfile(pattern = "Muhlenberg-", tmpdir = tempdir(), fileext = ".Rmd")
cat(foo,file=fname)
