package www.TPP.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PostInfoVO;
import www.TPP.com.board.persistence.PostInfoMapper;

@Service
public class PostInfoService {
	@Autowired
	private PostInfoMapper postInfoMapper;
	
	public List<PostInfoVO> getPostInfoVOList(String postId) {
		return postInfoMapper.getPostInfoVOList(postId);
	}
	
}
