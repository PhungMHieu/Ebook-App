package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.Supplier;

public class SupplierDAOImpl implements SupplierDAO{
    private Connection conn;

    public SupplierDAOImpl(Connection conn) {
        this.conn = conn;
    }
    @Override
    public boolean addSupplier(Supplier s) {
        boolean f= false;
        try {
            String sql = "insert into suppliers(name,phone,email,address) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getAddress());
            
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
        SupplierDAOImpl sDaoImpl = new SupplierDAOImpl(DBConnect.getConn());
        List<Supplier> suppliers =  sDaoImpl.searchSupplier("ABC");
        for(Supplier s : suppliers){
            System.out.println(s.getName());
        }
    }

    @Override
    public List<Supplier> getAllSuppliers() {
        List<Supplier> list =  new ArrayList<Supplier>();
        Supplier s = null;
        try {
            String sql = "select * from suppliers";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Supplier();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setAddress(rs.getString("address"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public List<Supplier> searchSupplier(String keyword) {
        List<Supplier> list =  new ArrayList<Supplier>();
        Supplier s = null;
        try {
            // Tạo truy vấn SQL để tìm kiếm nhà cung cấp theo tên
            String sql = "SELECT * FROM suppliers WHERE name LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            // Thay thế tham số '?' trong truy vấn SQL bằng keyword tìm kiếm
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Supplier();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setAddress(rs.getString("address"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
