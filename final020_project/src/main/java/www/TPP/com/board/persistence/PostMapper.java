package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.common.paging.Criteria;

public interface PostMapper {
	// 게시물 개수
	public long getPostTotalCount(String boardId);

	// 특정 게시물 조회
	public List<PostVO> getPost(@Param("postId") String postId);

	// 최신순 게시물 목록
	public List<PostVO> getPostList(@Param("criteria") Criteria criteria);

	// 판매순 정렬 게시물 리스트
	public List<PostVO> getPostListBySellCount(@Param("criteria") Criteria criteria);

	// rate 순 정령 게시물 리스트
	public List<PostVO> getPostListByRate(@Param("criteria") Criteria criteria);

	// 단어 검색을 통한 게시물 리스트
	public List<PostVO> getPostListBySearching(@Param("criteria") Criteria criteria);

	// 아이디 검색을 통한 게시물 리스트
	public List<PostVO> getPostListByUserId(String userId);

	// 게시물 등록
	public int registerPost(@Param("post") PostVO post);

	// 게시물 삭제
	public boolean deletePost(PostVO post);

	public PostVO getPostId(@Param("postName") String postName);

	public int updatePost(@Param("post") PostVO post);

}