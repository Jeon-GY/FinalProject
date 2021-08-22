package www.TPP.com.party.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.party.model.Customer;
import www.TPP.com.party.model.Party;
import www.TPP.com.party.model.Seller;

public interface PartyMapper {
	public String getBusinessName(String postId);

	public int checkId(@Param("userId") String userId);

	public boolean registParty(@Param("party") Party party);

	public int updateLoginDate(String userId);

	public Party findPartyByUserId(String username);

	public List<Customer> getCustomerList();

	public List<Seller> getSellerList();

	public int disableLogin(@Param("userId") String userId);

	public int sellerToCustomer(String sellerId);
}
