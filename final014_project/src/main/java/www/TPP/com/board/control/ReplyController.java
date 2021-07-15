package www.TPP.com.board.control;

import java.util.List;

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

import www.TPP.com.board.model.ReplyVO;
import www.TPP.com.board.service.ReplyService;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.party.model.Customer;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	//LRCUD
	@GetMapping(value="pages/{originalId}/{page}")
	public ResponseEntity<List<ReplyVO>> getReplyListWithPaging(
			@PathVariable("originalId") String originalId,
			@PathVariable("page") int page) {
		Criteria cri = new Criteria();
		cri.setPageNumber(page);
		
		return new ResponseEntity<>(replyService.getReplyListWithPaging(originalId, cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/{replyId}")
	public ResponseEntity<ReplyVO> findReplyById(
			@PathVariable("replyId") String replyId) {
		return new ResponseEntity<>(replyService.findReplyById(replyId), HttpStatus.OK);
	}
	
	@PostMapping(value = "new/{originalId}", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertReply(@PathVariable("originalId") String originalId, 
			@RequestBody ReplyVO reply){
		Customer userId = new Customer("customer3");
		reply.setUserId(userId.getUserId());
		int insertCount = replyService.insertReply(originalId, reply);
		if(insertCount == 1) {
			return new ResponseEntity<>(reply.getReplyId(), HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateReply(@RequestBody ReplyVO reply){
		int updateCount = replyService.updateReply(reply);
		if(updateCount == 1) {
			return new ResponseEntity<>("수정처리가 성공", HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping(value = "{id}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteReplyById(@PathVariable("id") String id){
		int deleteCount = replyService.deleteReplyById(id);
		if(deleteCount > 0) {
			return new ResponseEntity<>("삭제처리가 성공", HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}









