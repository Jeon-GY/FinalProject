package www.TPP.com.board.control;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import www.TPP.com.common.attachFile.service.AttachFileVOService;
import www.TPP.com.common.paging.Criteria;
import www.TPP.com.framework.springSecurityAdaper.CustomUser;
import www.TPP.com.party.model.Party;
import www.TPP.com.party.service.PartyService;
import www.TPP.com.product.model.LocationVO;
import www.TPP.com.product.model.PptVO;
import www.TPP.com.product.model.ProductCategoryVO;
import www.TPP.com.product.service.LocationService;
import www.TPP.com.product.service.PptService;
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
	@Autowired
	private PptService pptService;
	@Autowired
	private AttachFileVOService attachFileVOService;

	@GetMapping(value = "startLive")
	@PreAuthorize("isAuthenticated()")
	public void startLive(@AuthenticationPrincipal Principal principal, Model model) {
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		
	}

	@GetMapping(value = "watchLive")
	@PreAuthorize("isAuthenticated()")
	public void watchLive(@AuthenticationPrincipal Principal principal, Model model) {
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
	}

	@GetMapping(value = "live")
	@PreAuthorize("isAuthenticated()")
	public void listBySearch(@AuthenticationPrincipal Principal principal, Model model) {
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
	}

	@GetMapping(value = "postList")
	public void listBySearch(@AuthenticationPrincipal Principal principal, @RequestParam("boardId") String boardId,
			@ModelAttribute("criteria") Criteria criteria, Party party, Model model) {
		Party curUser = null;
		if (principal != null) {
			UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
			CustomUser cu = (CustomUser) upat.getPrincipal();
			curUser = cu.getCurUser();
		}

		model.addAttribute("boardId", boardId);
		model.addAttribute("boardName", boardService.getBoard(boardId).getBoardName());

		List<PostVO> ret = postService.getPostList(criteria);
		addAttaches(ret);

		model.addAttribute("postList", ret);
		model.addAttribute("locationList", locationService.getLocationList());

		criteria.setTotal(postService.getPostTotalCount(criteria));
	}

	@GetMapping(value = "searchingProductList")
	public void searchingProductList(String locationId, @ModelAttribute("criteria") Criteria criteria, Party party, Model model) {

		List<PostVO> ret = postService.getPostListByLocation(locationId, criteria);
		addAttaches(ret);

		model.addAttribute("postList", ret);
		model.addAttribute("locationList", locationService.getLocationList());

		criteria.setTotal(postService.getPostTotalCount(criteria));
	}

	@GetMapping(value = "managementProduct")
	@PreAuthorize("principal.username == #writerId")
	public void productBySearch(@AuthenticationPrincipal Principal principal, @RequestParam("boardId") String boardId,
			@ModelAttribute("criteria") Criteria criteria, Party party, Model model) {
		
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		Party writer = cu.getCurUser();
		
		List<PostVO> ret = postService.getPostListByUserId(criteria, writer.getUserId());
		addAttaches(ret);

		model.addAttribute("boardId", boardId);
		model.addAttribute("boardName", boardService.getBoard(boardId).getBoardName());
		model.addAttribute("postList", ret);
		model.addAttribute("locationList", locationService.getLocationList());

		criteria.setTotal(postService.getPostTotalCountByUserId(criteria, writer.getUserId()));
	}

	@GetMapping(value = { "readPost", "modifyPost" })
	public void findPostById(HttpServletRequest request, @RequestParam("boardId") String boardId,
			@RequestParam("postId") String postId, @ModelAttribute("criteria") Criteria criteria, Model model) {
		
		model.addAttribute("post", postService.getPost(postId));
		model.addAttribute("pptForSaleList", pptForSaleService.getPptForSaleList(postId));
		model.addAttribute("locationList", locationService.getLocationList());
	}

	@GetMapping(value = "registerPost")
	@PreAuthorize("isAuthenticated()")	
	public void registerPost(HttpServletRequest request, @RequestParam("boardId") String boardId, Model model) {

		model.addAttribute("boardId", boardId);
		model.addAttribute("bigLocation", locationService.getLocationList());
		model.addAttribute("productCategory", productCategoryService.getProductCategoryList());
		model.addAttribute("locationList", locationService.getLocationList());
	}

	@GetMapping(value = "get/{locationId}")
	public ResponseEntity<List<LocationVO>> getLocation(@PathVariable("locationId") String locationId) {
		return new ResponseEntity<>(locationService.getLocationListByLocation(locationId), HttpStatus.OK);
	}

	@PostMapping(value = "registerPost")
	@PreAuthorize("isAuthenticated()")	
	public String registerPost(@AuthenticationPrincipal Principal principal, PptForSaleVO pptForSale, PptVO ppt, PostVO post,
			LocationVO location, ProductCategoryVO productCategory) {
		
		UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
		CustomUser cu = (CustomUser) upat.getPrincipal();
		Party writer = cu.getCurUser();

		pptForSale.setUserId(writer.getUserId());
		pptForSale.parseAttachInfo();

		postService.registerPost(post);
		pptForSaleService.registerPptForSale(pptForSale, post, location, productCategory);
		attachFileVOService.insert(pptForSale);
		pptService.registerPpt(ppt, location, productCategory);

		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}

	@PostMapping(value = "modifyPost")
	@PreAuthorize("principal.username == #writerId")
	public String modifyPost(PostVO post, PptForSaleVO pptForSale, Criteria fromUser, RedirectAttributes rttr) {
		pptForSale.parseAttachInfo();
		postService.updatePost(post);
		pptForSaleService.updatePptForSale(pptForSale);
		rttr.addAttribute("pageNumber", fromUser.getPageNumber());
		rttr.addAttribute("amount", fromUser.getAmount());

		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}

	@PostMapping(value = "removePost")
	@PreAuthorize("principal.username == #writerId")
	public String removePost(PostVO post, PptForSaleVO pptForSale) {

		pptForSaleService.deletePptForSale(post, pptForSale);
		postService.deletePost(post);

		return "redirect:/post/managementProduct?boardId=5&sellerId=seller2";
	}
	
	// Array??? ????????? Post List??? ????????? Post??? ???????????? PptForSaleVO ???????????? ????????????
	// ??? ?????? AttachFileVO ???????????? ????????????
	private void addAttaches(List<PostVO> ret) {
		for (PostVO post : ret) {
			List<PptForSaleVO> pptList = pptForSaleService.getPptForSaleList(post.getPostId());
			pptList.forEach(ppt -> {
				ppt.parseAttachInfo();
				ppt.setListAttachInStringFormat(ppt.getListAttach().stream().map(vo -> {
					vo.getJson();
					return vo.getFileCallPath();
				}).collect(Collectors.toList()));
			});
			post.setPptForSaleList(pptList);
		}
	}
	
}
