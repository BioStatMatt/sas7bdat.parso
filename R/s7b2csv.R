s7b2csv <- function(s7bfile, csvfile) {
  sps <- .jnew("s7b2csvclass")
  res <- .jcall(sps, "S", "s7b2csv", s7bfile, csvfile)
  if(res != csvfile)
    stop(res)
  return(res)
}
