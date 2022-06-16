package net.koreate.notice.controller;

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
import org.springframework.web.multipart.MultipartFile;

import net.koreate.notice.service.NoticeService;
import net.koreate.notice.util.NoticeCriteria;
import net.koreate.notice.util.NoticePageMaker;
import net.koreate.notice.vo.NoticeVO;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Inject
	ServletContext context;
	
	@Inject
	NoticeService ns;
	
	// 글목록 페이지 요청
		@RequestMapping("/list")
		public String list(
				Model model,
				NoticeCriteria cri
				) throws Exception{
			System.out.println(cri);
			model.addAttribute("list",ns.list(cri));
			NoticePageMaker pm = ns.getPageMaker(cri);
			model.addAttribute("pm",pm);
			return "notice/list";
		}
		
		//글쓰기 페이지 화면 요청
		@GetMapping("/write")
		public String write() {
			return "notice/write";
		}
		
		//신규 글 등록 처리 요청
		@Transactional
		@PostMapping("/resister")
		public String resister(NoticeVO vo,
				MultipartFile file,
				HttpSession session
				) throws Exception {
			
			String uploadFolder = context.getRealPath("/resources/notice");
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
			
			ns.regist(vo);
			return "redirect:/notice/list";
		}

		//글수정 페이지 화면 요청
		@GetMapping("/modify")
		public String modify(
				int nno,
				Model model
				) throws Exception {
			NoticeVO vo = ns.detail(nno);
			model.addAttribute("vo",vo);
			return "notice/modify";
		}
		
		//글 수정 처리 요청
		@PostMapping("/update")
		public String update(NoticeVO vo) throws Exception{
			ns.update(vo);
			return"redirect:/notice/list";
		}
		
		// 글 상세보기 화면 요청
		@GetMapping("/detail")
		public String detail(
				int nno,
				Model model
				) throws Exception{
			ns.updateViewCnt(nno);
			NoticeVO vo = ns.detail(nno);
			model.addAttribute("vo",vo);
			return "notice/detail";
		}
		
		// 글 삭제 처리요청
		@GetMapping("/delete")
		public String delete(
				int nno
				)throws Exception{
			ns.delete(nno);
			System.out.println("삭제호출");
			return "redirect:/notice/list";
		}
		
	}