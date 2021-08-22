package www.TPP.com;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.board.service.BoardService;
import www.TPP.com.board.service.PostService;
import www.TPP.com.board.service.PptForSaleService;
import www.TPP.com.common.attachFile.model.AttachFileVO;
import www.TPP.com.product.service.LocationService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private LocationService locationService;
	@Autowired
	private PostService postService;
	@Autowired
	private PptForSaleService pptForSaleService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);

		List<PostVO> ret = postService.getAdPostList();
		addAttaches(ret);
		model.addAttribute("postList", ret);
		
		model.addAttribute("boardList", boardService.getList());
		model.addAttribute("locationList", locationService.getLocationList());
		return "home";
	}
	
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
