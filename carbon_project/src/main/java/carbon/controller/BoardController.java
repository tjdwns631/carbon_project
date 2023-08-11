package carbon.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import carbon.dto.BoardDto;
import carbon.dto.PageDto;
import carbon.dto.Search;
import carbon.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	
	@RequestMapping("/board_list.do") // 게시판 리스트 
	public String board_list(Model model , @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range, 
			@RequestParam(required = false, defaultValue = "type") String type, @RequestParam(required = false) String keyword) throws Exception {
	
		Search search = new Search();
		search.setType(type);
		search.setKeyword(keyword);
		
		int listcnt = boardservice.board_listcnt(search); // 총 게시물 수
		System.out.println(listcnt);
		model.addAttribute("total_cnt", listcnt);
		
		search.pageInfo(page, range, listcnt);// 페이징
		
		model.addAttribute("pagedto", search);
		List<BoardDto> list = boardservice.board_list(search);
		log.info("board_list ={}",list);
		model.addAttribute("board_list",list); 
		
		return "board/board_list";
	}
	
	@GetMapping("/board_getlist.do") // 게시글 조회 및 조회수 증가 
	public String board_getlist(Model model, @RequestParam("board_idx") Integer board_idx, HttpServletRequest request, HttpServletResponse response) {
		
		/* 게시글 조회 */
		BoardDto list = boardservice.board_getlist(board_idx);
		log.info("board_list ={}",list);
		model.addAttribute("board_list",list);

		/* 조회수 증가 로직 쿠키사용 */
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies(); 
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }

	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + board_idx.toString() + "]")) {
	        	System.out.println("조회수 증가");
	            boardservice.board_hitsupd(board_idx);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + board_idx + "]");
	            oldCookie.setPath("/");
				/* oldCookie.setMaxAge(60 * 60 * 24); */
	            oldCookie.setMaxAge(60);
	            response.addCookie(oldCookie);
	        } else {
	        	System.out.println("조회수 증가안함");
	        }
	    } else {
	    	System.out.println("조회수 증가");
	    	boardservice.board_hitsupd(board_idx);
	        Cookie newCookie = new Cookie("postView","[" + board_idx + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60);
			/* newCookie.setMaxAge(60 * 60 * 24); */
	        response.addCookie(newCookie);
	    }
		
		return "board/board_getlist";
	}
	
	@RequestMapping("/board_searchaction.do") // 검색 기능
	public String board_write() {
		
		/* String member_idx= (String) session.getAttribute("member_idx"); */
		
		return "board/board_write";
	}
	
	@RequestMapping("/board_write.do") // 글쓰기 페이지
	public String board_write(HttpSession session) {
		
		/* String member_idx= (String) session.getAttribute("member_idx"); */
		
		return "board/board_write";
	}
	
	@RequestMapping("/write_action.do") // 글쓰기 액션
	public String write_action(@ModelAttribute BoardDto boardDto) throws Exception {
		// 현재 날짜/시간
		Timestamp datetime = Timestamp.valueOf(LocalDateTime.now());
		
		boardDto.setBoard_date(datetime);
		boardservice.board_insert(boardDto);
		 
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
