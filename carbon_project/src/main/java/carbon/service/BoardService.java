package carbon.service;

import java.util.List;

import carbon.dto.BoardDto;
import carbon.dto.PageDto;
import carbon.dto.Search;

public interface BoardService {


	void board_insert(BoardDto boardDto) throws Exception ;

	List<BoardDto> board_list(Search search) throws Exception ;

	BoardDto board_getlist(Integer board_idx);

	void board_hitsupd(Integer board_idx);

	int board_listcnt(Search search);

}
