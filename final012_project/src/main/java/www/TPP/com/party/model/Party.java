package www.TPP.com.party.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public abstract class Party extends CommonAttr{
	public String userId;
	private String userPassword;
	private String userName;
	private Date birthDate;
	private boolean sex;
	private String phoneNumber;
	private String address;
	private String authority;

	public Party(String userId) {
		this.userId = userId;
	}
	
}
