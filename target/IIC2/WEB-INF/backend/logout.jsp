<%
    session.removeAttribute("name");
    session.removeAttribute("surname");
    session.removeAttribute("group");

    request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
%>