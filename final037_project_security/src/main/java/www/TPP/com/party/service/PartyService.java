package www.TPP.com.party.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import www.TPP.com.framework.springSecurityAdaper.CustomUser;
import www.TPP.com.party.model.Party;
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

	public boolean registParty(Party party) {
		return partyMapper.registParty(party);
	}

//	public int updateParty(Party party) {
//		return partyMapper.updateParty(party);
//	}
	
//	public int makeSeller(Seller seller) {
//		return partyMapper.makeSeller(seller);
//	}

//	public int registSeller(Seller seller) {
//		return partyMapper.registSeller(seller);
//	}

	public int updateLoginDate(String userId) {
		return partyMapper.updateLoginDate(userId);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Party loginParty =  partyMapper.findPartyByUserId(username);
		return loginParty == null ? null : new CustomUser(loginParty);
	}

}