package www.TPP.com.party.control;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import www.TPP.com.party.model.Customer;
import www.TPP.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController implements AuthenticationSuccessHandler, AccessDeniedHandler {
	@Autowired
	private PartyService partyService;

	/* 로그인 */
	@GetMapping("login")
	public void loginInput(@RequestParam(value = "code", required = false) String code, String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "로그인 실패. 재시도 바랍니다.");
		}
		if (logout != null) {
			model.addAttribute("logout", "안녕히 가세요!");
		}
		
		String result = null;
		try {
			result = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			result = "";
		}
		model.addAttribute("ipAddress", result);
	}

	@PostMapping("logout")
	public void processLogoutPost() {
	}

	@GetMapping("showCurUser")
	public void showCurUser() {
	}

	@GetMapping(value = "checkId/{userId}")
	public ResponseEntity<Integer> checkId(@PathVariable("userId") String userId) {
		int ret = partyService.checkId(userId);
		if (ret == 0) {
			return new ResponseEntity<>(0, HttpStatus.OK);
		}
		return new ResponseEntity<>(ret, HttpStatus.OK);
	}

	@GetMapping(value = "regist")
	public void regist() {
	}

	@PostMapping(value = "registParty")
	public String registParty(Customer curUser) {
		partyService.registParty(curUser);
		return "redirect:/";
	}

	@RequestMapping(value = "juso", method = { RequestMethod.GET, RequestMethod.POST })
	public void juso() {

	}

	@PostMapping(value = "makeCustomer")
	public String makeCustomer(String sellerId) {
		partyService.sellerToCustomer(sellerId);
		return "redirect:/post/admin";
	}
	   
	@PostMapping(value = "disable")
	public String disableLogin(String userId) {
			partyService.disableLogin(userId);
		return "redirect:/post/admin";
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
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		if (roleNames.contains("admin")) {
			response.sendRedirect("/");
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

}
