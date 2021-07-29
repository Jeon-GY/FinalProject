package www.TPP.com.product.persistence;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;

public interface PptMapper {

	int registerPpt(@Param("location") LocationVO location, @Param("productCategory")ProductCategoryVO productCategory);

}
