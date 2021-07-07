package www.TPP.com.product.persistence;

import java.util.List;

import www.TPP.com.product.model.ProductVO;

public interface ProductMapper {
	
	public ProductVO getProductByPostId(String postId);
	
	public List<ProductVO>getProductListByUserId(String userId);
	
}
