package com.DAO;

import java.util.List;

import com.entity.Supplier;


public interface SupplierDAO {
    public boolean addSupplier(Supplier s);
    public List<Supplier> getAllSuppliers();
    public List<Supplier> searchSupplier(String keyword);
}
