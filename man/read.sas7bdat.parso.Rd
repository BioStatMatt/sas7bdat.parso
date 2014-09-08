\name{read.sas7bdat.parso}
\alias{read.sas7bdat.parso}
\title{Read sas7bdat files with Parso}
\description{
  Read sas7bdat files with the Java Parso library by GGASoftware.
}
\usage{
  read.sas7bdat.parso(file)
}
\arguments{
  \item{file}{string; sas7bdat filename}
}
\details{
  This function uses the \pkg{rJava} package to interface with the GGASoftware Parso library. The Parso library builds on the sas7bdat file format documentation and code provided by the \pkg{sas7bdat} package. The Parso library is licensed according to the GPLv3. A copy of the GPLv3 is provided in the \code{inst/doc} directory. The Parso library depends on the SLF4J library by the software company QOS.ch. The SLF4J library is subject to the terms of the MIT license. A copy of the MIT license is provided in the \code{inst/doc} directory. The function implementation in rather inefficient, since each row of the sas7bdat database is read separately and written to a temporary CSV file. Once all rows are read, the temporary CSV file is read using the \code{read.csv} function. The code could be made more efficient by (1) reading all of the rows at once. This is possible with the Parso library. However, there must be sufficient memory to store the full dataset. Alternatively, (2) a new java class could be written that reads the file sequentially. This should be substantially faster than the R \code{for} loop that currently implements the sequential read.
}
\value{
  A data frame representation of the data stored in the sas7bdat file.
}
\author{Matt Shotwell}
\examples{
  #read.sas7bdat.parso("sdrug.sas7bdat") 
}
