/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.User;
import java.util.List;

/**
 *
 * @author PC
 */
public interface UserDAO {
    public boolean addUsers(User u);
    public boolean userRegister(User us);
    
    public User login(User us);
    
    public boolean checkPassword(int id, String ps);
    
    public boolean updateProfile(User us);
    
    public boolean checkUser (String em);
    public List<User> getAllUsers();
    public User getUserById(int id);
    public boolean deleteUsers(int id);
}
