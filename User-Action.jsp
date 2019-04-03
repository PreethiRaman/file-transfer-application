 
 <%@include file="DB1.jsp"%>
<%
    int a=0;
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    
    PreparedStatement query=con.prepareStatement("select * from register where user_name='"+username+"' and password='"+password+"' and profile='Active' ");
    ResultSet rs=query.executeQuery();
    
    if(!password.contains("select*from")&&!password.contains("select")&&!password.contains("query"))
    {
    if(rs.next())
    {
             PreparedStatement q=con.prepareStatement("update register set status='0',profile='Active' where user_name='"+username+"' ");
             q.executeUpdate();
        session.setAttribute("userid", rs.getString("id"));
        session.setAttribute("username", rs.getString("user_name"));
        session.setAttribute("usermail", rs.getString("email"));
        out.println("<script>alert('Welcome "+username+"')</script>");
        RequestDispatcher rd=request.getRequestDispatcher("User-Home.jsp");
        rd.include(request, response);
    }
    else
    {
        System.out.println("+++++++++++++++++++++++++++++++++++++");
        int rank;
        PreparedStatement qu=con.prepareStatement("select * from register where user_name='"+username+"'||password='"+password+"'  ");
        System.out.println("+++++++++++++++++++++++++++++++++++++"+username);
        ResultSet rs1=qu.executeQuery();
        if(rs1.next())
        {
             System.out.println("+++++++++++++++++++++++++++++++++++++"+username);
             rank = rs1.getInt("status");
             rank=rank+1;
             PreparedStatement q=con.prepareStatement("update register set status='"+rank+"' where user_name='"+username+"' ");
             q.executeUpdate();
             if(rank>=3)
             {
                     out.println("<script>alert('Your Account is  Blocked')</script>");
                     PreparedStatement que=con.prepareStatement("update register set profile='block' where user_name='"+username+"' ");
                     que.executeUpdate();
                     RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
                     rd.include(request, response);
             }
             else
             {
                  out.println("<script>alert('Sorry Invalid  Password')</script>");
             RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
             rd.include(request, response);
             }
            
            
        }
        else
        {
              
             out.println("<script>alert('Sorry Invalid User Name or Password')</script>");
             RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
             rd.include(request, response);
        }
       
    }
    }
    else
    {
        out.println("<script>alert('You have tried SQL Injection')</script>");
        RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
        rd.include(request, response);
    }
  
%>
