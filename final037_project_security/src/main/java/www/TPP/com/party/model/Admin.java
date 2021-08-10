package www.TPP.com.party.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Admin extends Party{
	private static List<AuthorityVO> listAuthority = new ArrayList<>();
	static {
		listAuthority.add(new AuthorityVO("admin"));
		listAuthority.add(new AuthorityVO("seller"));
		listAuthority.add(new AuthorityVO("customer"));
	}
	
	public Admin(String userId) {
		super(userId);
	}
	@Override
	public List<AuthorityVO> getAuthorityList() {
		return listAuthority;
	}


}
