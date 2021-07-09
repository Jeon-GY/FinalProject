package www.TPP.com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductVO;
import www.TPP.com.product.persistence.ProductMapper;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getProductListByPostId(String postId) {
		return productMapper.getProductListByPostId(postId);
	}
	
	public List<ProductVO> getProductListByUserId(String userId) {
		return getProductListByUserId(userId);
	}
	
	public int registerProduct(ProductVO product, PostVO post, LocationVO location) {
		return productMapper.registerProduct(product, post, location);
	}
}
