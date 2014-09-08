read.sas7bdat.parso <- function(file){
   tmp <- tempfile()
   sin <- .jnew("java/io/FileInputStream", file)
   s7b <- .jnew("com/ggasoftware/parso/SasFileReader",
                .jcast(sin, "java/io/InputStream"))

   cst <- "Ljava/util/List;"
   ost <- "[Ljava/lang/Object;"
   pst <- "Lcom/ggasoftware/parso/SasFileProperties;"   

   col <- .jcall(s7b, cst, "getColumns")
   sfp <- .jcall(s7b, pst, "getSasFileProperties")

   rct <- .jcall(sfp, "J", "getRowCount") 
   

   flw <- .jnew("java/io/FileWriter", tmp)
   cdw <- .jnew("com/ggasoftware/parso/CSVDataWriter",
                .jcast(flw, "java/io/Writer"))

   .jcall(cdw, "V", "writeColumnNames", col)
   for(i in 1:rct)
     .jcall(cdw, "V", "writeRow", col,
       .jcall(s7b, ost, "readNext", evalArray=FALSE))

   .jcall(flw, "V", "close")

   read.csv(tmp)
}

