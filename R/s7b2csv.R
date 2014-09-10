s7b2csv <- function(s7bfile, csvfile) {
  ## Parso library 1.2.1 does not verify that
  ## s7bfile is correctly formatted. As a minimal
  ## safeguard, check for ".sas7bdat" extension
  if(!grepl(".+\\.sas7bdat", s7bfile))
     warning("'s7bfile' does not have 'sas7bdat' extension")
  sps <- .jnew("s7b2csvclass")
  res <- .jcall(sps, "S", "s7b2csv", s7bfile, csvfile)
  if(res != csvfile)
    stop(res)
  return(res)
}
