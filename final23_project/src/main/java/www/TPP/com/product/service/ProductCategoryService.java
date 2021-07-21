package www.TPP.com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.product.model.ProductCategoryVO;
import www.TPP.com.product.persistence.ProductCategoryMapper;

@Service
public class ProductCategoryService {
	@Autowired
	private ProductCategoryMapper productCategoryMapper;
	
	public List<ProductCategoryVO> getProductCategoryList() {
		return productCategoryMapper.getProductCategoryList();
	}
	
	public List<ProductCategoryVO> getProductCategoryListByCategoryId(String categoryId) {
		return productCategoryMapper.getProductCategoryListByCategoryId(categoryId);
	}
}
