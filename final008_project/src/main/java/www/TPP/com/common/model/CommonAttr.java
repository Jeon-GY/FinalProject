package www.TPP.com.common.model;

import java.util.Date;

import lombok.Data;

@Data
public abstract class CommonAttr {
	private Date registrationDate;	//등록시점
	private Date updateDate;	//수정시점
}
