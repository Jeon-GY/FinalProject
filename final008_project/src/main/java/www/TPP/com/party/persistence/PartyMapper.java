package www.TPP.com.party.persistence;

import www.TPP.com.party.model.Party;

public interface PartyMapper {
	public String getBusinessName(String postId);
	public Party getParty(String userId);
}
