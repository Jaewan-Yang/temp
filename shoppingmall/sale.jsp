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

		String ca = "";
		String pn = "";

		if (request.getParameter("cat") != null)
			if (!(request.getParameter("cat").equals("")))
				ca = request.getParameter("cat");

		if (request.getParameter("pname") != null)
			if (!(request.getParameter("pname").equals("")))
				pn = request.getParameter("pname");

		String[] a = session.getValueNames();

		for (int i = 0; i < a.length; i++) {
			if (id.equals(a[i])) {
				int old = ((Integer) session.getValue(id)).intValue();
				qty = qty + old;
			}
		}

		if(qty > stock) {
			out.println("<center>재고가 부족합니다. 주문수량을 확인해주세요");
			out.print("[<A href=\"shop_list.jsp?go=" + request.getParameter("go"));
			out.print("&cat=" + ca + "&pname=" + pn + "\">돌아가기</A>]");
		} else {
			session.putValue(id, new Integer(qty));
			out.println("<center>바구니에 넣었습니다.");
			out.print("[<A href=\"shop_list.jsp?go=" + request.getParameter("go"));
			out.print("&cat=" + ca + "&pname=" + pn + "\">계속 쇼핑하기</A>]");
			out.print("[<A href=\"sale_list.jsp?go=" + request.getParameter("go"));
			out.print("&cat=" + ca + "&pname=" + pn + "\">장바구니 보기</A>]");
		}
	} catch (Exception e) {
		out.println(e);
	}
%>
