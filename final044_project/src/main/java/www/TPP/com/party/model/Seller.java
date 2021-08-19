package www.TPP.com.party.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Seller extends Party {
	private String businessRegNum;
	private String businessName;
	private String businessPhoneNum;
	
	private static List<AuthorityVO> listAuthority = new ArrayList<>();
	static {
		listAuthority.add(new AuthorityVO("seller"));
		listAuthority.add(new AuthorityVO("customer"));
	}


	public Seller(String userId) {
		super(userId);
	}

	@Override
	public List<AuthorityVO> getAuthorityVOList() {
		return listAuthority;
	}
}
