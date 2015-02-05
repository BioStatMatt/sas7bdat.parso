#' Read a SAS dataset (sas7bdat format)
#' @param
read.sas7bdat.parso <- function(file, ..., READ_FUNC = read.csv)
  READ_FUNC(s7b2csv(file, tempfile()), ...)

#
fread
