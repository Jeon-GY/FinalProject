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
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;

@Service
public class PptForSaleService {
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
	public ComparablePair<Criteria, List<PptForSaleVO>> getReplyListWithPaging(String originalId, Criteria cri){
		int idLength = originalId.length() + PptForSaleVO.ID_LENGTH;
		cri.setTotal(pptForSaleMapper.getReplyCount(originalId, idLength));
		ComparablePair<Criteria, List<PptForSaleVO>> ret = new ComparablePair<>(cri, pptForSaleMapper.getReplyListWithPaging(originalId, idLength, cri) );
		return ret;
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


}