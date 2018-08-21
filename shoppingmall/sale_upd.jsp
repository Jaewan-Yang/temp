<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	try {
		session = request.getSession();
		String id = request.getParameter("id");
		int qty = Integer.parseInt(request.getParameter("quantity"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		
		String go = request.getParameter("go");
		String ca = "";
		String pn = "";

		if (request.getParameter("cat") != null)
			if (!(request.getParameter("cat").equals("")))
				ca = request.getParameter("cat");

		if (request.getParameter("pname") != null)
			if (!(request.getParameter("pname").equals("")))
				pn = request.getParameter("pname");

		if (qty == 0)
			session.removeValue(id);
		else if (qty > stock) {
			session.putValue(id, new Integer(stock));
		} else
			session.putValue(id, new Integer(qty));

		response.sendRedirect("sale_list.jsp?go=" + go + "&cat=" + ca + "&pname=" + pn);

	} catch (Exception e) {
		out.println(e);
	}
%>
