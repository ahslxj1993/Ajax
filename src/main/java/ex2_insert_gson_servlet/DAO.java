package ex2_insert_gson_servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
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


public JsonArray getList() {
	 Connection con = null;
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 JsonArray array = new JsonArray();
	 
	 try {
		 con = ds.getConnection();
		 
		 String select_sql = "select * from products order by id";
		 
		 //PreparedStatement 객체 얻기
		 pstmt = con.prepareStatement(select_sql);
		 rs = pstmt.executeQuery();
		 
		 
		 while (rs.next()) {
			JsonObject obj = new JsonObject();
			obj.addProperty("id", rs.getInt(1));
			obj.addProperty("name", rs.getString(2));
			obj.addProperty("price", rs.getInt(3));
			obj.addProperty("maker", rs.getString(4));
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


public int insert(VO vo) {
	 Connection con = null;
	 PreparedStatement pstmt = null;
	 
	 int result =0; //초기값
	 try {
		 con = ds.getConnection();
		 
		 String insert_sql = "INSERT INTO products "
		 					+ "	VALUES ("
		 					+ "			(select nvl(max(id),0)+1 from products), ?, ?, ?)";
		 
		 //PreparedStatement 객체 얻기
		 pstmt = con.prepareStatement(insert_sql);
		 pstmt.setString(1, vo.getName());
		 pstmt.setInt(2, vo.getPrice());
		 pstmt.setString(3, vo.getMaker());
		 result = pstmt.executeUpdate();
		 
	 } catch (Exception  se) {
		 se.printStackTrace();
	 } finally {
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
	return result;
}


}//DAO end
