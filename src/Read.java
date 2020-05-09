import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.ListIterator;
public class Read {

	public static void main(String[] args) {

				ArrayList<String> al=new ArrayList<String>();
				BufferedReader reader;
				try {
					reader = new BufferedReader(new FileReader("C:/Users/Rohan/Desktop/lang.txt"));
					String line =reader.readLine();
					
					while (line != null) {
						
						al.add(line);
						line = reader.readLine();
					}
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			ListIterator<String> ltr=al.listIterator();
			 
			while(ltr.hasNext()) {
				String lang=ltr.next();
				String[] line1=lang.split(" ");
				for(String word:line1) {
					
					System.out.println("<option value='"+word+"'>"+word+"</option>");
				}
				
			}
			
			
			
			
			
			
			
		}
}
