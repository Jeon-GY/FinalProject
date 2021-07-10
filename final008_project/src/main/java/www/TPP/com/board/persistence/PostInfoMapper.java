package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostInfoVO;
import www.TPP.com.board.model.PostVO;

public interface PostInfoMapper {

	public List<PostInfoVO> getPostInfoVOList(String postId);

	public int registerPostInfoList(@Param("postInfoList") PostInfoVO postInfoList, @Param("post") PostVO post);

	public int updatePostInfoList(@Param("postInfoList") PostInfoVO postInfoList);
	
}
