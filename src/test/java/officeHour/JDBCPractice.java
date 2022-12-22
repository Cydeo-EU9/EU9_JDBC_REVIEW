package officeHour;

import java.sql.*;

public class JDBCPractice {

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@3.87.65.105:1521:XE";
        String userName = "hr";
        String password = "hr";

        Connection conn = DriverManager.getConnection(url, userName, password);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery("select * from employees");

//        System.out.println(rs.toString());
        rs.next();

        System.out.println(rs.getString("FIRST_NAME"));
        System.out.println(rs.getString("LAST_NAME"));
        System.out.println(rs.getString("JOB_ID"));
        System.out.println(rs.getString(5));
        System.out.println(rs.getString(1));

        rs.next();

        System.out.println(rs.getString("FIRST_NAME"));
        System.out.println(rs.getString("LAST_NAME"));
        System.out.println(rs.getString("JOB_ID"));
        System.out.println(rs.getString(5));
        System.out.println(rs.getString(1));

        rs.previous();
        System.out.println("*******************************");
        System.out.println(rs.getString(1));

        rs.absolute(8);
        System.out.println(rs.getString(2));

        rs.beforeFirst();
        System.out.println(rs.getString(1));



        /*
        previous
        first
        last
        beforfirst
        afterlast
        absolute(row number)
         */




    }
}
