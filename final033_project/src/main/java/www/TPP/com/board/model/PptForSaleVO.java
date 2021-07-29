package www.TPP.com.board.model;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.framework.ComparablePair;

@Data
@NoArgsConstructor
public class PptForSaleVO extends CommonAttr{
	public static final int ID_LENGTH = 5;
	
	private String pptForSaleId;	
	private String title;
	private String content;
	private String weight;
	private String postId;
	private String locationId;
	private String categoryId;
	private String userId;
	private String price;
	
	private List<PptForSaleVO> pptForSaleVOList;
	 
	
}
