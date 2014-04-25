/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

/**
 *
 * @author vieta_000
 */
public class Product {
    private int id;
    private int categoryID;
    private String name;
    private float price;
    private int quantity;
    private String description;
    private String img;
    private String categoryName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Product(int id, int categoryID, String name, float price, int quantity, String description, String img, String categoryName) {
        this.id = id;
        this.categoryID = categoryID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.img = img;
        this.categoryName = categoryName;
    }
    
    public Product(int id, String name, float price, int quantity, String img) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Product(int id, String name, float price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    @Override
    public boolean equals(Object o) {
        if (o instanceof Product) {
            if (((Product)o).getId() == getId()) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }
}