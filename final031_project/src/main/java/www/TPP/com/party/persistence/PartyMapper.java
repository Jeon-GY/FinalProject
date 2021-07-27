package www.TPP.com.party.persistence;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.party.model.Party;

public interface PartyMapper {
	public String getBusinessName(String postId);
	
	public Party getParty(Party party);
	
	public boolean registParty(@Param("party") Party party);

//	public int updateParty(@Param("party") Party party);

//	public int makeSeller(@Param("seller") Seller seller);

//	public int registSeller(@Param("seller") Seller seller);

//	public boolean checkParty(@Param("party") Party party);

	public int checkId(@Param("userId") String userId);

	public Party userLogin(Party party);

	public int updateLoginDate(String userId);
}
