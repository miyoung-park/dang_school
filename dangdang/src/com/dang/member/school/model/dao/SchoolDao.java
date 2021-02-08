package com.dang.member.school.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dang.common.code.ErrorCode;
import com.dang.common.exception.DataAccessException;
import com.dang.common.jdbc.JDBCTemplate;
import com.dang.member.school.model.vo.SchoolMember;

import oracle.jdbc.proxy.annotation.Pre;

public class SchoolDao {
	
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	
	
	public SchoolMember memberAuthenticate(Connection conn, String kgId, String kgPw) {
		SchoolMember schoolMember = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			
			String query = "select * from kindergarden where kg_id =? and kg_pw = ?";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, kgId);
			pstm.setString(2, kgPw);
			
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				
				schoolMember = new SchoolMember();
				schoolMember.setKgName(rset.getString("kg_name"));
				schoolMember.setKgId(rset.getString("kg_id"));
				schoolMember.setKgPw(rset.getString("kg_pw"));
				schoolMember.setKgAddress(rset.getString("kg_address"));
				schoolMember.setKgTell(rset.getString("kg_tell"));
				schoolMember.setKgOperateTime(rset.getString("kg_operate_time"));
				schoolMember.setKgNotice(rset.getString("kg_notice"));
				schoolMember.setKgGrade(rset.getString("kg_grade"));
				schoolMember.setKgEmail(rset.getString("kg_email"));
			
				

				
			} //select문은 commit이나 rollback 필요없음
			
			
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.LM01, e);
		}finally {
			jdt.close(rset, pstm);
		}

		return schoolMember; 
		
	}
	
	
	
	public SchoolMember selectSchoolByName(Connection conn, String schoolName, String scholPhone) {
		SchoolMember schoolMember = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		String query = "select * from kindergarden where kg_name = ? and kg_tell = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, schoolName);
			pstm.setString(2, scholPhone);
			
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				schoolMember = new SchoolMember();
				schoolMember.setKgName(rset.getString("kg_name"));
				schoolMember.setKgId(rset.getString("kg_id"));
				schoolMember.setKgPw(rset.getString("kg_pw"));
				schoolMember.setKgAddress(rset.getString("kg_address"));
				schoolMember.setKgTell(rset.getString("kg_tell"));
				schoolMember.setKgOperateTime(rset.getString("kg_operate_time"));
				schoolMember.setKgNotice(rset.getString("kg_notice"));
				schoolMember.setKgGrade(rset.getString("kg_grade"));
			}
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e);
		}finally {
			jdt.close(rset, pstm);;
		}
		
		return schoolMember;
		
	}
	
	public int modifySchoolInfo(Connection conn, String kgId, String kgName, String kgAddress, String kgTell, String kgOperateTime, String kgNotice, String kgEmail ) {
		
		int res = 0;
		PreparedStatement pstm = null;
		String query = "update kindergarden set kg_name =?, kg_address=?, kg_tell=?, kg_operate_time=?, kg_notice=?, kg_email=? where kg_id = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, kgName);
			pstm.setString(2, kgAddress);
			pstm.setString(3, kgTell);
			pstm.setString(4, kgOperateTime);
			pstm.setString(5, kgNotice);
			pstm.setString(6, kgEmail);
			pstm.setString(7, kgId);
			
			res = pstm.executeUpdate();

		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UM01, e);
			
		}finally {
			jdt.close(pstm);
		}

		return res;
		
	}
	
	
	
	
	
	
	
	

}
