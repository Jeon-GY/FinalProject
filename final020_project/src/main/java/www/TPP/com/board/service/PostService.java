package www.TPP.com.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.board.persistence.PostMapper;
import www.TPP.com.common.paging.Criteria;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;

	// 게시물 개수
	public long getPostTotalCount(String boardId, Criteria criteria) {
		return postMapper.getPostTotalCount(boardId);
	}

	// 최신순 게시물 목록
	public List<PostVO> getPostList(Criteria criteria) {
		if (criteria.hasSearching()) {
			return postMapper.getPostListBySearching(criteria);
		}
		return postMapper.getPostList(criteria);
	}

	// 판매순 정렬 게시물 리스트
	public List<PostVO> getPostListBySellCount(@Param("criteria") Criteria criteria) {
		return postMapper.getPostListBySellCount(criteria);
	}

	// rate 순 정렬 게시물 리스트
	public List<PostVO> getPostListByRate(@Param("criteria") Criteria criteria) {
		return postMapper.getPostListByRate(criteria);
	}

	// 단어 검색을 통한 게시물 리스트
	public List<PostVO> getPostListBySearching(@Param("criteria") Criteria criteria) {
		return postMapper.getPostListBySearching(criteria);
	}

	// 아이디 검색을 통한 게시물 리스트
	public List<PostVO> getPostListByUserId(String userId) {
		return postMapper.getPostListByUserId(userId);
	}

	// 특정 게시물 조회
	public List<PostVO> getPost(String postId) {
		return postMapper.getPost(postId);
	}

	// 게시물 등록
	public int registerPost(PostVO post) {
		return postMapper.registerPost(post);
	}

	// 게시물 삭제
	public boolean deletePost(PostVO post) {
		return postMapper.deletePost(post);
	}

	public boolean updatePost(PostVO post) {
		return postMapper.updatePost(post) == 1;		
	}

}