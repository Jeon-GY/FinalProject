package www.TPP.com.party.persistence;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.party.model.Party;

public interface PartyMapper {
	public String getBusinessName(String postId);
	
	public boolean registParty(@Param("party") Party party);

	public int updateLoginDate(String userId);

	public Party findPartyByUserId(String username);
}
