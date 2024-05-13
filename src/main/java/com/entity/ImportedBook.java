package com.entity;

public class ImportedBook {
    private int id;
    private int importedQuantity;
    private int idBookDtls;
    private int idImportedBill;

    public ImportedBook() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getImportedQuantity() {
        return importedQuantity;
    }

    public void setImportedQuantity(int importedQuantity) {
        this.importedQuantity = importedQuantity;
    }

    public int getIdBookDtls() {
        return idBookDtls;
    }

    public void setIdBookDtls(int idBookDtls) {
        this.idBookDtls = idBookDtls;
    }

    public int getIdImportedBill() {
        return idImportedBill;
    }

    public void setIdImportedBill(int idImportedBill) {
        this.idImportedBill = idImportedBill;
    }
}
