package www.TPP.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.board.persistence.PostMapper;
import www.TPP.com.board.persistence.PptForSaleMapper;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.framework.ComparablePair;
import www.TPP.com.framework.Quad;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;

@Service
public class PptForSaleService {
	private final static String REVIEW = "22222"; 
	private final static String QNA = "11111";
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private PptForSaleMapper pptForSaleMapper;
	
//###################################################ppt관련####################################################################
	
	// 게시물에 달린 PptForSale 목록
	public List<PptForSaleVO> getPptForSaleList(String postId) {
		return pptForSaleMapper.getPptForSaleList(postId);
	}

	// 특정 PptForSale
	public PptForSaleVO getPptForSale(String postId) {
		return pptForSaleMapper.getPptForSale(postId);
	}

	// 게시물 등록할 때 같이 등록되는 ppt
	public int registerPptForSale(PptForSaleVO pptForSale, PostVO post, LocationVO location,
			ProductCategoryVO productCategory) {
		return pptForSaleMapper.registerPost(pptForSale, post, location, productCategory);
	}

	// 게시물 수정
	public boolean updatePptForSale(PptForSaleVO pptForSale) {
		return pptForSaleMapper.updatePptForSale(pptForSale) == 1;
	}

	// 게시물 삭제시 달린 ppt 삭제
	public boolean deletePptForSale(PostVO post, PptForSaleVO pptForSale) {
		return pptForSaleMapper.deletePptForSale(post, pptForSale);
	}
	
//###################################################reply관련####################################################################
	
	/** 댓글 초기화면 */
	public Quad<Criteria, Criteria, List<PptForSaleVO>, List<PptForSaleVO>> getReplyListWithPaging(Criteria reviewCri, Criteria qnaCri, String originalId){
		int idLength = originalId.length() + PptForSaleVO.ID_LENGTH; // 댓글 id의 길이
		// Review와 Q&A 아이디 구분
		String reviewId = originalId + REVIEW;
		String qnaId = originalId + QNA;
		
		// Review와 Q&A가 달린 갯수 얻기
		reviewCri.setTotal(pptForSaleMapper.getReplyCount(reviewId, idLength));
		qnaCri.setTotal(pptForSaleMapper.getReplyCount(qnaId, idLength));
		
		// Review와 Q&A 리스트를 Array로 받기
		List<PptForSaleVO> reviewList = pptForSaleMapper.getReplyListWithPaging(reviewId, idLength, reviewCri);
		List<PptForSaleVO> qnaList = pptForSaleMapper.getReplyListWithPaging(qnaId, idLength, qnaCri);
		
		// Review와 Q&A에 달린 대댓글 가져오기
		int reOfReIdLength = idLength + 5; // 대댓글 id의 길이
		reviewList.forEach(review -> review.setPptForSaleVOList(pptForSaleMapper.getReplyList(review.getPptForSaleId(), reOfReIdLength)));
		qnaList.forEach(qna -> qna.setPptForSaleVOList(pptForSaleMapper.getReplyList(qna.getPptForSaleId(), reOfReIdLength)));
		
		// 모든 정보를 모아 전달
		return new Quad<>(reviewCri, qnaCri, reviewList, qnaList);
	}
	
	
	public PptForSaleVO findReplyById(String pptForSaleId) {
		return pptForSaleMapper.findReplyById(pptForSaleId);
	}

	/** 댓글 등록하기*/
	public int insertReply(String originalId, PptForSaleVO pptForSale) {
		return pptForSaleMapper.insertReply(originalId, pptForSale);
	}
	
	/** 댓글 수정 처리*/
	public int updateReply(PptForSaleVO pptForSale) {
		return pptForSaleMapper.updateReply(pptForSale);
	}
	
	/** 게시글 삭제 처리 */
	public int deleteReplyById(String id) {
		return pptForSaleMapper.deleteReplyById(id);
	}

	public List<PptForSaleVO> getReplyList(String pptForSaleId) {
		int idLength = pptForSaleId.length() + PptForSaleVO.ID_LENGTH;
		return pptForSaleMapper.getReplyList(pptForSaleId, idLength);
	}

	public List<PptForSaleVO> getPptForSaleListByUserId(String userId) {
		return pptForSaleMapper.getPptForSaleListByUserId(userId);
	}

	public PptForSaleVO getPptForSaleByPptId(String pptForSaleId) {
		return pptForSaleMapper.getPptForSaleByPptId(pptForSaleId);
	}


}