package _6.getJSON;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/get_array_lib")
public class Get_array_lib extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		JsonObject json = new JsonObject();
		json.addProperty("name","홍길동");
		
		JsonObject json2 = new JsonObject();
		json2.addProperty("name","이순신");
		
		JsonArray array = new JsonArray();
		array.add(json);
		array.add(json2);
		
		System.out.println(array);
		response.getWriter().print(array);
	}
}
