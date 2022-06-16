package net.koreate.qnaboard.controller;


import java.io.File;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.koreate.qnaboard.service.QnABoardService;
import net.koreate.qnaboard.util.QnACriteria;
import net.koreate.qnaboard.util.QnAPageMaker;
import net.koreate.qnaboard.vo.QnABoardVO;

@Controller
@RequestMapping("qnaboard")
public class QnABoardController {
	
	@Inject
	ServletContext context;
	
	@Inject
	QnABoardService qs;
	
	// 글목록 페이지 요청
	@RequestMapping("/list")
	public String list(
			Model model,
			QnACriteria cri
			) throws Exception{
		System.out.println(cri);
		model.addAttribute("list",qs.list(cri));
		QnAPageMaker pm = qs.getPageMaker(cri);
		model.addAttribute("pm",pm);
		return "qnaboard/list";
	}
	
	//글쓰기 페이지 화면 요청
	@GetMapping("/write")
	public String write() {
		return "qnaboard/write";
	}
	
	//신규 글 등록 처리 요청
	@Transactional
	@PostMapping("/resister")
	public String resister(QnABoardVO vo,
			MultipartFile file,
			HttpSession session
			) throws Exception {
		
		String uploadFolder = context.getRealPath("/resources/qna");
		System.out.println("폴더경로:"+uploadFolder);
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println(vo);
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			System.out.println("originalFileName:"+originalFileName);
			fileName = uploadFile.getOriginalFilename();
			File saveFile = new File(uploadFolder, originalFileName);
			uploadFile.transferTo(saveFile);
		}
		vo.setFilename(fileName);
		vo.setFilepath(uploadFolder);
		
		qs.regist(vo);
		qs.setRoot();
		return "redirect:/qnaboard/list";
	}

	//글수정 페이지 화면 요청
	@GetMapping("/modify")
	public String modify(
			int qno,
			Model model
			) throws Exception {
		QnABoardVO vo = qs.detail(qno);
		model.addAttribute("vo",vo);
		return "qnaboard/modify";
	}
	
	//글 수정 처리 요청
	@PostMapping("/update")
	public String update(QnABoardVO vo) throws Exception{
		qs.update(vo);
		return"redirect:/qnaboard/list";
	}
	
	// 글 상세보기 화면 요청
	@GetMapping("/detail")
	public String detail(
			int qno,
			Model model
			) throws Exception{
		qs.updateViewCnt(qno);
		QnABoardVO vo = qs.detail(qno);
		model.addAttribute("vo",vo);
		return "qnaboard/detail";
	}
	
	// 글 삭제 처리요청
	@GetMapping("/delete")
	public String delete(
			int qno
			)throws Exception{
		qs.delete(qno);
		System.out.println("삭제호출");
		return "redirect:/qnaboard/list";
	}
	
	// 답글 달기 화면 요청
	@GetMapping("/reply")
	public String reply(
			int qno,
			Model model
			) throws Exception{
		QnABoardVO vo = qs.detail(qno);
		model.addAttribute("vo",vo);
		return "qnaboard/reply";
	}
	
	// 답글 저장 처리 요청
	@PostMapping("/resisterReply")
	public String resisterReply(
			QnABoardVO vo
			) throws Exception{
		qs.registerReply(vo);
		System.out.println("답글달기 완료");
		return "redirect:/qnaboard/list";
	}
	
}
