package week3;

import java.sql.*;

public class ConnectionTest {

    public static void main(String[] args) throws SQLException {

        String dbUrl = "jdbc:oracle:thin:@54.167.52.69:1521:XE";
        String username = "hr";
        String password = "hr";

        Connection connection = DriverManager.getConnection(dbUrl,username,password);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet resultSet = statement.executeQuery("SELECT * from Employees");

        resultSet.next(); // this line will move my pointer to next line, which is 1st line of my table

        System.out.println(resultSet.getString("first_name"));
        System.out.println(resultSet.getString("last_name"));
        System.out.println(resultSet.getString(4));
        System.out.println(resultSet.getString(8));

        resultSet.next();  // now my pointer is on the second line

        System.out.println(resultSet.getString(5));

        System.out.println("Full name is: " + resultSet.getString(2) + " "  + resultSet.getString(3));

//        for (int i = 0; i < 105; i++) {
//            System.out.println(resultSet.getString(2));
//            resultSet.next();
//        }
        System.out.println("***************************");
        resultSet.first();
        resultSet.beforeFirst();
        resultSet.absolute(6);
        System.out.println(resultSet.getString(2));
        System.out.println("********************");

        while (resultSet.next()){ // result set continue from 3rd line, because we have 2 resultset.next before
            System.out.println(resultSet.getString(2));
        }


    }
}
