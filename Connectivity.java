 
package Cons;

import java.sql.*;
/**
 *
 * @author David-Pc
 */
public class Connectivity
{
    public Connection con=null;
    public Connection Connectivity()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12284793","sql12284793","TPHvZPwum3");
            //con=DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12267998","root","root");
            System.out.println("Connection is Ready");
            //PreparedStatement query=con.prepareStatement("Select * from table_name");
        }
        catch (SQLException | ClassNotFoundException ex) 
        {
              System.out.println(ex);
        }
        return con;
    }
}
