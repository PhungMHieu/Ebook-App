package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.ImportedBill;
import com.entity.ImportedBook;

public class ImportedBillDAOImpl implements ImportedBillDAO{
    private Connection conn;

    public ImportedBillDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    
    @Override
    public boolean saveImportedBill(ImportedBill importedBill){
        boolean check = false;
        try {
            String query = "INSERT INTO imported_bills (importedDate, totalAmount, idSupplier, idUser) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, importedBill.getImportedDate());
            ps.setDouble(2, importedBill.getTotal_amount());
            ps.setInt(3, importedBill.getIdSupplier());
            ps.setInt(4, importedBill.getIdUser());
            int i = ps.executeUpdate();
            if (i == 1) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int id = generatedKeys.getInt(1); // Lấy ID của hóa đơn vừa thêm vào
                    check = true;
                    importedBill.setId(id); // Cập nhật ID của hóa đơn trong đối tượng importedBill
                } else {
                    throw new SQLException("Creating imported bill failed, no ID obtained.");
                }
            } else {
                throw new SQLException("Creating imported bill failed, no rows affected.");
            }

            for (ImportedBook b : importedBill.getImportedBookDtlses()) {
                b.setIdImportedBill(importedBill.getId()); // Sử dụng ID của hóa đơn vừa thêm vào
                ImportedBookDAOImpl dao = new ImportedBookDAOImpl(conn);
                if (!dao.saveImporteBook(b)) {
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static void main(String[] args) {
        ImportedBill importedBill = new ImportedBill();
        ImportedBook b = new ImportedBook();
        b.setIdBookDtls(1);
        b.setImportedQuantity(2);
        List<ImportedBook> imported_books = new ArrayList<>();
        imported_books.add(b);
        importedBill.setIdSupplier(1);
        importedBill.setIdUser(3);
        importedBill.setImportedDate(LocalDateTime.now());
        importedBill.setTotal_amount(100000);
        importedBill.setImportedBookDtlses(imported_books);
        ImportedBillDAOImpl dao = new ImportedBillDAOImpl(DBConnect.getConn());
        System.out.println(dao.saveImportedBill(importedBill));
    }
}


