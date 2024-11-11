import java.sql.*;
import java.util.Scanner;

public class JavaApp1 {
    private static final Scanner S = new Scanner(System.in);

    private static Connection c = null;

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url= "jdbc:mysql://localhost:3306/coursework_sys";
            String username = "root";
            String password = "Silvietta123";
            c = DriverManager.getConnection(url, username, password);

     
            String choice = "";

            do {
                System.out.println("-- MAIN MENU --");
                System.out.println("1 - Browse ResultSet");
                System.out.println("2 - Invoke Procedure");
                System.out.println("Q - Quit");
                System.out.print("Pick : ");

                choice = S.next().toUpperCase();

                switch (choice) {
                    case "1" : {
                        browseResultSet();
                        break;
                    }
                    case "2" : {
                        invokeProcedure();
                        break;
                    }
                }
            } while (!choice.equals("Q"));

            c.close();

            System.out.println("Bye Bye :)");
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    

    private static void browseResultSet() throws Exception {
       
        //displaying the student no, name and loans to be returned (ASC order)
        
        String loan_query=  "SELECT student.name, loan.no, loan.due " +
                       "FROM loan " +
                       "INNER JOIN student ON loan.no = student.no " +
                       "WHERE YEAR(loan.due) = YEAR(CURRENT_DATE()) " +
                       "AND loan.return_date IS NULL " +
                       "ORDER BY loan.due ASC";

        Statement s = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

        ResultSet rs = s.executeQuery(loan_query);

      
        
        while (rs.next()){                                   //displaying result set rows
           String name= rs.getString("name");
           int student_no= rs.getInt("no");
           Date due_date= rs.getDate("due");
           System.out.println("Student name:  "+ name);
           System.out.println("Student no:  "+ student_no);
           System.out.println("Due date:   "+ due_date);
       
        }if (!rs.next()){   //no rows, outputting suitable message
                System.out.println("Cannot output result set! No rows available");
                }
         rs.close();
         
        s.close();
    
      }
    private static void invokeProcedure() throws Exception {
        
        //asking user for procedure paramaters
        System.out.println("Input a book isbn:  ");
        String book_isbn= S.next();
        System.out.println("Input a student number:  ");
        int student_no= S.nextInt();
        
     //calling procedure 
     CallableStatement cs = c.prepareCall("{call Issue_New_Loan(?,?)}");
        
    //assigning user paramaters
    cs.setString(1,book_isbn);
    cs.setInt(2,student_no);
        
    cs.execute();
    
    cs.close();
    
    }
 }
            