package www.TPP.com.common.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.common.model.PurchaseVO;

public interface PurchaseMapper {
	int addCart(@Param("userId") String userId, @Param("originalId") String originalId, @Param("count") int count);

	List<PurchaseVO> getPurchaseListByUserId(String userId);

	int deleteCart(@Param("userId") String userId, @Param("purId") String purId);


}
