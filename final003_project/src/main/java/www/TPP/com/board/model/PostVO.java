package www.TPP.com.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;
import www.TPP.com.party.model.Party;

@Data
@NoArgsConstructor
public class PostVO extends CommonAttr{
	private String postId;
	private String boardId;
	private String postTitle;
	private String sellCount;
	private double rate;
	
	private Party seller;

}
