package www.TPP.com.board.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import www.TPP.com.board.service.BoardService;
import www.TPP.com.board.service.PostInfoService;
import www.TPP.com.board.service.PostService;
import www.TPP.com.common.paging.Criteria;

@Controller
@RequestMapping("/post/*")
public class PostController {
	@Autowired
	private PostService postService;
 	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PostInfoService postInfoService;
	
	@GetMapping(value = "postList")
	   public void listBySearch(@RequestParam("boardId") String boardId, @ModelAttribute("pagination") Criteria fromUser, @RequestParam("postId") String postId , Model model) {
	      model.addAttribute("boardId", boardId);
	      model.addAttribute("boardName", boardService.getBoard(boardId).getBoardName());
	      model.addAttribute("postList", postService.getPostList(boardId, fromUser));
	      model.addAttribute("postInfoList", postInfoService.getPostInfoVOList(postId));
	      fromUser.setTotal(postService.getTotalCount(boardId, fromUser));
	   }	
	
	@GetMapping(value = {"readPost"})
	public void findPostById(@RequestParam("boardId") String boardId, @RequestParam("postId") String postId, @ModelAttribute("pagination") Criteria fromUser, Model model) {
		model.addAttribute("post", postService.getPost(boardId, postId));
		model.addAttribute("boardId", boardId);
	}
	
	
}
