package www.TPP.com.common.attachFile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.common.attachFile.model.AttachFileVO;
import www.TPP.com.common.attachFile.persistence.AttachFileVOMapper;

@Service
public class AttachFileVOService {
	@Autowired
	private AttachFileVOMapper attachFileVOMapper;

	public int insert(PptForSaleVO pptForSale) {
		//첨부 파일 정보도 관리합니다. 고성능
		List<AttachFileVO> listAttach = pptForSale.getListAttach();
		if (listAttach != null && !listAttach.isEmpty()) {
			attachFileVOMapper.insert(pptForSale.getPptForSaleId(), listAttach);
			return 1;
		}
		return 0;
	}

}