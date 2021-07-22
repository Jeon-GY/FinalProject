package www.TPP.com.product.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;

public interface ProductCategoryMapper {
	public List<ProductCategoryVO> getProductCategoryList();
	
	public List<ProductCategoryVO> getProductCategoryListByCategoryId(String categoryId);
	
}
