package www.TPP.com.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PostVO extends CommonAttr{
	private String postId;
	private String postName;
	private double rateScore;
	private double rateCount;
	private double sellCount;
	
	public PostVO(String postId) {
		this.postId = postId;
	}
}
