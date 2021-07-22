package www.TPP.com.party.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.party.model.Customer;
import www.TPP.com.party.model.Party;
import www.TPP.com.party.model.Seller;
import www.TPP.com.party.persistence.PartyMapper;

@Service
public class PartyService {
	@Autowired
	private PartyMapper partyMapper;

	public String getBusinessName(String postId) {
		return partyMapper.getBusinessName(postId);
	}

//	public Party getParty(String userId) {
//		return partyMapper.getParty(userId);
//	}

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
	
	public int checkId(String userId) {
		if(partyMapper.checkId(userId) > 0) {
			return partyMapper.checkId(userId);
		}
		return 0;
	}
}