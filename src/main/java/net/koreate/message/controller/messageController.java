package net.koreate.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.qnaboard.vo.QnABoardVO;

@Controller
@RequestMapping("message")
public class messageController {

	
	@RequestMapping("/msgWrite")
	public String msgWrite(
			Model model,
			QnABoardVO vo
			) {
		model.addAttribute("vo",vo);
		return"message/msgWrite";
	}
}
