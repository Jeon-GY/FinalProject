package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;

public interface PptForSaleMapper {
//########################################ppt영역###################################################################
	// 게시물에 달린 PptForSale 목록
	public List<PptForSaleVO> getPptForSaleList(@Param("postId") String postId);

	// 특정 PptForSale
	public PptForSaleVO getPptForSale(@Param("postId") String postId);

	// 게시물 등록할 때 같이 등록되는 ppt
	public int registerPost(@Param("pptForSale") PptForSaleVO pptForSale, @Param("post") PostVO post,
			@Param("location") LocationVO location, @Param("productCategory") ProductCategoryVO productCategory);

	// 게시물 수정
	public int updatePptForSale(PptForSaleVO pptForSale);

	// 게시물 삭제시 달린 ppt 삭제
	public boolean deletePptForSale(@Param("post") PostVO post, @Param("pptForSale") PptForSaleVO pptForSale);

//########################################ppt영역###################################################################
	/* 초기 화면 띄울 때 활용 : 최종적으로는 개인화 서비스에서 초기화면으로 활용 */
	public List<PptForSaleVO> getReplyListWithPaging(@Param("originalId") String originalId, @Param("idLength") int idLength,
			@Param("cri") Criteria cri);

	public PptForSaleVO findReplyById(String pptForSaleId);

	/** 댓글 등록하기 */
	public int insertReply(@Param("originalId") String originalId, @Param("pptForSale") PptForSaleVO pptForSale);

	/** 게시글 수정 처리 */
	public int updateReply(@Param("pptForSale") PptForSaleVO pptForSale);

	public int deleteReplyById(String id);

}