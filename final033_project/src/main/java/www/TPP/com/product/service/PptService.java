package www.TPP.com.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;
import www.TPP.com.product.persistence.PptMapper;

@Service
public class PptService {
	
	@Autowired
	private PptMapper pptMapper;

	public int registerPpt(LocationVO location, ProductCategoryVO productCategory) {
		return pptMapper.registerPpt(location, productCategory);
	}
	
	
}
