package www.TPP.com.party.model;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public abstract class Party extends CommonAttr{
	private String userId;
	private String userPassword;
	private String userName;
	private String email;
	private String birthDate;
	private String sex;
	private String phoneNumber;
	private String address;
	private String authority;

	public Party(String userId) {
		this.userId = userId;
	}
	
	public abstract List<AuthorityVO> getAuthorityVOList();
}
