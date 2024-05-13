/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author PC
 */
public class ImportedBill {
    private int id;
    private LocalDateTime importedDate;
    private double total_amount;
    private int idSupplier;
    private int idUser;
    private List<ImportedBook> importedBookDtlses;

    public List<ImportedBook> getImportedBookDtlses() {
        return importedBookDtlses;
    }

    public void setImportedBookDtlses(List<ImportedBook> importedBookDtlses) {
        this.importedBookDtlses = importedBookDtlses;
    }

    public ImportedBill() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getImportedDate() {
        return importedDate;
    }

    public void setImportedDate(LocalDateTime importedDate) {
        this.importedDate = importedDate;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }    
}
