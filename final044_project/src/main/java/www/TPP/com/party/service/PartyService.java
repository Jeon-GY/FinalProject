package www.TPP.com.party.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import www.TPP.com.framework.CustomUser;
import www.TPP.com.party.model.Customer;
import www.TPP.com.party.model.Party;
import www.TPP.com.party.model.Seller;
import www.TPP.com.party.persistence.PartyMapper;

@Service
@NoArgsConstructor
@AllArgsConstructor
public class PartyService implements UserDetailsService {
	@Autowired
	private PartyMapper partyMapper;

	public String getBusinessName(String postId) {
		return partyMapper.getBusinessName(postId);
	}

	public int checkId(String userId) {
		if (partyMapper.checkId(userId) > 0) {
			return partyMapper.checkId(userId);
		}
		return 0;
	}

	public boolean registParty(Party party) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		party.setUserPassword(encoder.encode(party.getUserPassword()));
		return partyMapper.registParty(party);
	}

	public int updateLoginDate(String userId) {
		return partyMapper.updateLoginDate(userId);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Party loginParty = partyMapper.findPartyByUserId(username);
		return loginParty == null ? null : new CustomUser(loginParty);
	}

	public List<Customer> getCustomerList() {
		return partyMapper.getCustomerList();
	}

	public List<Seller> getSellerList() {
		return partyMapper.getSellerList();
	}

	public int disableLogin(String userId) {
		return partyMapper.disableLogin(userId);
	}

}