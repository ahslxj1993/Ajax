package ex2_insert_gson_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

@WebServlet("/servlet_gson.bo")
public class ServletGo2 extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet (HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		DAO dao = new DAO ();
		JsonArray array = dao.getList();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(array);
		System.out.println(array);
	}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		VO vo = new VO();
		vo.setName(request.getParameter("name"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setMaker(request.getParameter("maker"));
		DAO dao = new DAO();
		int result = dao.insert(vo);
		if(result==1) {
			System.out.println("»ðÀÔ ¼º°ø");
		} else {
			System.out.println("»ðÀÔ ½ÇÆÐ");
		}
		
		doGet(request, response);
	}

}
