/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import entity.Product;
import java.util.ArrayList;
import model.DataClass;

/**
 *
 * @author vieta_000
 */
public class MyClass {
    public static ArrayList<Product> Search(String name){
        DataClass data = new DataClass();        
        return data.getDataByName(name);
    }
}
