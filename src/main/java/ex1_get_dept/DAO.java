package ex1_get_dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class DAO {
	
private DataSource ds;

public DAO() {
	try {
		Context init = new InitialContext();
		ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	} catch (Exception ex) {
		System.out.println("DB연결실패 : "+ex);
	}
	
}

public JsonArray getList_lib() {
	 Connection con = null;
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 JsonArray array = new JsonArray();
	 
	 try {
		 con = ds.getConnection();
		 
		 String select_sql = "select * from dept order by deptno";
		 
		 //PreparedStatement 객체 얻기
		 pstmt = con.prepareStatement(select_sql);
		 rs = pstmt.executeQuery();
		 
		 
		 while (rs.next()) {
			JsonObject obj = new JsonObject();
			obj.addProperty("deptno", rs.getInt(1));
			obj.addProperty("dname", rs.getString(2));
			obj.addProperty("loc", rs.getString(3));
			array.add(obj);
		 }
		 
		 
	 } catch (Exception  se) {
		 se.printStackTrace();
	 } finally {
		 try {
			 if (rs !=null)
				 rs.close();
		 } catch (SQLException e) {
			 System.out.println(e.getMessage());
		 }
		 
		 try {
			 if (pstmt !=null)
				 pstmt.close();
		 } catch (SQLException e) {
			 System.out.println(e.getMessage());
		 }
		 
		 try {
			 if (con != null)
				 con.close();
		 } catch (Exception e) {
			 System.out.println(e.getMessage());
		 }
	 }//finally end
	 return array;
}//getList_lib () end

public JsonArray getList_lib_bean() {
	 Connection con = null;
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 JsonArray array = new JsonArray();
	 
	 try {
		 con = ds.getConnection();
		 
		 String select_sql = "select * from dept order by deptno";
		 
		 //PreparedStatement 객체 얻기
		 pstmt = con.prepareStatement(select_sql);
		 rs = pstmt.executeQuery();
		 
		 
		 while (rs.next()) {
			//Dept를 이용해서 저장합니다
			Dept dept = new Dept();
			dept.setDeptno(rs.getInt(1));
			dept.setDname(rs.getString(2));
			dept.setLoc(rs.getString(3));
			
			//JsonElement com.google.gson.Gson.toJsonTree(Object src);
			JsonElement j = new Gson().toJsonTree(dept);
			array.add(j); //JsonElement 형을 요구합니다
		 }
		 
		 
	 } catch (Exception  se) {
		 se.printStackTrace();
	 } finally {
		 try {
			 if (rs !=null)
				 rs.close();
		 } catch (SQLException e) {
			 System.out.println(e.getMessage());
		 }
		 
		 try {
			 if (pstmt !=null)
				 pstmt.close();
		 } catch (SQLException e) {
			 System.out.println(e.getMessage());
		 }
		 
		 try {
			 if (con != null)
				 con.close();
		 } catch (Exception e) {
			 System.out.println(e.getMessage());
		 }
	 }//finally end
	 return array;
}//getList_lib_bean() end

public JsonArray getList_lib_search(int deptno) {
	Connection con = null;
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 JsonArray array = new JsonArray();
	 
	 try {
		 con = ds.getConnection();
		 
		 String select_sql = "select * from dept where deptno = ?";
		 
		 //PreparedStatement 객체 얻기
		 pstmt = con.prepareStatement(select_sql);
		 pstmt.setInt(1,deptno);
		 rs = pstmt.executeQuery();
		 
		 
		 while (rs.next()) {
			JsonObject obj = new JsonObject();
			obj.addProperty("deptno", rs.getInt(1));
			obj.addProperty("dname", rs.getString(2));
			obj.addProperty("loc", rs.getString(3));
			array.add(obj);
		 }
		 
		 
	 } catch (Exception  se) {
		 se.printStackTrace();
	 } finally {
		 try {
			 if (rs !=null)
				 rs.close();
		 } catch (SQLException e) {
			 System.out.println(e.getMessage());
		 }
		 
		 try {
			 if (pstmt !=null)
				 pstmt.close();
		 } catch (SQLException e) {
			 System.out.println(e.getMessage());
		 }
		 
		 try {
			 if (con != null)
				 con.close();
		 } catch (Exception e) {
			 System.out.println(e.getMessage());
		 }
	 }//finally end
	 return array;
}



}//DAO end
