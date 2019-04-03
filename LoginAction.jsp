 
<%
    String a=request.getParameter("Name");
    String b=request.getParameter("Password");
    
    System.out.println(a);
    System.out.println(b);
     
    if(a.equalsIgnoreCase("admin")&&b.equalsIgnoreCase("admin"))
    {
        session.setAttribute("admin", "admin");
        out.println("<script>alert('Welcome "+a+"')</script>");
        RequestDispatcher rd=request.getRequestDispatcher("Admin-Home.jsp");
        rd.include(request, response);
    }
    else
    {
        out.println("<script>alert('Sorry Invalid User Name or Password')</script>");
        RequestDispatcher rd=request.getRequestDispatcher("ALogin.jsp");
        rd.include(request, response);
    }
%>
