 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="DB.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%
        
            String a = request.getParameter("id");
            
            PreparedStatement query=con.prepareStatement("update register set status='0',profile='Active' where id='"+a+"' ");
            query.executeUpdate();
            out.println("<script>alert('Update Sucessfull')</script>");
            RequestDispatcher rd=request.getRequestDispatcher("Admin-Home.jsp");
            rd.include(request, response);
            
            
            
            
            
            
         %>
        
        
        
    
    </body>
</html>
