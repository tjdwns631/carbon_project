package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.BoardDto;
import carbon.dto.PageDto;
import carbon.dto.Search;

@Mapper("boardMapper")
public interface BoardMapper {
	
	
	void board_insert(BoardDto boardDto) throws Exception; // 게시물 등록

	List<BoardDto> board_list(Search search) throws Exception;

	BoardDto board_getlist(Integer board_idx);

	void board_hitsupd(Integer board_idx);

	int board_listcnt(Search search);
	
}
