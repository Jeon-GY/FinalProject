package www.TPP.com.common.model;

import java.util.Date;

import lombok.Data;

@Data
public abstract class CommonAttr {
	public Date registrationDate;	//등록시점
	public Date updateDate;	//수정시점
}
