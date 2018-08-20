package com.bitcamp.voc.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVo> selectAll() {
		String str = "com.bitcamp.voc.bbs.BoardMapper.selectAll";
		return sqlSessionTemplate.selectList(str);
	}
	
	public BoardVo selectNum(int num){
		String str = "com.bitcamp.voc.bbs.BoardMapper.selectNum";
		return sqlSessionTemplate.selectOne(str, num);
	}
	
	public int insert(BoardVo info) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.insert";
		return sqlSessionTemplate.update(str, info);
	}
	
	public int delete(int num) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.delete";
		return sqlSessionTemplate.update(str, num);
	}
	
	public int modify(BoardVo info) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.modify";
		return sqlSessionTemplate.update(str, info);
	}
	
	public int viewCnt(int num) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.viewCnt";
		return sqlSessionTemplate.update(str, num);
	}
	
	public BoardVo selectName(int num) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.selectName";
		return sqlSessionTemplate.selectOne(str, num);
	}
	
	public int replyCntP(int num) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.replyCntP";
		return sqlSessionTemplate.update(str, num);
	}
	
	public int replyCntM(int num) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.replyCntM";
		return sqlSessionTemplate.update(str, num);
	}
	
	public List<BoardVo> listPage(int page){
		String str = "com.bitcamp.voc.bbs.BoardMapper.listPage";
		return sqlSessionTemplate.selectList(str, page);
	}
	
	public List<BoardVo> listCriteria(Criteria cri){
		String str = "com.bitcamp.voc.bbs.BoardMapper.listCriteria";
		return sqlSessionTemplate.selectList(str, cri);
	}
	
	public int countPaging(Criteria cri) {
		String str = "com.bitcamp.voc.bbs.BoardMapper.countPaging";
		return sqlSessionTemplate.selectOne(str, cri);
	}
}
