read.sas7bdat.parso <- function(s7bfile)
  read.csv(s7b2csv(s7bfile, tempfile()))
