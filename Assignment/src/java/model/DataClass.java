/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Category;
import entity.Customer;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

    public ArrayList<Product> getData(String text, String page) {
        ArrayList<Product> list = new ArrayList<Product>();
        String sql = "SELECT tblProduct.*, tblCategory.name "
                + "FROM tblProduct "
                + "LEFT JOIN tblCategory "
                + "ON tblProduct.categoryID = tblCategory.categoryID "
                + "WHERE tblProduct.name like '%"+text+"%'";
        int index = Integer.valueOf(page);
        int count = 0;
        int pageTotal = 0;
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count++;
                if((count <= index * pSize)&&(count >= ((index - 1)*pSize + 1))){
                Product temp = new Product();
                temp.setId(rs.getInt(1));
                temp.setCategoryID(rs.getInt(2));
                temp.setName(rs.getString(3));
                temp.setPrice(rs.getFloat(4));
                temp.setQuantity(rs.getInt(5));
                temp.setDescription(rs.getString(6));
                temp.setImg(rs.getString(7));
                temp.setCategoryName(rs.getString(8));
                list.add(temp);
                }
            }
            rs.close();
            if(count%pSize == 0){
                pageTotal = count / pSize;
            }else{
                pageTotal = count / pSize +1;
            }
            setTotal(pageTotal);
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Product> getProductById(int id) {
        ArrayList<Product> list = new ArrayList<Product>();
        String sql = "SELECT tblProduct.*, tblCategory.name "
                + "FROM tblProduct "
                + "LEFT JOIN tblCategory "
                + "ON tblProduct.categoryID = tblCategory.categoryID "
                + "WHERE tblProduct.productID =" +id;
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
                temp.setCategoryName(rs.getString(8));
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
    //Viet Anh Code Begin
    public ArrayList<Product> getAllProduct(String name, String page) {
        int index = Integer.valueOf(page);
        int count = 0;
        int pageTotal = 0;
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProduct WHERE name like '%" + name + "%'";
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count++;
                if ((count <= index * pSize) && (count >= ((index - 1) * pSize + 1))) {
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
    
    public ArrayList<Product> getProduct(int id) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProduct WHERE productID = " + id ;
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
                return list;
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
                    temp.setCustomerName(getCustomerByID(temp.getCustomerID()).getName());
                   
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
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;

    }

    private float getSumaryPriceOrder(String id) {
        ArrayList<OrderDetails> arr = getOrderDetails(id);
        float sum = 0;
        for (OrderDetails or : arr) {
            sum = sum + or.getSumPrice();
        }
        return sum;

    }

    private Customer getCustomerByID(int id) {
        Customer cu=new Customer();
        String sql = "SELECT * FROM tblCustome WHERE customeID=" + id;
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                cu.setId(rs.getInt("customeID"));
                cu.setAddress(rs.getString("address"));
                cu.setName(rs.getString("name"));
                cu.setPhone(rs.getString("phone"));
                cu.setEmail(rs.getString("email"));
            }
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return cu;

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
                od.setProductName(getProductNameByOrder(od.getProductID()).toString());
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

    private String getProductNameByOrder(int id) {
        String sql = "SELECT * FROM tblProduct WHERE productID=" + id;
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
    public ArrayList<Order> getOrderByID(String id){
    
       
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM tblOrder WHERE orderID="+id;
        try {
            ResultSet rs = getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
               
               
                    Order temp = new Order();
                    temp.setId(rs.getInt("orderID"));
                    temp.setCustomerID(rs.getInt("customerID"));
                    temp.setCustomerName(getCustomerByID(temp.getCustomerID()).getName());
                     temp.setCustomerAddress(getCustomerByID(temp.getCustomerID()).getAddress());
                    temp.setCustomerPhone(getCustomerByID(temp.getCustomerID()).getPhone());
                    temp.setCustomerEmail(getCustomerByID(temp.getCustomerID()).getEmail());
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
                    return list;
                
            }
            rs.close();
           
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    
    
    
    }
    public void changeStatusOrder(String id,String st){
         String sql = "UPDATE tblOrder set status="+st+" WHERE orderID="+id;
        try {
            int rs = getConnection().createStatement().executeUpdate(sql);
            
           

        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class
                    .getName()).log(Level.SEVERE, null, ex);

        }
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
    //Khoa NN
    public ArrayList<Category> getCategory()
    {
        ArrayList<Category> list=new ArrayList<Category>();
        String sql = "SELECT * FROM tblCategory";
        try {
            ResultSet rs=getConnection().createStatement().executeQuery(sql);
            while(rs.next())
            {
                Category temp=new Category();
                temp.setCategoryID(rs.getInt(1));
                temp.setCategoryName(rs.getString(2));
                list.add(temp);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public boolean addProduct(int categoryID, String productName, float price, int quantity, String description, String image)
    {
        
        boolean result = false;
        String sql = "INSERT INTO tblProduct(categoryID,name,price,quantity,description,image) "
                + "VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, categoryID);
            ps.setString(2, productName);
            ps.setFloat(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, description);
            ps.setString(6, image);
            //int i = ps.executeUpdate();
            if (ps.executeUpdate() > 0) {
                result = true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean updateProduct(int pId, int categoryID, String productName, float price, int quantity, String description, String image)
    {
        
        boolean result = false;
        String sql = "UPDATE tblProduct "
                + "SET categoryID=?,name=?,price=?,quantity=?,description=?,image=? "
                + "WHERE productID=?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, categoryID);
            ps.setString(2, productName);
            ps.setFloat(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, description);
            ps.setString(6, image);
            ps.setInt(7, pId);
            //int i = ps.executeUpdate();
            if (ps.executeUpdate() > 0) {
                result = true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean deleteProduct(int pId)
    {
        
        boolean result = false;
        String sql = "DELETE FROM tblProduct "
                + "WHERE productID="+pId;
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            if (ps.executeUpdate() > 0) {
                result = true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
