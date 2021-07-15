package www.TPP.com.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

/**
 * 게시글
 * 
 * @author Jun_Kim
 */
@Data
@NoArgsConstructor
public class ReplyVO extends CommonAttr {
	public static final String DESCRIM4REPLY = "reply";
	/** DB 함수 get_id 참조 */
	public static final int ID_LENGTH = 5;

	private String replyId;
	private String postInfoId;
	private String userId;
	private String content;

	public ReplyVO(String parentID, String content, String userId) {
		this.content = content;
		this.userId = userId;
	}

	public ReplyVO(String content, String userId) {
		this.content = content;
		this.userId = userId;
	}

}
