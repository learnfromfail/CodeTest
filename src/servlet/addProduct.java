package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductionSeviceImpl;

public class addProduct extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("this succcess");
		String name = request.getParameter("productName");
		float price = Float.parseFloat(  request.getParameter("price")) ;
		String category = request.getParameter("select");
		//Student student  = new Student(no,name,age,address) ;
		
		String sql = "insert into t_product(name, category, price) values(?,?,?)";
		Object[] params = {name,category,price};
		ProductionSeviceImpl.executeUpdate(sql, params);
		
		request.setAttribute("productList", ProductionSeviceImpl.queryAllproduct());
		request.getRequestDispatcher( "manipulatePage.jsp").forward(request, response);
		//response.sendRedirect("manipulatePage.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
