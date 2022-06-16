package net.koreate.home.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.service.HomeService;
import net.koreate.home.util.MessageCriteria;
import net.koreate.home.util.MessagePageMaker;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.user.vo.UserVO;

@Controller
public class HomeController {
	
	@Inject
	HomeService hs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		model.addAttribute("qlist",hs.qlist());
		BoardVO tradeType = new BoardVO();
		tradeType.setTradeType("buy");
		model.addAttribute("bblist",hs.boardBuyListSearch(tradeType));
		tradeType.setTradeType("sell");
		model.addAttribute("bslist",hs.boardSellListSearch(tradeType));
		model.addAttribute("nlist",hs.nlist());
		return "home/home";
	}
	
	/*
	 * @Transactional
	 * 
	 * @RequestMapping("total") public String totalSearch(BoardVO bvo, QnABoardVO
	 * qvo, @RequestParam("searchValue") String search, @RequestParam("searchType")
	 * String type, Model model) { System.out.println(search); bvo.setTitle(search);
	 * bvo.setContent(search); bvo.setTradeType(type);
	 * 
	 * qvo.setTitle(search); qvo.setContent(search); qvo.setUserNickname(search);
	 * 
	 * model.addAttribute("bBoard",hs.boardListSearch(bvo));
	 * model.addAttribute("qBoard",hs.qlistSearch(qvo));
	 * model.addAttribute("value",search); return "home/list"; }
	 */
	
	@RequestMapping(value = "/home/myList", method = RequestMethod.POST)
	public String wishList(Model model, UserVO uno) throws Exception {
		WishVO wish = new WishVO();
		int number = uno.getUno();
		System.out.println(number);
		wish.setUno(number);
		model.addAttribute("wishList",hs.wish(wish));
		System.out.println(model);
		return "home/myList";
	}
	
	@GetMapping("bell/{uno}")
	@ResponseBody
	public ResponseEntity<List<BellVO>> ring(@PathVariable("uno") int uno){
		ResponseEntity<List<BellVO>> entity = null;
		try {
			List<BellVO> result = hs.bellList(uno);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/selected")
	public String selectBell(@RequestParam("uno") int uno, @RequestParam("bno") int bno) throws Exception {
		BellVO bell = new BellVO();
		bell.setBno(bno);
		bell.setUno(uno);
		hs.updateCheckBoard(bell);
		int writerNum = hs.getUno(bno);
		return "redirect:board/detail?bno="+bno+"&uno="+writerNum+"&w_uno="+uno;
	}
	
	@Transactional
	@GetMapping("called")
	public String callBell(@RequestParam("uno") int uno, @RequestParam("mno") int mno, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		BellVO bell = new BellVO();
		bell.setUno(uno);
		bell.setMno(mno);
		MessageVO message = new MessageVO();
		message.setUno(uno);
		message.setMno(mno);
		hs.updateCheckMessage(bell);
		String referer = request.getHeader("REFERER");
		rttr.addFlashAttribute("mslist",hs.getMessage(message));
		return "redirect:"+referer;
	}
	
	@GetMapping("message/msgList")
	public void msgList(MessageCriteria cri, Model model, @RequestParam(value="c", required=false) String c, @RequestParam(value="ct", required=false) String ct ) throws Exception {
		System.out.println(cri);
		model.addAttribute("mList",hs.messageList(cri));
		MessagePageMaker pm = hs.getPageMaker(cri);
		model.addAttribute("pm", pm);
		
		model.addAttribute("nmList",hs.messageNonCheckedList(cri));
		MessagePageMaker cpm = hs.getNonCheckedPageMaker(cri);
		model.addAttribute("npm", cpm);
		
		model.addAttribute("cmList",hs.messageCheckedList(cri));
		MessagePageMaker npm = hs.getCheckedPageMaker(cri);
		model.addAttribute("cpm", npm);
		
		model.addAttribute("getc",c);
		model.addAttribute("getct",ct);
	}
	
	@Transactional
	@GetMapping("message/msgDetail")
	public void msgDetail(@RequestParam("mno") int mno, Model model) throws Exception {
		model.addAttribute("msgList",hs.messageDetail(mno));
		hs.updateMessageCheck(mno);
	}
	
	/*
	 * @PostMapping("message/resend") public String msgResend(@RequestParam("uno")
	 * int uno, @RequestParam("receiver") String receiver , Model model) { MessageVO
	 * resend = new MessageVO(); resend.setUno(uno); resend.setReceiver(receiver);
	 * model.addAttribute("wList",resend); return "message/msgWrite"; }
	 */
	
	@Transactional
	@PostMapping("message/resister")
	public String insertMessage(MessageVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		boolean result = hs.insertMessage(vo);
		MessageVO tobell = new MessageVO();
		BellVO bell = new BellVO();
		if(result == true) {
			tobell = hs.getMessageRecent();
			System.out.println(tobell);
			bell.setUno(tobell.getUno());
			bell.setMno(tobell.getMno());
			bell.setSender(tobell.getSender());
			hs.insertBell(bell);
		}
		String referer = request.getHeader("REFERER");
		rttr.addFlashAttribute("results",result);
		return "redirect:"+referer;
	}
}
