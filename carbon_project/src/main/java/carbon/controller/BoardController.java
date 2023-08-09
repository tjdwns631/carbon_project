package carbon.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import carbon.dto.BoardDto;
import carbon.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	
	@RequestMapping("/board_list.do") // 게시판 리스트 
	public String board_list(Model model) {
	
		List<BoardDto> list = boardservice.board_list();
		log.info("board_list ={}",list);
		model.addAttribute("board_list",list); 
		System.out.println("now : "+LocalDateTime.now());
		return "board/board_list";
	}
	
	@RequestMapping("/board_write.do") // 글쓰기 페이지
	public String board_write(HttpSession session) {
		
		/* String member_idx= (String) session.getAttribute("member_idx"); */
		
		return "board/board_write";
	}
	
	@RequestMapping("/write_action.do") // 글쓰기 액션
	public String write_action(@ModelAttribute BoardDto boardDto) throws Exception {
		// 현재 날짜/시간
		System.out.println("now : "+LocalDateTime.now());
		/*
		 * boardDto.setBoard_date((LocalDateTime)formatedNow);
		 * boardservice.board_insert(boardDto);
		 */
		
		log.info("board_list ={}",boardDto);
		
		
		return "redirect:/board/board_list.do";
		
	}
	
	@RequestMapping("/date.do")
	@ResponseBody
	public String date() { //현재 날짜 시간
	
	    // 현재 날짜/시간
	    Date now = new Date();
	    // 포맷팅 정의
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	    // 포맷팅 적용
	    String formatedNow = formatter.format(now);
	    // 포맷팅 현재 날짜/시간 출력
	    System.out.println(formatedNow); // 2022.05.03 14:43:32
	    
		return formatedNow;
		
	}

}
