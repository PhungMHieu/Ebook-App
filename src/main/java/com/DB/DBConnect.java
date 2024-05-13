/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DB;

/**
 *
 * @author PC
 */
import java.sql.*;
public class DBConnect {
    private static Connection conn;
    public static Connection getConn(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","kakachiz");
            System.out.println(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
//     public static void main(String[] args) {
//         DBConnect dbConnect = new DBConnect();
//         Connection con = dbConnect.getConn();
//         System.out.println(con);
//     }
}
