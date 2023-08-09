package carbon.service;

import java.util.List;

import carbon.dto.BoardDto;

public interface BoardService {


	void board_insert(BoardDto boardDto) throws Exception ;

	List<BoardDto> board_list();

	List<BoardDto> board_list22();

}
