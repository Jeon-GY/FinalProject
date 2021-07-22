package www.TPP.com.party.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.TPP.com.party.model.Party;
import www.TPP.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	@GetMapping(value = "login")
	public void login(Party party) {
		
	}
	
	@GetMapping(value = "regist")
	public void regist(Party party) {
	}
	
	@GetMapping(value = "checkId/{userId}")
	public ResponseEntity<Integer> checkId(@PathVariable("userId") String userId) {
		int ret = partyService.checkId(userId);
		if(ret == 0) {
			return new ResponseEntity<>(0, HttpStatus.OK);
		}
		return new ResponseEntity<>(ret, HttpStatus.OK);
	}
	
	@PostMapping(value = "registParty")
	public String registParty(Party party) {
		partyService.registParty(party);
		return "redirect:/";
	}
	
	@RequestMapping(value = "juso", method = {RequestMethod.GET, RequestMethod.POST})
	public void juso() {
		
	}
	   
//	@PostMapping(value = "updateParty")
//	public void updateParty(Party party) {
//		partyService.updateParty(party);
//	}
//	
//	@PostMapping(value = "registSeller")
//	public void updateSeller(Seller seller) {
//		partyService.makeSeller(seller);
//		partyService.registSeller(seller);
//	}
}
