package www.TPP.com.product.persistence;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.product.model.ProductVO;

public interface ProductMapper {
	
	public ProductVO getProductByPostId(String postId);
	
	public List<ProductVO>getProductListByUserId(String userId);

	public ProductVO registerProduct(@RequestParam("product") ProductVO product, @RequestParam("post") PostVO post);
	
}
