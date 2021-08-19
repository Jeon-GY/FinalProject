package www.TPP.com.board.persistence;

import java.util.List;

import www.TPP.com.board.model.BoardVO;

public interface BoardMapper {
	/** 전체 게시판 목록을 조회 */
	public List<BoardVO> getBoardList();
	
	/** 특정 게시판 목록을 조회 */
	public BoardVO getBoard(String boardId);
}
