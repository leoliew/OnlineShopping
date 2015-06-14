package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ITypesDao;
import com.daoImpl.TypeDaoImpl;
import com.vo.Types;

public class TypeServlet extends HttpServlet {
	private ITypesDao typedaDao;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) {
			String method=request.getParameter("method");
			try {
				if(method.equals("findTypes")){
					findTypes(request,response);
				}
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

//查询所有的食品类型
	private void findTypes(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		typedaDao=new TypeDaoImpl();
		 List<Types> types= typedaDao.findAllTypes();
		request.setAttribute("types",types);
		request.getRequestDispatcher("/index.jsp?show=add").forward(request, response);
		
	}

}
