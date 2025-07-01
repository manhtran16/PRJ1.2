/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import model.Brand;
import repository.BrandDAO;

/**
 *
 * @author manht
 */
public class BrandService {
    public boolean addBrand(String brandName) {
        if (brandName == null || brandName.trim().isEmpty()) {
            throw new IllegalArgumentException("Tên thương hiệu không được để trống!");
        }
        BrandDAO brandDao = new BrandDAO();
        if (brandDao.getBrandByName(brandName)) {
            throw new IllegalArgumentException("Thương hiệu này đã tồn tại!");
        }
        return brandDao.createBrand(brandName.trim());
    }

    public boolean editBrand(int brandId, String newBrandName) {
        if (newBrandName == null || newBrandName.trim().isEmpty()) {
            return false;
        }
        BrandDAO brandDao = new BrandDAO();
        if (brandDao.getBrandByName(newBrandName)) {
            Brand current = brandDao.getBrandById(brandId);
            if (current == null || !current.getBrandName().equalsIgnoreCase(newBrandName.trim())) {
                return false;
            }
        }
        try {
            brandDao.updateBrand(brandId, newBrandName.trim());
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
