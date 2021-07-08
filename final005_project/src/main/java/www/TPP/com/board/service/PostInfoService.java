package www.TPP.com.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	
	public int registerPostInfoList(List<PostInfoVO> postInfoList, PostVO post) {
		return postInfoMapper.registerPostInfoList(postInfoList, post);
	}
}
