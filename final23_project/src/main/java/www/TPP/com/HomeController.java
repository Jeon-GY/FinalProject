package www.TPP.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import www.TPP.com.board.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
	@Autowired
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping
	public String home(Model model) {
		model.addAttribute("boardList", boardService.getList());
		return "home";
	}
	
}
