package www.TPP.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PostInfoVO;
import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.persistence.PostInfoMapper;

@Service
public class PostInfoService {
	@Autowired
	private PostInfoMapper postInfoMapper;
	
	public List<PostInfoVO> getPostInfoVOList(String postId) {
		return postInfoMapper.getPostInfoVOList(postId);
	}
	
	public int registerPostInfoList(PostInfoVO postInfoList, PostVO post) {
		return postInfoMapper.registerPostInfoList(postInfoList, post);
	}

	public boolean updatePostInfoList(PostInfoVO postInfoList) {
		return postInfoMapper.updatePostInfoList(postInfoList) == 1;
	}

	public boolean deletePostInfo(PostInfoVO postInfoList) {
		return postInfoMapper.deletePostInfo(postInfoList) == 1;
	}
}
