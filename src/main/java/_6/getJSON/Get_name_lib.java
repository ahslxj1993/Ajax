package _6.getJSON;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

@WebServlet("/get_name_lib")
public class Get_name_lib extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		JsonObject json = new JsonObject();
		json.addProperty("name","ȫ�浿2");
		
		System.out.println(json);
		response.getWriter().print(json);
	}

}
