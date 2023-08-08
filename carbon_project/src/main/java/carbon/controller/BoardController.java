package carbon.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import carbon.dto.BoardDto;
import carbon.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	
	@RequestMapping("/board_list.do")
	public String board_list(Model model) {
		
		List<BoardDto> board_list = boardservice.board_list();
		
		model.addAttribute("board_list",board_list);
		System.out.println(board_list.get(0).getMemberdto().getMember_name());
		log.info("board_list ={}",board_list);
		
		return "board/board_list";
	}
	
	@RequestMapping("/board_write.do")
	public String board_write() {
		return "board/board_write";
	}
	
	@RequestMapping("/list_action.do")
	@ResponseBody
	public String list_action() { //현재 날짜 시간
	
		
		return null;
		
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
