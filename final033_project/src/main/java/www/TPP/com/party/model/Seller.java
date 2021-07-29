package www.TPP.com.party.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Seller extends Party{
	private String businessRegNum;
	private String businessName;
	private String businessPhoneNum;
	
	private String userId;
	private String userPassword;
	private String userName;
	private String authority;

	
	public Seller(String userId) {
		super(userId);
	}
}
