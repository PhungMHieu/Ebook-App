/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.util.List;
import com.entity.Cart;
/**
 *
 * @author ADMIN
 */
public interface CartDAO {
    public boolean addCart(Cart c);
    public List<Cart> getBookByUser(int userId);
    public boolean deleteBook(int bid, int uid,int cid);
    public boolean deleteCarts(int uid);
}
