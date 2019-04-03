<%-- 
    Document   : Before-Send
    Created on : Jan 31, 2019, 12:17:10 AM
    Author     : David
--%>
<%
    try
    {
        String admin=session.getAttribute("admin").toString();
    }
    catch(Exception ex)
    {
        response.sendRedirect("Error-Page.jsp");
    }
%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="filetransfer.Sender"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Calendar"%>
<%@page import="Cons.Connectivity"%>
<%
    String am_pm;
    java.text.DateFormat df = new java.text.SimpleDateFormat("dd-MMM-yyyy");
    Calendar cal = Calendar.getInstance();
    java.text.DateFormat tim = new java.text.SimpleDateFormat("HH:mm:ss");
    Calendar cal2 = Calendar.getInstance();
    if (cal2.get(Calendar.AM_PM) == 0) {
        am_pm = "AM";
    } else {
        am_pm = "PM";
    }

    String date = df.format(cal.getTime());
    String st = tim.format(cal2.getTime());
    String Time = st + " " + am_pm;
    System.out.println("Date : " + date + "       Time :  " + Time);
    InetAddress ip = null;
    try {
        ip = InetAddress.getLocalHost();
    } catch (UnknownHostException ex) {
        System.out.println(ex);
    }
    try {
        String FilePath=(String)session.getAttribute("path");
        int key=Integer.parseInt(request.getParameter("secretkey"));
        int port=Integer.parseInt(request.getParameter("port"));
        String receiver = request.getParameter("ipadd");
        System.out.println("Path = "+FilePath+" key= "+key+"  port= "+port+" receiver= "+receiver);
        Sender s = new Sender();
        int flag = s.send(port, FilePath, key, receiver);
        String fn = FilePath.substring(FilePath.lastIndexOf("\\") + 1, FilePath.length());
        Connection con = new Connectivity().con;
        {
//            PreparedStatement up = con.prepareStatement("insert into file_logs(file,sender_ip,port_number,time,date,status,details)"
//                    + "values('" + fn + "','" + ip.getHostAddress() + "','" + port + "','" + Time + "','" + date + "','Success','Key Didn't Match')");
//            up.executeUpdate();
        }

        if (flag == 1) {
            PreparedStatement up = con.prepareStatement("insert into file_logs(file,sender_ip,port_number,time,date,status)"
                    + "values('" + fn + "','" + ip.getHostAddress() + "','" + port + "','" + Time + "','" + date + "','Success')");
            up.executeUpdate();
        } else {
            PreparedStatement up = con.prepareStatement("insert into file_logs(file,sender_ip,port_number,time,date,status)"
                    + "values('" + fn + "','" + ip.getHostAddress() + "','" + port + "','" + Time + "','" + date + "','Failed')");
            up.executeUpdate();
        }
    } catch (Exception ex) {
       System.out.println(ex);
    }
    
    out.println("<script>alert('File Sent to Destination');</script>");
    RequestDispatcher rd=request.getRequestDispatcher("DES.jsp");
    rd.include(request,response);
%>