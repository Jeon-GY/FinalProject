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
	public long getPostTotalCount(Criteria criteria) {
		if (criteria.hasSearching()) {
			return postMapper.getPostTotalCountBySearching(criteria);
		}
		return postMapper.getPostTotalCount(criteria);
	}

	public long getPostTotalCountByUserId(@Param("criteria") Criteria criteria, @Param("userId") String userId) {
		if (criteria.hasSearching()) {
			return postMapper.getPostTotalCountBySearchingWithUserId(criteria, userId);
		}

		return postMapper.getPostTotalCountByUserId(criteria, userId);
	}

	// 최신순 게시물 목록
	public List<PostVO> getPostList(Criteria criteria) {
		if (criteria.hasSearching()) {
			return postMapper.getPostListBySearching(criteria);
		}
		
		if (criteria.getOrder() == 0) {
			return postMapper.getPostList(criteria);
		} else if (criteria.getOrder() == 1) {
			return postMapper.getPostListBySellCount(criteria);
		} else {
			return postMapper.getPostListByRate(criteria);
		}
			
	}

	// 아이디 검색을 통한 게시물 리스트
	public List<PostVO> getPostListByUserId(@Param("criteria") Criteria criteria, @Param("userId") String userId) {
		if (criteria.hasSearching()) {
			return postMapper.getPostListBySearchingWithUserId(criteria, userId);
		}
		return postMapper.getPostListByUserId(criteria, userId);
	}

	// 단어 검색을 통한 게시물 리스트
	public List<PostVO> getPostListBySearching(@Param("criteria") Criteria criteria) {
		return postMapper.getPostListBySearching(criteria);
	}

	// 지역 카테고리 클릭시 지역 아이디에 따른 게시물 리스트
	public List<PostVO> getPostListByLocation(String locationId, Criteria criteria) {
		return postMapper.getPostListByLocation(locationId, criteria);
	}

	// 특정 게시물 조회
	public PostVO getPost(String postId) {
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