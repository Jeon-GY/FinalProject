package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.common.paging.Criteria;

public interface PostMapper {
	public List<PostVO> getPostList(@Param("boardId") String boardId, @Param("criteria") Criteria criteria);
	
	public PostVO getPost(@Param("boardId") String boardId,@Param("postId") String postId);

	public long getSearchTotalCount(@Param("boardId") String boardId, @Param("criteria") Criteria fromUser);

	public long getTotalCount(String boardId);
	
}
