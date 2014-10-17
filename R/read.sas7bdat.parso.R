read.sas7bdat.parso <- function(file, ...)
  read.csv(s7b2csv(file, tempfile()), ...)
