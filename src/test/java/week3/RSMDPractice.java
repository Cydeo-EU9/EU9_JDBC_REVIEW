package week3;

import java.sql.*;

public class RSMDPractice {

    public static void main(String[] args) throws SQLException {
        String dbUrl = "jdbc:oracle:thin:@54.167.52.69:1521:XE";
        String username = "hr";
        String password = "hr";

        Connection connection = DriverManager.getConnection(dbUrl,username,password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * from Regions");

        ResultSetMetaData rsmd = resultSet.getMetaData();

        System.out.println(rsmd.getColumnName(2));
        System.out.println(rsmd.getColumnCount());
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            System.out.println(rsmd.getColumnName(i));
        }
    }

    // practice
    // // print full address ( address + postal code + city + state)

}
