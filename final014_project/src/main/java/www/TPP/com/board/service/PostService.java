package www.TPP.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.persistence.PostInfoMapper;
import www.TPP.com.board.persistence.PostMapper;
import www.TPP.com.common.paging.Criteria;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private PostInfoMapper postInfoMapper;
	
	public List<PostVO> getPostList(Criteria criteria) {
		if(criteria.hasSearching()) {
			return postMapper.getPostListBySearching(criteria);
		}
		return postMapper.getPostList(criteria);
	}

	public List<PostVO> getPost(String boardId, String postId) {
		return postMapper.getPost(boardId, postId);
	}

	public long getTotalCount(String boardId, Criteria criteria) {
		return postMapper.getTotalCount(boardId);
	}

	public int registerPost(PostVO post) {
		return postMapper.registerPost(post);
	}

	public List<PostVO> getPostListByUserId(String userId) {
		return postMapper.getPostListByUserId(userId);
	}

	public boolean updatePost(PostVO post) {
		return postMapper.updatePost(post) == 1;
	}

	public boolean deletePost(PostVO post) {
		return postMapper.deletePost(post) == 1;
	}

}
