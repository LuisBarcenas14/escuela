<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">Beer Recommender System</h1>
        
	<p align="center">Color of beer: <%out.print(request.getParameter("color"));%> </p>
	
        <table align="center" border="1px solid black"> 
		<%
			List<String> styles = (List<String>) request.getAttribute("beers");
			Iterator<String> iter = styles.iterator();
                        
			while (iter.hasNext()) {
				out.print("<tr><td>" + iter.next()+"<td></tr>");
			}
		%>
        </table>
</body>
</html>