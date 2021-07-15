package www.TPP.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.ReplyVO;
import www.TPP.com.board.persistence.ReplyMapper;
import www.TPP.com.common.paging.Criteria;

@Service
public class ReplyService {
	@Autowired
	private ReplyMapper replyMapper;
	
	/**---------------------댓글 서비스 관리-------------------------*/
	//LRCUD
	
	/** 댓글 초기화면 */
	public List<ReplyVO> getReplyListWithPaging(String originalId, Criteria cri){
		int idLength = originalId.length() + ReplyVO.ID_LENGTH;
		return replyMapper.getReplyListWithPaging(originalId, idLength, cri);
	}
	
	public ReplyVO findReplyById(String replyId) {
		return replyMapper.findReplyById(replyId);
	}

	/** 댓글 등록하기*/
	public int insertReply(String originalId, ReplyVO reply) {
		return replyMapper.insertReply(originalId, reply);
	}
	
	/** 댓글 수정 처리*/
	public int updateReply(ReplyVO reply) {
		return replyMapper.updateReply(reply);
	}
	
	/** 게시글 삭제 처리 */
	public int deleteReplyById(String id) {
		return replyMapper.deleteReplyById(id);
	}



	

}
