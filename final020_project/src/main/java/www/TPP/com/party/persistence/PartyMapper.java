package www.TPP.com.party.persistence;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.party.model.Party;
import www.TPP.com.party.model.Seller;

public interface PartyMapper {
	public String getBusinessName(String postId);
	
	public Party getParty(String userId);
	
	public int registParty(@Param("party") Party party);

	public int updateParty(@Param("party") Party party);

	public int makeSeller(@Param("seller") Seller seller);

	public int registSeller(@Param("seller")Seller seller);
}
