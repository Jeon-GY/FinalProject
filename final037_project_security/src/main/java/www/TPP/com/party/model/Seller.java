package www.TPP.com.party.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Seller extends Party{
	private String businessRegNum;
	private String businessName;
	private String businessPhoneNum;
	
	public Seller(String userId) {
		super(userId);
	}
	
	private static List<AuthorityVO> listAuthority = new ArrayList<>();
	static {
		listAuthority.add(new AuthorityVO("seller"));
		listAuthority.add(new AuthorityVO("customer"));
	}

	@Override
	public List<AuthorityVO> getAuthorityList() {
		return listAuthority;
	}
}
