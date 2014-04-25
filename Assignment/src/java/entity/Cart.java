/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author DucNM
 */
public class Cart {
    private Hashtable<Product,Integer> content;

    public Cart() {
        this.content = new Hashtable<Product,Integer>();
    }
    
    public Hashtable<Product,Integer> getContent() {
        return content;
    }

    public void setContent(Hashtable<Product,Integer> content) {
        this.content = content;
    }
    
    public void addProduct(Product p) {
        if (content == null) {
            content = new Hashtable<Product,Integer>();
            content.put(p, 1);
        } else {
            if (!content.containsKey(p)) {
                content.put(p, 1);
            } else {
                int quantity = Integer.parseInt(content.get(p).toString());
                quantity++;
                content.remove(p);
                content.put(p, quantity);
            }
        }
    }
    
    public void updateCart(List<Product> p, String[] quantity) {
        content.clear();
        for (int i = 0; i < p.size(); i++) {
            content.put(p.get(i), Integer.parseInt(quantity[i]));
        }
    }
    
    public void removeProduct(Product p) {
        if (content.containsKey(p)) {
            content.remove(p);   
        }
    }
}
