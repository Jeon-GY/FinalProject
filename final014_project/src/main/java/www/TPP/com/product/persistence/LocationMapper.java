package www.TPP.com.product.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.product.model.LocationVO;

public interface LocationMapper {
	public List<LocationVO> getLocationList();
	
	public List<LocationVO> getLocationListByLocation(String locationId);

	public List<LocationVO> getLocationSList(LocationVO locationS);
	
	public List<LocationVO> getLocationListByProductId(String productId);
	
	// 각 도의 locationId 입력 시 하위 시/군 ... 출력
	
}
