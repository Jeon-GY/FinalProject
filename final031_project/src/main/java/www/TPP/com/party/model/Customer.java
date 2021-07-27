package www.TPP.com.party.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Customer extends Party{
	private String userId;
	private String userPassword;
	private String userName;
	private String authority;


	public Customer(String userId) {
		super(userId);
	}
}
