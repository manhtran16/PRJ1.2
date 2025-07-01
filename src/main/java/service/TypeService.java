/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import repository.TypeDAO;

/**
 *
 * @author manht
 */
public class TypeService {
        public boolean addType(String typeName) {
        if (typeName == null || typeName.trim().isEmpty()) {
            throw new IllegalArgumentException("Tên thương hiệu không được để trống!");
        }
        TypeDAO typeDao = new TypeDAO();
        if (typeDao.getTypeByName(typeName)) {
            throw new IllegalArgumentException("Thương hiệu này đã tồn tại!");
        }
        return typeDao.createType(typeName.trim());
    }
}
