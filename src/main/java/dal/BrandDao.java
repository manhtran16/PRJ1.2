package dal;

import model.Brand;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import java.util.List;

@Transactional
public class BrandDao {

	@PersistenceContext
	private EntityManager em;

	// Pagination: mỗi trang lấy tối đa 100 brand
	public List<Brand> getListBrand(int numPage) {
		int pageSize = 100;
		TypedQuery<Brand> query = em.createQuery("SELECT b FROM Brand b ORDER BY b.brandID", Brand.class);
		query.setFirstResult(numPage * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	// Lấy toàn bộ brand
	public List<Brand> getBrand() {
		TypedQuery<Brand> query = em.createQuery("SELECT b FROM Brand b", Brand.class);
		return query.getResultList();
	}

	// Lấy tên brand theo ID
	public String getBrandById(int brandId) {
		Brand brand = em.find(Brand.class, brandId);
		return brand != null ? brand.getBrandName() : "";
	}

	// Đếm số lượng brand trong database
	public int countBrand() {
		Long count = em.createQuery("SELECT COUNT(b) FROM Brand b", Long.class).getSingleResult();
		return count.intValue();
	}

	// Thêm brand mới
	public void createBrand(String brandName) {
		Brand brand = new Brand();
		brand.setBrandName(brandName);
		em.persist(brand);
	}

	// Xóa brand theo ID
	public void deleteBrand(int id) {
		Brand brand = em.find(Brand.class, id);
		if (brand != null) {
			em.remove(brand);
		}
	}

	// Cập nhật tên brand
	public void updateBrand(int id, String newName) {
		Brand brand = em.find(Brand.class, id);
		if (brand != null) {
			brand.setBrandName(newName);
			em.merge(brand);
		}
	}
}