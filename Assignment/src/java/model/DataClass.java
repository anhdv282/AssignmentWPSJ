/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

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
    
    public Product getByID(int id)
    {
        Product temp=null;
        String sql="SELECT * FROM tblProduct WHERE id="+id;
        try {
            ResultSet rs=getConnection().createStatement().executeQuery(sql);
            while(rs.next())
            {
                temp=new Product();
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
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }

}
