package www.TPP.com.product.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductVO;

public interface ProductMapper {
		
	public List<ProductVO>getProductListByUserId(String userId);

	public int registerProduct(@Param("product") ProductVO product, @Param("post") PostVO post, @Param("location") LocationVO location);

	public List<ProductVO> getProductListByPostId(String postId);

	public boolean deleteProduct(ProductVO product);
	
}
