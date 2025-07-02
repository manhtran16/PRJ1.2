/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import repository.TypeDAO;
import model.Type;

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

    public boolean editType(int typeId, String newTypeName) {
        if (newTypeName == null || newTypeName.trim().isEmpty()) {
            return false;
        }
        TypeDAO typeDao = new TypeDAO();
        if (typeDao.getTypeByName(newTypeName)) {
            Type current = typeDao.getTypeByID(typeId);
            if (current == null || !current.getTypeName().equalsIgnoreCase(newTypeName.trim())) {
                return false;
            }
        }
        try {
            typeDao.updateType(typeId, newTypeName.trim());
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
