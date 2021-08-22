package www.TPP.com.board.control;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.board.service.PptForSaleService;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.framework.CustomUser;
import www.TPP.com.framework.Quad;
import www.TPP.com.party.model.Party;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	@Autowired
	private PptForSaleService pptForSaleService;

	// LRCUD

	// 게시글Id와 Review와 Q&A의 현제 Page의 정보를 받음
	@GetMapping(value = "pages/{originalId}/{reviewPage}/{qnaPage}")
	public ResponseEntity<Quad<Criteria, Criteria, List<PptForSaleVO>, List<PptForSaleVO>>> getReplyListWithPaging(
			@PathVariable("originalId") String originalId, @PathVariable("reviewPage") int reviewPage,
			@PathVariable("qnaPage") int qnaPage) {

		// Review와 Q&A의 현제 Page 정보를 저장
		Criteria reviewCri = new Criteria();
		reviewCri.setPageNumber(reviewPage);
		Criteria qnaCri = new Criteria();
		qnaCri.setPageNumber(qnaPage);

		// Review와 Q&A의 각각의 현제 페이지와 총 개수, 그 리스트를 담아 한번에 전달
		return new ResponseEntity<>(pptForSaleService.getReplyListWithPaging(reviewCri, qnaCri, originalId),
				HttpStatus.OK);
	}

	@GetMapping(value = "/{pptForSaleId}")
	public ResponseEntity<PptForSaleVO> findReplyById(@PathVariable("pptForSaleId") String pptForSaleId) {
		return new ResponseEntity<>(pptForSaleService.findReplyById(pptForSaleId), HttpStatus.OK);
	}

	@PostMapping(value = "new/{originalId}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> insertReply(@AuthenticationPrincipal Principal principal,
			@PathVariable("originalId") String originalId, @RequestBody PptForSaleVO pptForSale) {

		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		Party party = cu.getCurUser();
		pptForSale.setUserId(party.getUserId());

		if (originalId.length() == 5) {
			if (pptForSale.getPrice().contains("review"))
				originalId += "22222";
			else
				originalId += "11111";
		}

		int insertCount = pptForSaleService.insertReply(originalId, pptForSale);
		if (insertCount == 1) {
			return new ResponseEntity<>(pptForSale.getPptForSaleId(), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateReply(@RequestBody PptForSaleVO pptForSale) {
		int updateCount = pptForSaleService.updateReply(pptForSale);
		if (updateCount == 1) {
			return new ResponseEntity<>("수정처리가 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@DeleteMapping(value = "{id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteReplyById(@PathVariable("id") String id) {
		int deleteCount = pptForSaleService.deleteReplyById(id);
		if (deleteCount > 0) {
			return new ResponseEntity<>("삭제처리가 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}