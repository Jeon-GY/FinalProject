package www.TPP.com;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.TPP.com.board.service.BoardService;
import www.TPP.com.board.service.PostService;
import www.TPP.com.party.service.PartyService;

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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping
	public String home(Model model) {
		model.addAttribute("boardList", boardService.getList());
		
	    String admin = "admin";
        String seller = "seller1";
        model.addAttribute("admin", partyService.getParty(admin));
        model.addAttribute("seller", partyService.getParty(seller));		
		return "home";
	}
	
}
