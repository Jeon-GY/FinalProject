package www.TPP.com.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.common.model.PurchaseVO;
import www.TPP.com.common.persistence.PurchaseMapper;

@Service
public class PurchaseService {
	@Autowired
	private PurchaseMapper purchaseMapper;

	public int addCart(String userId, String originalId, int count) {
		return purchaseMapper.addCart(userId, originalId, count);
	}

	public List<PurchaseVO> getPurchaseListByUserId(String userId) {
		return purchaseMapper.getPurchaseListByUserId(userId);
	}

	public int deleteCart(String userId, String purId) {
		return purchaseMapper.deleteCart(userId, purId);
	}

}
