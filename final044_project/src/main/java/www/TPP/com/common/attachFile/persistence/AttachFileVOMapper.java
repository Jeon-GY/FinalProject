package www.TPP.com.common.attachFile.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.common.attachFile.model.AttachFileVO;

public interface AttachFileVOMapper {
	// 단건 처리를 여러번 수행하기 보다 한번에 여러건을 처리하여 DB와의 통신 횟수를 줄인다. (성능이 높아짐)
	public int insert(@Param("pptForSaleId") String pptForSaleId, @Param("listAttachFile") List<AttachFileVO> listAttachFile);

	// 게시글 삭제 또는 첨부 정보를 수정 시 기존 내용을 전체적으로 삭제하고 남은 정보를 insert를 통해 저장
	public int delete(@Param("pptForSaleId") String pptForSaleId);

}
