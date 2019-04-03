 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DB.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: aliceblue">
        <h1 align="center">View All File Status</h1>
        <table border="1" cellspacing="2" align="center" style="width: 80%;font-family: cursive;text-align: center;background: beige;border-collapse: collapse;color: navy;line-height: 30px;text-transform: capitalize;">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>File Name</th>
                    <th>Sender IP</th>
                    <th>Sender Port</th>
                    <th>Receiver Name</th>
                    <th>Receiver IP</th>
                    <th>Details</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Attacker Name</th>
                    <th>Attacker IP</th>
                </tr>
            </thead>
            <tbody>
            <%
                PreparedStatement query=con.prepareStatement("select * from file_logs");
                ResultSet rs=query.executeQuery();
                while(rs.next())
                {
                    %>
                    <tr style="background: black;color: white;">
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("file_name")%></td>
                        <td><%=rs.getString("sender_ip")%></td>
                        <td><%=rs.getString("sender_port")%></td>
                        <td><%=rs.getString("receiver_name")%></td>
                        <td><%=rs.getString("receiver_ip")%></td>
                        <td><%=rs.getString("details")%></td>
                        <td><%=rs.getString("date")%></td>
                        <td><%=rs.getString("time")%></td>
                        <td><%=rs.getString("attacker_name")%></td>
                        <td><%=rs.getString("attacker_ip")%></td>
                      
                    </tr>
                    <%
                }
            %>
            </tbody>
        </table>
        <p align="center"><a href="Admin-Home.jsp" style="font-size: 20px;">Admin Home</a></p>
    </body>
</html>