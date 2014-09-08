\name{s7b2csv}
\alias{s7b2csv}
\title{Convert sas7bdat files to CSV format with Parso}
\description{
  Convert sas7bdat files to CSV format with Parso library by GGASoftware.
}
\usage{
  s7b2csv(s7bfile, csvfile)
}
\arguments{
  \item{s7bfile}{string; sas7bdat filename}
  \item{csvfile}{string; CSV filename}
}
\details{
  This function uses the \pkg{rJava} package to interface with the GGASoftware Parso library. The Parso library builds on the sas7bdat file format documentation and code provided by the \pkg{sas7bdat} package. The Parso library is licensed according to the GPLv3. A copy of the GPLv3 is provided in the \code{inst/doc} directory. The Parso library depends on the SLF4J library by the software company QOS.ch. The SLF4J library is subject to the terms of the MIT license. A copy of the MIT license is provided in the \code{inst/doc} directory. The function implementation in rather inefficient, since each row of the sas7bdat database is read separately and written to a temporary CSV file. Once all rows are read, the temporary CSV file is read using the \code{read.csv} function. The code could be made more efficient by (1) reading all of the rows at once. This is possible with the Parso library. However, there must be sufficient memory to store the full dataset. Alternatively, (2) a new java class could be written that reads the file sequentially. This should be substantially faster than the R \code{for} loop that currently implements the sequential read.
}
\value{
  Returns \code{csvfile} on success.
}
\author{Matt Shotwell}
\examples{
  #s7b2csv("sdrug.sas7bdat", "sdrug.csv") 
}
