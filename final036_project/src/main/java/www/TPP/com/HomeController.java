package www.TPP.com;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import www.TPP.com.board.service.BoardService;
import www.TPP.com.party.model.Party;
import www.TPP.com.party.service.PartyService;
import www.TPP.com.product.service.LocationService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private PartyService partyService;
	@Autowired
	private LocationService locationService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@GetMapping
	public String home(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("party"));
		Party loginParty = new Party();
		loginParty = (Party) session.getAttribute("loginParty");
		//System.out.println("전달된 데이터 : " + party);
		model.addAttribute("loginParty", loginParty);
		
		model.addAttribute("boardList", boardService.getList());
		
		model.addAttribute("locationList", locationService.getLocationList());
		return "home";
	}
	
}
