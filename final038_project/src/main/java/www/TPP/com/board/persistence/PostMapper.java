package www.TPP.com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.TPP.com.board.model.PostVO;
import www.TPP.com.common.paging.Criteria;

public interface PostMapper {
	// 게시물 개수
	public long getPostTotalCount(@Param("criteria") Criteria criteria);

	public long getPostTotalCountByUserId(@Param("criteria") Criteria criteria, @Param("userId") String userId);

	public long getPostTotalCountBySearching(@Param("criteria") Criteria criteria);

	public long getPostTotalCountBySearchingWithUserId(@Param("criteria") Criteria criteria,
			@Param("userId") String userId);

	// 특정 게시물 조회
	public PostVO getPost(@Param("postId") String postId);

	// 최신순 게시물 목록
	public List<PostVO> getPostList(@Param("criteria") Criteria criteria);

	// 판매순 정렬 게시물 리스트
	public List<PostVO> getPostListBySellCount(@Param("criteria") Criteria criteria);

	// rate 순 정령 게시물 리스트
	public List<PostVO> getPostListByRate(@Param("criteria") Criteria criteria);

	// 단어 검색을 통한 게시물 리스트
	public List<PostVO> getPostListBySearching(@Param("criteria") Criteria criteria);

	public List<PostVO> getPostListBySearchingWithUserId(@Param("criteria") Criteria criteria,
			@Param("userId") String userId);

	// 아이디 검색을 통한 게시물 리스트
	public List<PostVO> getPostListByUserId(@Param("criteria") Criteria criteria, @Param("userId") String userId);

	// 지역 카테고리~
	public List<PostVO> getPostListByLocation(@Param("locationId") String locationId,
			@Param("criteria") Criteria criteria);

	// 게시물 등록
	public int registerPost(@Param("post") PostVO post);

	// 게시물 삭제
	public boolean deletePost(PostVO post);

	public PostVO getPostId(@Param("postName") String postName);

	public int updatePost(@Param("post") PostVO post);

}