/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author PC
 */
import com.DB.DBConnect;
import com.entity.User;
import java.sql.*;

public class UserDAOImpl implements UserDAO{
    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    
    @Override
    public boolean userRegister(User us) {
        boolean f = false;
        try {
            String sql="insert into user(name,email,phno,password,role) values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());
            ps.setString(5, us.getRole());
//            log(us.)
            int i = ps.executeUpdate();
            if(i == 1){
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public static void main(String[] args) {
        UserDAOImpl uDaoImpl = new UserDAOImpl(DBConnect.getConn());
        User x = new User();
        x.setName("Hieu");
        boolean f = uDaoImpl.userRegister(x);
        System.out.println(f);
//        boolean f = 
    }

    @Override
    public User login(User us) {
        try {
            String sql ="select * from user  where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getEmail());
            ps.setString(2, us.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new User();
                us.setName(rs.getString("name"));
                us.setId(rs.getInt("id"));
                us.setEmail(rs.getString("email"));
                us.setPhno(rs.getString("phno"));
                us.setPassword(rs.getString("password"));
                us.setLandmark(rs.getString("landmark"));
                us.setCity(rs.getString("city"));
                us.setState(rs.getString("state"));
                us.setPincode(rs.getString("pincode"));
                us.setRole(rs.getString("role"));
            } 
            else{
                us = null;
            }           
        } catch (Exception e) {
            e.printStackTrace();
            us = null;
        }
        return us;
    }

    @Override
    public boolean checkPassword(int id, String ps) {
        boolean f=false;
        try{
            String sql="select * from user where id=? and password=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, ps);
            
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                f=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateProfile(User us) {
        boolean f = false;
        try {
            String sql="update user set name=?,email=?,phno=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setInt(4, us.getId());
            int i = ps.executeUpdate();
            if(i == 1){
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkUser(String em) {
        boolean f=true;

        try {
            String sql = "select * from user where email=?";
            PreparedStatement ps = conn.prepareStatement(sql); 
            ps.setString(1, em);

            ResultSet rs=ps.executeQuery(); 
            while(rs.next())
            {
                f=false;
            }



        } catch (Exception e) { 
            e.printStackTrace();
        }

        return f;
    }
}
