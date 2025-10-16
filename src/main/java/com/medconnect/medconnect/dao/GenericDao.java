package com.medconnect.medconnect.dao;

import javax.swing.plaf.metal.MetalBorders;
import java.util.List;

public interface GenericDao<T> {

    void save(T entity);

    void update(T entity);

    void delete(T entity);

    T findById(int id);

    List<T> findAll();
}
