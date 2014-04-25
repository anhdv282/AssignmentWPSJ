/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customer;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vieta_000
 */
public class DataClass {

    private int pSize = 6;
    private int total;

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String user = "sa";
            String pass = "123456";
            String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=WPSJ";
            conn = DriverManager.getConnection(url, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }

    public ArrayList<Product> getData() {
        ArrayList<Product> list = new ArrayList<Product>();
        String sql = "SELECT * FROM tblProduct";
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                Product temp = new Product();
                temp.setId(rs.getInt(1));
                temp.setCategoryID(rs.getInt(2));
                temp.setName(rs.getString(3));
                temp.setPrice(rs.getFloat(4));
                temp.setQuantity(rs.getInt(5));
                temp.setDescription(rs.getString(6));
                temp.setImg(rs.getString(7));
                list.add(temp);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getDataByName(String name) {
        ArrayList<Product> list = new ArrayList<Product>();
        String sql = "SELECT * FROM tblProduct WHERE name like '%" + name + "%'";
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                Product temp = new Product();
                temp.setId(rs.getInt(1));
                temp.setCategoryID(rs.getInt(2));
                temp.setName(rs.getString(3));
                temp.setPrice(rs.getFloat(4));
                temp.setQuantity(rs.getInt(5));
                temp.setDescription(rs.getString(6));
                temp.setImg(rs.getString(7));
                list.add(temp);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //Begin Thanh Dat code
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public ArrayList<Integer> getTotalPageCustomer() {
        ArrayList<Integer> arr = new ArrayList<>();
        for (int i = 1; i <= total; i++) {
            arr.add(i);

        }
        return arr;

    }

    public ArrayList<Customer> getAllCustomer(String text, String page) {
        int index = Integer.valueOf(page);
        int count = 0;
        int pageTotal = 0;
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM tblCustome WHERE name like '%" + text + "%'";
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count++;
                if ((count <= index * pSize) && (count >= ((index - 1) * pSize + 1))) {
                    Customer temp = new Customer();
                    temp.setId(rs.getInt("CustomeID"));
                    temp.setAddress(rs.getString("address"));
                    temp.setEmail(rs.getString("email"));
                    temp.setName(rs.getString("name"));
                    temp.setPhone(rs.getString("phone"));
                    list.add(temp);
                }
            }
            rs.close();
            if (count % pSize == 0) {
                pageTotal = count / pSize;
            } else {
                pageTotal = count / pSize + 1;
            }
            setTotal(pageTotal);
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Order> getAllOrder(String page) {
        int index = Integer.valueOf(page);
        int count = 0;
        int pageTotal = 0;
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM tblOrder";
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count++;
                if ((count <= index * pSize) && (count >= ((index - 1) * pSize + 1))) {
                    Order temp = new Order();
                    temp.setId(rs.getInt("orderID"));
                    temp.setCustomerID(rs.getInt("customerID"));
                    temp.setCustomerName(getCustomerName(temp.getCustomerID()));
                    temp.setPrice(getSumaryPriceOrder(String.valueOf(temp.getId())));

                    temp.setDate(rs.getObject("date").toString());
                    int st = rs.getInt("status");
                    if (st == 0) {
                        temp.setStatus("In process");
                    } else {
                        if (st == 1) {
                            temp.setStatus("Completed");

                        } else {
                            if (st == 2) {

                                temp.setStatus("Cancel");
                            }

                        }

                    }

                
                list.add(temp);
            }
        }
        rs.close();
        if (count % pSize == 0) {
            pageTotal = count / pSize;
        } else {
            pageTotal = count / pSize + 1;
        }
        setTotal(pageTotal);
    }
    catch (SQLException ex

    
        ) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    return list ;

}

private float getSumaryPriceOrder(String id) {
        ArrayList<OrderDetails> arr = getOrderDetails(id);
        float sum = 0;
        for (OrderDetails or : arr) {
            sum = sum + or.getSumPrice();
        }
        return sum;

    }
    private String getCustomerName(int id){
    String sql = "SELECT name FROM tblCustome WHERE customeID=" + id;
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
               return rs.getString("name");
            }
            rs.close();
        

} catch (SQLException ex) {
            Logger.getLogger(DataClass.class  

.getName()).log(Level.SEVERE, null, ex);
        }
    return "";
    
    }

    public ArrayList<OrderDetails> getOrderDetails(String id) {
        ArrayList<OrderDetails> arr = new ArrayList<>();
        String sql = "SELECT * FROM tblOrderDetail WHERE orderID=" + id;
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                od.setOrderID(rs.getInt("orderID"));
                od.setProductID(rs.getInt("productID"));
                od.setPrice(Float.valueOf(rs.getObject("price").toString()));
                od.setQuantity(rs.getInt("quantity"));
                od.setSumPrice(od.getPrice() * od.getQuantity());
                arr.add(od);

            

}
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class  

.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    //End Thanh Dat code
    public Product getByID(int id)//Vui lòng đặt tên như là getProductByID cho tường minh ạ :))
    {
        Product temp = null;
        String sql = "SELECT * FROM tblProduct WHERE productID=" + id;
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                temp = new Product();
                temp.setId(rs.getInt(1));
                temp.setCategoryID(rs.getInt(2));
                temp.setName(rs.getString(3));
                temp.setPrice(rs.getFloat(4));
                temp.setQuantity(rs.getInt(5));
                temp.setDescription(rs.getString(6));
                temp.setImg(rs.getString(7));
            }
            rs.close();
        

} catch (SQLException ex) {
            Logger.getLogger(DataClass.class  

.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
}
