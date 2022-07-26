package _4.getJSON;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/get_name")
public class Get_name extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet (HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String dbq ="\"";
		String Message = "{" + dbq +"name"+ dbq + ":" + dbq + "ȫ�浿" + dbq + "}";
		System.out.println(Message);
		response.getWriter().print(Message);
	}
}
