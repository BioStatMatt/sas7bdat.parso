import com.ggasoftware.parso.*;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class s7b2csvclass  {
  public String s7b2csv(String s7bfile, String csvfile) {

    FileInputStream sin = null;
    FileWriter sout = null;
    try {

      sin = new FileInputStream(s7bfile);
      sout = new FileWriter(csvfile);

      SasFileReader sfr = new SasFileReader(sin);
      SasFileProperties sfp = sfr.getSasFileProperties();
      CSVDataWriter cdw = new CSVDataWriter(sout);  

      // write column headers
      List<Column> col = sfr.getColumns();
      cdw.writeColumnNames(col);

      // write data
      for(long row = 0; row < sfp.getRowCount(); row++)
        cdw.writeRow(col, sfr.readNext()); 
 
      sin.close();
      sout.close();

      } catch(IOException e) {
        return(e.getMessage());
      } 

    return(csvfile);
  }
} 
