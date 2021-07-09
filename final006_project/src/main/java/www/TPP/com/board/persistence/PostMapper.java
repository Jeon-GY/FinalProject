package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostInfoVO;
import www.TPP.com.board.model.PostVO;
import www.TPP.com.common.paging.Criteria;

public interface PostMapper {
	public List<PostVO> getPostList(@Param("criteria") Criteria criteria);
	
	public PostVO getPost(@Param("boardId") String boardId,@Param("postId") String postId);

	public long getSearchTotalCount(@Param("boardId") String boardId, @Param("criteria") Criteria fromUser);

	public long getTotalCount(String boardId);
	
	// PostInfo 부분
	
	public List<PostInfoVO> getPostInfoVOList(String postId);

	public int registerPost(@Param("post") PostVO post);

	public List<PostVO> getPostListByUserId(String userId);
	
}
