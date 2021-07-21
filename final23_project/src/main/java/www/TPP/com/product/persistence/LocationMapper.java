package www.TPP.com.product.persistence;

import java.util.List;

import www.TPP.com.product.model.LocationVO;

public interface LocationMapper {
	public List<LocationVO> getLocationList();
	
	public List<LocationVO> getLocationListByLocation(String locationId);
	
}
