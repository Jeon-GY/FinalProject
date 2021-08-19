package www.TPP.com.common.control;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.board.service.PptForSaleService;
import www.TPP.com.common.model.PurchaseVO;
import www.TPP.com.common.service.PurchaseService;
import www.TPP.com.framework.CustomUser;
import www.TPP.com.party.model.Party;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	@Autowired
	private PurchaseService purchaseService; 
	@Autowired
	private PptForSaleService pptForSaleService; 
	
	@GetMapping(value = "purchase")
	@PreAuthorize("isAuthenticated()")
	public void purchase(@AuthenticationPrincipal Principal principal, Model model) {
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		Party party = cu.getCurUser();
		List<PurchaseVO> listPurchase = purchaseService.getPurchaseListByUserId(party.getUserId());
		
				
		listPurchase.forEach(p->{
			// purchase에 PptForSaleVO정보 담기
			p.setPptForSaleVO(pptForSaleService.getPptForSaleByPptId(p.getPptForSaleId()));
			p.setPostId(pptForSaleService.getpostByPptId(p.getPptForSaleId()));
			// purchase의 total(총액)정보 담기
			p.setTotal(p.getCount()*Integer.parseInt(p.getPptForSaleVO().getPrice()));
			
			// purchase의 PptForSaleVO에 ListAttach정보 담기
			p.getPptForSaleVO().parseAttachInfo();
			p.getPptForSaleVO().setListAttachInStringFormat(p.getPptForSaleVO().getListAttach().stream().map(vo -> {
				vo.getJson();
				return vo.getFileCallPath();
			}).collect(Collectors.toList()));
		}); // End of forEach
		
		model.addAttribute("purchaseList", listPurchase);
		model.addAttribute("total", listPurchase.size());
	}
	
	@PostMapping(value = "addCart/{originalId}/{count}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<Integer> addCart(@AuthenticationPrincipal Principal principal,
			@PathVariable("count") String count, @PathVariable("originalId") String originalId) {
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		String userId = cu.getCurUser().getUserId(); // 로그인 한 유저 ID
		
		return new ResponseEntity<Integer>(purchaseService.addCart(userId, originalId, Integer.parseInt(count)), HttpStatus.OK);
	}
	
	@PostMapping(value = "delete/{purId}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<Integer> deleteCart(@AuthenticationPrincipal Principal principal, @PathVariable("purId") String purId) {
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		String userId = cu.getCurUser().getUserId(); // 로그인 한 유저 ID
		
		return new ResponseEntity<Integer>(purchaseService.deleteCart(userId, purId), HttpStatus.OK);
	}
}