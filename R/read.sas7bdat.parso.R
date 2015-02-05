#' Read a SAS dataset (sas7bdat format)
#' @param file The SAS dataset file that you wish to read in
#' @param READ_FUNC The function to used to read in the intermediate csv file. 
read.sas7bdat.parso <- function(file, ..., READ_FUNC = read.csv)
  READ_FUNC(s7b2csv(file, tempfile()), ...)

#' Read a SAS dataset (sas7bdat format) using data.table's fread
#' @param file The SAS dataset file that you wish to read in
#' @param READ_FUNC The function to used to read in the intermediate csv file. 
#' @import data.table
#' @return data.table object
fread.sas7bdat.parso <- function(file, ...) {
  read.sas7bdat.parso(file,..., READ_FUNC = fread)
}
