package www.TPP.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.BoardVO;
import www.TPP.com.board.persistence.BoardMapper;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardVO> getList() {
		return boardMapper.getBoardList();
	}
	
	public BoardVO getBoard(String boardId) {
		return boardMapper.getBoard(boardId);
	}
	
	
}
