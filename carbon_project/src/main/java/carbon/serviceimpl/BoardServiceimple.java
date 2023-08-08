package carbon.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.BoardDto;
import carbon.mapper.BoardMapper;
import carbon.service.BoardService;

@Service
public class BoardServiceimple implements BoardService {

	@Autowired
	private BoardMapper boardmapper;

	@Override
	public List<BoardDto> board_list() {
		
		return boardmapper.board_list();
		
	}
	
	
}
