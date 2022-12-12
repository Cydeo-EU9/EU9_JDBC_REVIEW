package review;

import utilities.*;

import java.sql.*;

public class JDBCReview {

    public static void main(String[] args) throws SQLException {

        String db_url = "jdbc:oracle:thin:@3.87.65.105:1521:XE";
        String db_username = "hr";
        String db_password = "hr";

        Connection connection = DriverManager.getConnection(db_url, db_username, db_password);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet resultSet = statement.executeQuery("select * from EMPLOYEES");

        /*
        when you want to get data from one row, your cursur should be on that row
         */

        resultSet.next();
        System.out.println(resultSet.getString(1));
        System.out.println(resultSet.getString(5));
        System.out.println(resultSet.getString(7));
        System.out.println(resultSet.getString("email"));



        resultSet.next();
        String firstName = resultSet.getString(2);
        String lastName = resultSet.getString(3);


        System.out.println("fullName = " + firstName + " " +  lastName);

        while (resultSet.next()){
            System.out.println(resultSet.getString("Job_id"));
        }


    }
}
