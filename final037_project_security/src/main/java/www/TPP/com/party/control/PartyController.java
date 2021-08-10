package www.TPP.com.party.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.TPP.com.party.model.Party;
import www.TPP.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController implements AuthenticationSuccessHandler, AccessDeniedHandler {
	@Autowired
	private PartyService partyService;
	
	 /* 로그인 */
	@GetMapping("login")
	public void loginInput(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "로그인 실패. 재시도 바랍니다.");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "안녕히 가세요!");
		}
	}
	
	@GetMapping("logout")
	public void processLogout() {
	}

	@PostMapping("logout")
	public void processLogoutPost() {
	}
	

	@GetMapping("showCurUser")
	public void showCurUser() {
	}
	
    
	@GetMapping(value = "regist")
	public void regist(Party party) {
	}
		
	@PostMapping(value = "registParty")
	public String registParty(Party party) {
		partyService.registParty(party);
		return "redirect:/";
	}
	
	@RequestMapping(value = "juso", method = {RequestMethod.GET, RequestMethod.POST})
	public void juso() {
		
	}

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		response.sendRedirect("/party/accessError");
	}
	
	/**
	 * 로그인 성공 시 각 사용자의 권한 유형에 따라 개인화된 화면을 연동 시켜주기 위한 기능을 이곳에서 개발 합니다.
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		if (roleNames.contains("admin")) {
			response.sendRedirect("/post/postList?boardId=2");
			return;
		}

		if (roleNames.contains("seller")) {
			response.sendRedirect("/");
			return;
		}

		if (roleNames.contains("customer")) {
			response.sendRedirect("/");
			return;
		}
		response.sendRedirect("/");
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
