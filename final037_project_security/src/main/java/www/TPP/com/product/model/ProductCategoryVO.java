package www.TPP.com.product.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class ProductCategoryVO extends CommonAttr{
	private String productCategoryId;
	private String productCategoryName;
}
