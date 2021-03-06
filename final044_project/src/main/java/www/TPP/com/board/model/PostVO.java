package www.TPP.com.board.model;

import java.util.List;
import java.util.stream.Collectors;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.board.service.PptForSaleService;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PostVO extends CommonAttr {
	private String postId;
	private String postName;
	private double rateScore;
	private double rateCount;
	private double sellCount;
	private String advertise;

	private List<PptForSaleVO> pptForSaleList;
	
	public PostVO(String postId) {
		this.postId = postId;
	}
	
}
