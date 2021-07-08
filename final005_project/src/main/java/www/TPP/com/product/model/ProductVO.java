package www.TPP.com.product.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class ProductVO extends CommonAttr{
	private String productId;
	private String productName;
    private String productAmount;
    private double productPrice;
    private double productCount;
    
    private String userId;
}
