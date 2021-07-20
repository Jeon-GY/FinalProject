package www.TPP.com.board.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.board.service.BoardService;
import www.TPP.com.board.service.PostService;
import www.TPP.com.board.service.PptForSaleService;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.party.model.Seller;
import www.TPP.com.party.service.PartyService;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.ProductCategoryVO;
import www.TPP.com.product.service.LocationService;
import www.TPP.com.product.service.ProductCategoryService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	@Autowired
	private PptForSaleService pptForSaleService;
	@Autowired
	private PostService postService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ProductCategoryService productCategoryService;
	@Autowired
	private PartyService partyService;
	@Autowired
	private LocationService locationService;

	@GetMapping(value = { "postList", "managementProduct" })
	public void listBySearch(@RequestParam("boardId") String boardId, @ModelAttribute("criteria") Criteria criteria,
			Model model) {
		model.addAttribute("boardId", boardId);
		model.addAttribute("boardName", boardService.getBoard(boardId).getBoardName());
		model.addAttribute("postList", postService.getPostList(criteria));
		model.addAttribute("postListBySellCount", postService.getPostListBySellCount(criteria));
		model.addAttribute("postListByUserId", postService.getPostListByUserId("seller2"));
		criteria.setTotal(postService.getPostTotalCount(boardId, criteria));
	}

	@GetMapping(value = { "readPost", "modifyPost" })
	public void findPostById(@RequestParam("boardId") String boardId, @RequestParam("postId") String postId,
			@ModelAttribute("criteria") Criteria criteria, Model model) {
		model.addAttribute("post", postService.getPost(postId));
		model.addAttribute("pptForSaleList", pptForSaleService.getPptForSaleList(postId));
	}

	@GetMapping(value = "registerPost")
	public void registerPost(@RequestParam("boardId") String boardId, Model model) {
		model.addAttribute("boardId", boardId);
		model.addAttribute("bigLocation", locationService.getLocationList());
		model.addAttribute("productCategory", productCategoryService.getProductCategoryList());
	}

	@GetMapping(value = "get/{locationId}")
	public ResponseEntity<List<LocationVO>> getLocation(@PathVariable("locationId") String locationId) {
		return new ResponseEntity<>(locationService.getLocationListByLocation(locationId), HttpStatus.OK);
	}

	@PostMapping(value = "registerPost")
	public String registerPost(PptForSaleVO pptForSale, PostVO post, LocationVO location,
			ProductCategoryVO productCategory) {
		Seller writer = new Seller("seller2");
		pptForSale.setUserId(writer.getUserId());

		postService.registerPost(post);
		pptForSaleService.registerPptForSale(pptForSale, post, location, productCategory);

		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}
	
	@PostMapping(value = "modifyPost")
	public String modifyPost(PostVO post, PptForSaleVO pptForSale, Criteria fromUser, RedirectAttributes rttr) {
		postService.updatePost(post);
		pptForSaleService.updatePptForSale(pptForSale);
		
		rttr.addAttribute("pageNumber", fromUser.getPageNumber());
		rttr.addAttribute("amount", fromUser.getAmount());
		
		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}

	@PostMapping(value = "removePost")
	public String removePost(PostVO post) {

		pptForSaleService.deletePptForSale(post);
		postService.deletePost(post);

		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}

	
}
