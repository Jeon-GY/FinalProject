package www.TPP.com.party.control;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import www.TPP.com.party.model.Party;
import www.TPP.com.party.model.Seller;
import www.TPP.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController {
	private PartyService partyService;
	
	@PostMapping(value = "registParty")
	public void registParty(@Param("party") Party party) {
		partyService.registParty(party);
	}
	
	@PostMapping(value = "updateParty")
	public void updateParty(@Param("party") Party party) {
		partyService.updateParty(party);
	}
	
	@PostMapping(value = "registSeller")
	public void updateSeller(@Param("seller") Seller seller) {
		partyService.makeSeller(seller);
		partyService.registSeller(seller);
	}
}
