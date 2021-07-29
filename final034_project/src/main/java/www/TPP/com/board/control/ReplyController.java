package www.TPP.com.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import www.TPP.com.framework.ComparablePair;
import www.TPP.com.party.model.Party;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	@Autowired
	private PptForSaleService pptForSaleService;
	
	//LRCUD
	@GetMapping(value="pages/{originalId}/{page}")
	public ResponseEntity<ComparablePair<Criteria, List<PptForSaleVO>>> getReplyListWithPaging(
			@PathVariable("originalId") String originalId,
			@PathVariable("page") int page) {
		Criteria cri = new Criteria();
		cri.setPageNumber(page);
		ComparablePair<Criteria, List<PptForSaleVO>> ret = pptForSaleService.getReplyListWithPaging(originalId, cri);
	    ret.getSecond().forEach(ppt -> ppt.setPptForSaleVOList(pptForSaleService.getReplyList(ppt.getPptForSaleId())));
		return new ResponseEntity<>(ret, HttpStatus.OK);
	}
	
	@GetMapping(value="/{pptForSaleId}")
	public ResponseEntity<PptForSaleVO> findReplyById(
			@PathVariable("pptForSaleId") String pptForSaleId) {
		return new ResponseEntity<>(pptForSaleService.findReplyById(pptForSaleId), HttpStatus.OK);
	}
		
	@PostMapping(value = "new/{originalId}", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertReply(HttpServletRequest request, @PathVariable("originalId") String originalId, 
			@RequestBody PptForSaleVO pptForSale){
		
		HttpSession session = request.getSession();
		Party loginParty = new Party();
		loginParty = (Party) session.getAttribute("loginParty");

		pptForSale.setUserId(loginParty.getUserId());
		int insertCount = pptForSaleService.insertReply(originalId, pptForSale);
		if(insertCount == 1) {
			return new ResponseEntity<>(pptForSale.getPptForSaleId(), HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateReply(@RequestBody PptForSaleVO pptForSale){
		int updateCount = pptForSaleService.updateReply(pptForSale);
		if(updateCount == 1) {
			return new ResponseEntity<>("수정처리가 성공", HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping(value = "{id}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteReplyById(@PathVariable("id") String id){
		int deleteCount = pptForSaleService.deleteReplyById(id);
		if(deleteCount > 0) {
			return new ResponseEntity<>("삭제처리가 성공", HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}









