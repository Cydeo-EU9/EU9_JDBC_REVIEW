package week3;

import org.junit.*;

import java.lang.annotation.*;
import java.sql.*;

public class Practice {

    public static void main(String[] args) throws SQLException {

        String dbUrl = "jdbc:oracle:thin:@54.167.52.69:1521:XE";
        String username = "hr";
        String password = "hr";

        Connection connection = DriverManager.getConnection(dbUrl,username,password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * from locations");

        resultSet.next();



        while (resultSet.next()){
            String address = resultSet.getString(2);
            String postalCode = resultSet.getString(3);
            String city = resultSet.getString(4);
            String state = resultSet.getString(5);

            System.out.println("Full address is: " + address + " " + postalCode + " " + city + " " + state);
        }


    }


    // show which country belongs to which region
    // uk is in Europe
    @Test
    public void test1() throws SQLException {
        String dbUrl = "jdbc:oracle:thin:@54.167.52.69:1521:XE";
        String username = "hr";
        String password = "hr";

        String query = "select COUNTRY_NAME, REGION_NAME from COUNTRIES\n" +
                "full outer join REGIONS\n" +
                "on COUNTRIES.REGION_ID=REGIONS.REGION_ID";

        Connection connection = DriverManager.getConnection(dbUrl,username,password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);


        while (resultSet.next()){
            String name = resultSet.getString(1);
            String region = resultSet.getString(2);
            System.out.println(name + " is in " + region);
        }
    }

}
