/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Customer;
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
    public Connection getConnection()
    {
        Connection conn=null;        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String user="sa";
            String pass="123456";
            String url="jdbc:sqlserver://127.0.0.1:1433;databaseName=WPSJ";
            conn=DriverManager.getConnection(url, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
    public ArrayList<Product> getData()
    {
        ArrayList<Product> list=new ArrayList<Product>();
        String sql="SELECT * FROM tblProduct";
        try {
            ResultSet rs=getConnection().createStatement().executeQuery(sql);
            while(rs.next())
            {
                Product temp=new Product();
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
    
    public ArrayList<Product> getDataByName(String name)
    {
        ArrayList<Product> list=new ArrayList<Product>();
        String sql="SELECT * FROM tblProduct WHERE name like '%"+name+"%'";
        try {
            ResultSet rs=getConnection().createStatement().executeQuery(sql);
            while(rs.next())
            {
                Product temp=new Product();
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
    public ArrayList<Customer> getAllCustomer(String text){
    
    ArrayList<Customer> list=new ArrayList<>();
        String sql="SELECT * FROM tblCustome WHERE name like '%"+text+"%'";
        try {
            ResultSet rs=getConnection().createStatement().executeQuery(sql);
            while(rs.next())
            {
               Customer temp =new Customer();
               temp.setId(rs.getInt("CustomeID"));
               temp.setAddress(rs.getString("address"));
               temp.setEmail(rs.getString("email"));
               temp.setName(rs.getString("name"));
               temp.setPhone(rs.getString("phone"));
               list.add(temp);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    
    
    }
}
