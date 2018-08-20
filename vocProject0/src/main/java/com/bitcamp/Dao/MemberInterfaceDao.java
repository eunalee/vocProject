package com.bitcamp.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.Model.Member;

public interface MemberInterfaceDao {
	
	public int memberInsert(Member member);
	public Member selectOneMember(String id);
	
	public List<Member> selectMemberList();
	public List<Member> selectMemberListPage(@Param("firstRow") int firstRow, @Param("endRow") int endRow);
	public int selectMemberCount();
	
	public boolean deleteMember(String id);
	public boolean editMember(Member member);
	
	public boolean updatePwd(@Param("id") String id, @Param("pwd") String pwd);
	
	public Member selectOneMemberByName(String name);
	
	
}
