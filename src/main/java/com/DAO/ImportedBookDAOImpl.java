package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.entity.ImportedBook;

public class ImportedBookDAOImpl implements ImportedBookDAO{
    private Connection conn;

    public ImportedBookDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    
    @Override
    public boolean saveImporteBook(ImportedBook b){
        boolean check = false;
        try {
            String query = "INSERT INTO imported_books (importedQuantity, idBookDtls, idImportedBill) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, b.getImportedQuantity());
            ps.setInt(2, b.getIdBookDtls());
            ps.setInt(3, b.getIdImportedBill());
            int i = ps.executeUpdate();
            if(i == 1){
                check = true;
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return check;
    }
}
