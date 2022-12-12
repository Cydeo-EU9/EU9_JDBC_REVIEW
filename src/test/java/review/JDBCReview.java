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

//        while (resultSet.next()){
//            System.out.println(resultSet.getString("Job_id"));
//        }
//
//        resultSet.previous();
//        System.out.println(resultSet.getString(1));

//        resultSet.absolute(20);
//        System.out.println(resultSet.getString(1));
//
//        System.out.println(resultSet.getDouble("Salary"));

        // creating result set meta data
        ResultSetMetaData rsmd = resultSet.getMetaData();

        System.out.println(rsmd.getColumnCount());
        for (int i = 1; i < 12; i++) {
            System.out.println(rsmd.getColumnName(i));
        }

        System.out.println("rsmd.getColumnType(1) = " + rsmd.getColumnType(1));

        DatabaseMetaData dbmd = connection.getMetaData();

        System.out.println(dbmd.getUserName());
        System.out.println(dbmd.getDriverName());
        System.out.println(dbmd.getDatabaseProductName());


    }
}
