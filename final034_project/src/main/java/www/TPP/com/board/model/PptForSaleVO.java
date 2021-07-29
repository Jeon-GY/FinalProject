package www.TPP.com.board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.attachFile.model.AttachFileVO;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PptForSaleVO extends CommonAttr{
	public static final int ID_LENGTH = 5;
	
	private String pptForSaleId;	
	private String title;
	private String content;
	private String weight;
	private String postId;
	private String locationId;
	private String categoryId;
	private String userId;
	private String price;
	
	private List<PptForSaleVO> pptForSaleVOList;
	
	private List<String> listAttachInStringFormat;
	private List<AttachFileVO> listAttach;

	public List<String> getAttachListInGson() {
		List<String> ret = new ArrayList<>();
		ret.addAll(listAttach.stream().map(vo -> vo.getJson()).collect(Collectors.toList()));
		return ret;
	}
	
	public void parseAttachInfo() {
		if (listAttach == null) {
			listAttach = new ArrayList<>();
		}

		if (listAttachInStringFormat != null) {
			for (String ai : listAttachInStringFormat) {
				listAttach.add(AttachFileVO.fromJson(ai));
			}
		}
	}
	
}
