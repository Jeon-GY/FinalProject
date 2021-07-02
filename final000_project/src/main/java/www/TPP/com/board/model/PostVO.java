package www.TPP.com.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PostVO extends CommonAttr{
	private String postId;	
	private String boardId;
	private String sellerId;
	private String postTitle;
	private String sellCount;
	private double rate;

}
