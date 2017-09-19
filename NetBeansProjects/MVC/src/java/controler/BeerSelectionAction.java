/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeerExpert;

public class BeerSelectionAction extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String c = request.getParameter("color");
		
		BeerExpert be = new BeerExpert();
		List<String> res = be.getBrands(c);
		request.setAttribute("beers", res);
		RequestDispatcher view = request.getRequestDispatcher("result.jsp");
		view.forward(request, response);
	}

}