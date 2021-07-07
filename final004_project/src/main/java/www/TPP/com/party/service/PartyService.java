package www.TPP.com.party.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.party.model.Party;
import www.TPP.com.party.persistence.PartyMapper;

@Service
public class PartyService {
	@Autowired
	private PartyMapper partyMapper;

	public String getBusinessName(String postId) {
		return getBusinessName(postId);
	}

	public Party getParty(String userId) {
		return partyMapper.getParty(userId);
	}
}