package service;

import java.util.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBManager;
import entity.product;

public class ProductionSeviceImpl {
	
	public static PreparedStatement pstmt = null ;
	public static Connection connection = null ;
	public static ResultSet rs = null ; 
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 return  DBManager.getConnection();
	}
	
	//Statement
	public static void closeAll(ResultSet rs,Statement stmt,Connection connection)
	{
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(connection!=null)connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public static ResultSet executeQuery( String sql ,Object[] params) {//select xxx from xx where name=? or id=?
		product thisProduct = null;
	
		List<product> productList = new ArrayList<>();
		try {
			pstmt = createPreParedStatement(sql,params);
			 rs =  pstmt.executeQuery() ;
			  return rs ;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null ; 
		} catch (SQLException e) {
			e.printStackTrace();
			return null ; 
		}catch (Exception e) {
			e.printStackTrace();
			return null ; 
		}
	}
	
	public static PreparedStatement createPreParedStatement(String sql,Object[] params) throws ClassNotFoundException, SQLException {
		  pstmt = getConnection() .prepareStatement( sql) ;
		  if(params!=null ) {
			  for(int i=0;i<params.length;i++) {
				  pstmt.setObject(i+1, params[i]);
			  }
		  }
		  return pstmt;
	}
	
	public static boolean executeUpdate(String sql,Object[] params) {
		try {  
			  pstmt = createPreParedStatement(sql,params);
			  int count = pstmt.executeUpdate() ;
			  if(count>0)
				  return true ;
			  else 
				  return false ;
			  
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			  return false ;
		} catch (SQLException e) {
			e.printStackTrace();
			  return false ;
		}catch (Exception e) {
			e.printStackTrace();
			return false ;
		}
		finally {
			closeAll(null,pstmt,connection);
		}
	}
	
	public static List<product> queryAllproduct() {//Get Products
		PreparedStatement pstmt = null ;
		product thisProduct = null;
		List<product> productList = new ArrayList<>();
		ResultSet rs = null ;
		try {
			String sql = "select * from t_product" ;
			 rs = ProductionSeviceImpl.executeQuery(sql, null) ;
			  while(rs.next()) {
				  String name =   rs.getString("name") ;
				  float price =   rs.getFloat("price");
				  String category =   rs.getString("category");
				  thisProduct = new product(name,price,category);
				  productList.add(thisProduct) ;
			  }
			  return productList ;
		} catch (SQLException e) {
			e.printStackTrace();
			return null ; 
		}catch (Exception e) {
			e.printStackTrace();
			return null ; 
		}
		finally {
			ProductionSeviceImpl.closeAll(rs, pstmt, ProductionSeviceImpl.connection);
		}
	}
	
}
