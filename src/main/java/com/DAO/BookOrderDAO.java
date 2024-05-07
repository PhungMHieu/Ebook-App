/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author phume
 */
import com.entity.Book_Order;
import java.util.List;

public interface BookOrderDAO {

    public boolean saveOrder (List<Book_Order> b);
    
    public List<Book_Order> getBook(String email);
    
    public List<Book_Order> getAllOrder();
    
}
