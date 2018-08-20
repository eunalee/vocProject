package com.bitcamp.voc.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVo> selectAll(int num) {
		String str = "com.bitcamp.voc.bbs.ReplyMapper.selectAll";
		return sqlSessionTemplate.selectList(str, num);
	}
	
	public ReplyVo selectNum(int cnum){
		String str = "com.bitcamp.voc.bbs.ReplyMapper.selectNum";
		return sqlSessionTemplate.selectOne(str, cnum);
	}
	
	public int insert(ReplyVo info) {
		String str = "com.bitcamp.voc.bbs.ReplyMapper.insert";
		return sqlSessionTemplate.update(str, info);
	}
	
	public int delete(int cnum) {
		String str = "com.bitcamp.voc.bbs.ReplyMapper.delete";
		return sqlSessionTemplate.update(str, cnum);
	}
	
	public int deleteReply(int num) {
		String str = "com.bitcamp.voc.bbs.ReplyMapper.deleteReply";
		return sqlSessionTemplate.update(str, num);
	}
	
	public int modify(ReplyVo info) {
		String str = "com.bitcamp.voc.bbs.ReplyMapper.modify";
		return sqlSessionTemplate.update(str, info);
	}
	
	public ReplyVo selectName(int cnum) {
		String str = "com.bitcamp.voc.bbs.ReplyMapper.selectName";
		return sqlSessionTemplate.selectOne(str, cnum);
	}
	
}
