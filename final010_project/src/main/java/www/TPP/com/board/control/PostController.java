package www.TPP.com.board.control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.TPP.com.board.model.PostInfoVO;
import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.service.BoardService;
import www.TPP.com.board.service.PostInfoService;
import www.TPP.com.board.service.PostService;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.party.model.Seller;
import www.TPP.com.party.service.PartyService;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductVO;
import www.TPP.com.product.service.LocationService;
import www.TPP.com.product.service.ProductService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	@Autowired
	private PostService postService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private PostInfoService postInfoService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PartyService partyService;
	@Autowired
	private LocationService locationService;

	@GetMapping(value = { "postList", "managementProduct" })
	public void listBySearch(@RequestParam("boardId") String boardId, @ModelAttribute("pagination") Criteria fromUser,
			Model model) {
		model.addAttribute("boardId", boardId);
		model.addAttribute("boardName", boardService.getBoard(boardId).getBoardName());
		model.addAttribute("postList", postService.getPostList(fromUser));
		model.addAttribute("postListByUserId", postService.getPostListByUserId("seller2"));
		fromUser.setTotal(postService.getTotalCount(boardId, fromUser));
	}

	@GetMapping(value = { "readPost", "modifyPost" })
	public void findPostById(@RequestParam("boardId") String boardId, @RequestParam("postId") String postId,
			@ModelAttribute("pagination") Criteria fromUser, Model model) {
		model.addAttribute("post", postService.getPost(boardId, postId));
		model.addAttribute("boardId", boardId);
		model.addAttribute("postInfoList", postInfoService.getPostInfoVOList(postId));
		model.addAttribute("productList", productService.getProductListByPostId(postId));
	}

	@GetMapping(value = "registerPost")
	public void registerPost(@RequestParam("boardId") String boardId, Model model) {
		model.addAttribute("boardId", boardId);
	}
	
	@PostMapping(value = "registerPost")
	public String registerPost(PostVO post, PostInfoVO postInfoList, ProductVO product, LocationVO location) {
		Seller writer = new Seller("seller2");
		post.setSeller(writer);
		
		postService.registerPost(post);
		postInfoService.registerPostInfoList(postInfoList, post);
		locationService.registerLocation(location);
		productService.registerProduct(product, post, location);
		
		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}
	
	@PostMapping(value = "modifyPost")
	public String modifyPost(PostVO post, PostInfoVO postInfoList, Criteria fromUser, RedirectAttributes rttr) {
		postService.updatePost(post);
		postInfoService.updatePostInfoList(postInfoList);
		
		rttr.addAttribute("pageNumber", fromUser.getPageNumber());
		rttr.addAttribute("amount", fromUser.getAmount());
		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}
	
	@PostMapping(value = "removePost")
	public String removePost(PostVO post, PostInfoVO postInfoList, ProductVO product) {
		productService.deleteProduct(product);
		postInfoService.deletePostInfo(postInfoList);
		postService.deletePost(post);
		
		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}
	
	@GetMapping("Image")
	public void uploadImage() {
	}
	
	@PostMapping(value = "uploadImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> uploadImage(@RequestParam("image") File image, @RequestParam("sellerId") String sellerId) {
		PostVO postVO = new PostVO(sellerId, image);
		return new ResponseEntity<>(postVO.getImage(), HttpStatus.OK);
	}
	
	@GetMapping(value = "displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(@RequestParam("post") PostVO post) {
		File file = new File(post.getImage());
		ResponseEntity<byte[]> res = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			res = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@PostMapping(value = "deleteImage")
	@ResponseBody
	public ResponseEntity<String> cancelAttach(@RequestParam("post") PostVO post) {
		try {
			File file = new File(post.getImage());
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>("delete success", HttpStatus.OK);
	}
	// 만약 이미지 처리를 따로 해야한다면 postService.insertImage(image) 같은것을 만들어야 할 듯
}
