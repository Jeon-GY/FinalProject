package www.TPP.com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.persistence.LocationMapper;

@Service
public class LocationService {
	@Autowired
	private LocationMapper locationMapper;
	
	public List<LocationVO> getLocationList() {
		return locationMapper.getLocationList();
	}
	
	public List<LocationVO> getLocationListByLocation(String locationId) {
		return locationMapper.getLocationListByLocation(locationId);
	}

	public List<LocationVO> getLocationListByProductId(String productId) {
		return locationMapper.getLocationListByProductId(productId);
	}
	
	public List<LocationVO> getLocationSList(LocationVO locationS) {
		return locationMapper.getLocationSList(locationS);
	}
	
}
