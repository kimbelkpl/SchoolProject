package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;

public interface ISupplierService {
public void remove(int supplier_id);
public void edit(Supplier supplierinstance);
public List<Supplier> selectAll();
public List<Supplier> selectAllOn();
public Supplier selectSupplier(int supplier_id);
public void entry(Supplier supplier);
}
