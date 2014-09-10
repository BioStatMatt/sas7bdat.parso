import com.ggasoftware.parso.*;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.lang.Math;

public class s7b2csvclass  {
  public String s7b2csv(String s7bfile, String csvfile) {

    FileInputStream sin = null;
    FileWriter sout = null;
    try {

      sin = new FileInputStream(s7bfile);
      sout = new FileWriter(csvfile);

      // create reader and get file properties
      SasFileReader sfr = new SasFileReader(sin);
      SasFileProperties sfp = sfr.getSasFileProperties();

      // compute data size
      long dsz = sfp.getRowCount() * sfp.getRowLength(); 

      // create CSV data writer
      CSVDataWriter cdw = new CSVDataWriter(sout);  

      // write column headers
      List<Column> col = sfr.getColumns();
      cdw.writeColumnNames(col);
      
      // sequential read/write for data size > 2^28 (0.25GB)
      if(dsz > (long) Math.pow(2,28)) {
        // sequential read/write
        for(long row = 0; row < sfp.getRowCount(); row++)
          cdw.writeRow(col, sfr.readNext()); 
      } else {
        // simultaneous read/write
        cdw.writeRowsArray(col, sfr.readAll());
      }
 
      // close file streams
      sin.close();
      sout.close();

      // return exception text if thrown 
      } catch(IOException e) {
        return(e.getMessage());
      } 

    // return CSV filename on success
    return(csvfile);
  }
} 
