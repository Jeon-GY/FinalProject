package www.TPP.com.chat.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/chat/*")
public class ChatController {
	
	@CrossOrigin(origins = "http://localhost:8080")
	@GetMapping("chattting")
	public void chat(Model model, HttpServletRequest request) {
		
	}

}
