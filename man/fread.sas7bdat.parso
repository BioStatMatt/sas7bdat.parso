\name{fread.sas7bdat.parso}
\alias{fread.sas7bdat.parso}
\title{Read sas7bdat files with Parso using the fread function from the data.table package}
\description{
  Read sas7bdat files with the Java Parso library by GGASoftware. The return results of this file will be consistent with that of the fread function from data.table package
}
\usage{
  fread.sas7bdat.parso(file, ...)
}
\arguments{
  \item{file}{string; sas7bdat filename}
  \item{...}{other arguments passed to \code{fread}}
}
\details{
  This function uses the \pkg{rJava} package to interface with the GGASoftware Parso library. The Parso library builds on the sas7bdat file format documentation and code provided by the \pkg{sas7bdat} package. The Parso library is licensed according to the GPLv3. A copy of the GPLv3 is provided in the \code{inst/doc} directory. The Parso library depends on the SLF4J library by the software company QOS.ch. The SLF4J library is subject to the terms of the MIT license. A copy of the MIT license is provided in the \code{inst/doc} directory. The function implementation in rather inefficient, since each row of the sas7bdat database is read separately and written to a temporary CSV file. Once all rows are read, the temporary CSV file is read using the \code{fread} function. The code could be made more efficient by reading all of the rows at once. This is possible with the Parso library. However, there must be sufficient memory to store the full dataset. 
}
\value{
  A data.table representation of the data stored in the sas7bdat file.
}
\author{Dai Zhuo Jia}
\examples{
  #fread.sas7bdat.parso("sdrug.sas7bdat") 

  ## The code below illustrates the mechanism to
  ## read/write sas7bdat files sequentially in R
  ## where 's7bfile' and 'csvfile' are the input
  ## and output filenames
  
  #   sin <- .jnew("java/io/FileInputStream", s7bfile)
  #   s7b <- .jnew("com/ggasoftware/parso/SasFileReader",
  #                .jcast(sin, "java/io/InputStream"))
  #
  #   cst <- "Ljava/util/List;"
  #   ost <- "[Ljava/lang/Object;"
  #   pst <- "Lcom/ggasoftware/parso/SasFileProperties;"   
  #
  #   col <- .jcall(s7b, cst, "getColumns")
  #   sfp <- .jcall(s7b, pst, "getSasFileProperties")
  #
  #   rct <- .jcall(sfp, "J", "getRowCount") 
  #   
  #
  #   flw <- .jnew("java/io/FileWriter", csvfile)
  #   cdw <- .jnew("com/ggasoftware/parso/CSVDataWriter",
  #                .jcast(flw, "java/io/Writer"))
  #
  #   .jcall(cdw, "V", "writeColumnNames", col)
  #   for(i in 1:rct)
  #     .jcall(cdw, "V", "writeRow", col,
  #       .jcall(s7b, ost, "readNext", evalArray=FALSE))
  #
  #   .jcall(flw, "V", "close")
}
