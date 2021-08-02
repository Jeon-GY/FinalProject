package www.TPP.com.party.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.TPP.com.party.model.Party;
import www.TPP.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	 /* 로그인 */
	@RequestMapping(value="login", method = RequestMethod.GET)
    public void loginPOST(Party party) {
    }
	
    @RequestMapping(value="login", method = RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, Party party, RedirectAttributes rttr) throws Exception{
        
        //System.out.println("login 메서드 진입");
        //System.out.println("전달된 데이터 : " + party);
    	
    	HttpSession session = request.getSession();
    	
    	Party loginUser = partyService.userLogin(party);
        
    	if(loginUser == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/party/login";
        }
    	partyService.updateLoginDate(loginUser.getUserId());
        session.setAttribute("loginParty", loginUser);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        //System.out.println("세션에 저장된 값은?" + session.getAttribute("party"));
        return "redirect:/";
    }
    
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        session.invalidate();
        
        return "redirect:/";  
        
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
