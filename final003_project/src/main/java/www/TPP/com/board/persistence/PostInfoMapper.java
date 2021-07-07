package www.TPP.com.board.persistence;

import java.util.List;

import www.TPP.com.board.model.PostInfoVO;

public interface PostInfoMapper {
	public List<PostInfoVO> getPostInfoVOList(String postId);
	
	
}
