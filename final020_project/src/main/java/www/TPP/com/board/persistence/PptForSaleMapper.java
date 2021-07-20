package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;

public interface PptForSaleMapper {
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
	public boolean deletePptForSale(@Param("post") PostVO post);

}