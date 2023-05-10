package org.example;

import java.sql.*;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","pass@word1");

            Statement s = c.createStatement();

            ResultSet res= s.executeQuery("select * from restaurants r join menus m on r.menu_id = m.menu_id join items i on m.item_id= i.item_id ");
            //ResultSet res = s.executeQuery("select * from restaurants");
            while (res.next()){
                System.out.println(res.getString(2) +" "+ res.getString(3)+" "+res.getInt(4));
            }

           ResultSet orderData =  s.executeQuery("select * from orders where customer_id=1");
            while(orderData.next()){
                System.out.println(orderData.getInt(1) + " "+ orderData.getDate(2));
            }
        ResultSet nearbyRest = s.executeQuery(" select * from restaurants r join customers c on c.location = r.location ");
            while(nearbyRest.next()){
                System.out.println(nearbyRest.getString(2)+" "+nearbyRest.getString(3)+" "+nearbyRest.getInt(4));
            }



        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
