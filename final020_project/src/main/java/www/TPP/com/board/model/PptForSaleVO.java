package www.TPP.com.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PptForSaleVO extends CommonAttr{
	private String pptForSaleId;	
	private String title;
	private String content;
	private String weight;
	private String postId;
	private String locationId;
	private String categoryId;
	private String userId;
	private String price;
	
}
