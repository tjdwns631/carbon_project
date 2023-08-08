package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.BoardDto;

@Mapper("boardMapper")
public interface BoardMapper {
	
	List<BoardDto> board_list();
	
}
