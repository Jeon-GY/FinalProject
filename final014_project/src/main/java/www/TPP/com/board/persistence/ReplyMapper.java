package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.ReplyVO;
import www.TPP.com.common.paging.Criteria;

public interface ReplyMapper {

	/** ------------------댓글 처리 함수 정의 영역----------------------- */

	/* 초기 화면 띄울 때 활용 : 최종적으로는 개인화 서비스에서 초기화면으로 활용 */
	public List<ReplyVO> getReplyListWithPaging(@Param("originalId") String originalId, @Param("idLength") int idLength,
			@Param("cri") Criteria cri);

	public ReplyVO findReplyById(String replyId);

	/** 댓글 등록하기 */
	public int insertReply(@Param("originalId") String originalId, @Param("reply") ReplyVO reply);

	/** 게시글 수정 처리 */
	public int updateReply(ReplyVO reply);

	public int deleteReplyById(String id);

}
