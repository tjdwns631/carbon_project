package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.BoardDto;

@Mapper("boardMapper")
public interface BoardMapper {
	
	
	void board_insert(BoardDto boardDto) throws Exception; // 게시물 등록

	List<BoardDto> board_list();

	List<BoardDto> board_list22();
	
}
