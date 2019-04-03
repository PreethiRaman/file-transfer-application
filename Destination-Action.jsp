 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Cons.Connectivity"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="filetransfer.Receiver"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%
    try
    {
        String userid=session.getAttribute("userid").toString();
    }
    catch(Exception ex)
    {
        response.sendRedirect("Error-Page.jsp");
    }
%>
<%
    String filename=request.getParameter("filename");
    String key=request.getParameter("key");
    String PORT=request.getParameter("Port");
    String IP=request.getParameter("IP");
    System.out.println(filename+"    "+key+"   "+PORT+"  ="+IP);
    File ss = new File("C:\\Temp");
    if (!ss.exists()) {
        ss.mkdir();
    }
    String fileLocation = "C:\\Temp\\temp_log.txt";
    Receiver rr = new Receiver();
    rr.receiveFile(IP, Integer.parseInt(PORT), fileLocation);

    String txtFilePath = fileLocation;
    BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
    StringBuilder sb = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        sb.append(line).append("\n");
    }
    InetAddress inetAddr = InetAddress.getLocalHost();
    String current_name = inetAddr.getHostName();
    String current_ip = inetAddr.getHostAddress();

    String val = sb.toString();
    System.out.println("David----->" + val);
    String receiver = val.substring(val.lastIndexOf("receiver122333"), val.lastIndexOf(" ~~~~"));
    String receiver_ip = receiver.substring(0, receiver.lastIndexOf("/")).replace("receiver122333", "").replace(" ~~~~", "");
    String receiver_name = receiver.substring(receiver.lastIndexOf("/") + 1, receiver.length()).replace("receiver122333", "").replace(" ~~~~", "");

    String fullString = val.substring(0, val.lastIndexOf("receiver122333"));
    String temp = val.substring(val.lastIndexOf("~~~~"), val.length());

    String port = temp.substring(0, temp.indexOf("key1")).replace("~~~~", "");
    String key1 = temp.substring(temp.indexOf("key1"),temp.length()).replace("key1", "");
    System.out.println("KEY1 is =============="+key1);
    File folder = new File("C:\\File_Download");
    if (!folder.exists()) {
        folder.mkdir();
    }
    String am_pm;
    SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
    Calendar c = Calendar.getInstance();
    String start = "";
    start = format.format(c.getTime());
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
    InetAddress ip = InetAddress.getLocalHost();
    System.out.println("Current IP  " + current_ip);
    System.out.println("Receiver IP  " + receiver_ip);
    StringBuilder status=new StringBuilder();
    Connection con = new Connectivity().Connectivity();
    String msg="";
    if (current_ip.trim().equalsIgnoreCase(receiver_ip.trim())) {
        System.out.println("working current ip");
        if (port.equalsIgnoreCase((PORT))) {
            System.out.println("port is matching");
            if ((key1.trim() + "").equalsIgnoreCase(key.trim())) {
                System.out.println("key is matching");
                FileOutputStream files = new FileOutputStream("C:\\File_Download\\" + filename + ".txt");
                DataOutputStream out1 = new DataOutputStream(files); {
                    out1.write(fullString.getBytes());
                    out1.flush();
                    out1.close();
                }
                try{
                    System.out.println(receiver_name+" Receiver Name");
                    PreparedStatement up = con.prepareStatement("insert into file_logs(file_name,sender_ip,sender_port,receiver_name,receiver_ip,details,time,date,attacker_name,attacker_ip)"
                            + "values('" + filename + "','" + IP + "','" + PORT + "','" + receiver_name + "','" + receiver_ip + "','All Verification OK','" + Time + "','" + date + "','---','---')");
                    up.executeUpdate();
                    System.out.println("Sucess upadted");
                    out.print("<script>alert('Please Check C:\\File_Download\\" + filename + "');</script>");
                    status.append("Current System IP Address  : ").append(ip.getHostAddress()).append("  Date - Time :").append(date).append(" - ").append(Time).append(" Status : Success (File Downloaded at C:\\File_Download\\").append(filename).append(".txt)").append("\n");
                    msg="Please Check C:\\File_Download\\" + filename + ".txt";
                }catch(Exception ex){System.out.println("Error   "+ex);}
                System.out.println(msg);
            } else {
                PreparedStatement up = con.prepareStatement("insert into file_logs(file_name,sender_ip,sender_port,receiver_name,receiver_ip,details,time,date,attacker_name,attacker_ip)"
                        + "values('" + filename + "','" + IP + "','" + PORT + "','" + receiver_name + "','" + receiver_ip + "','Secret Key Did Not Matched','" + Time + "','" + date + "','" + current_name + "','" + current_ip + "')");
                up.executeUpdate();
                out.print("<script>alert('Secret Key Did Not Matched');</script>");
                msg="Secret Key Did Not Matched";
                status.append("Current System IP Address  : ").append(ip.getHostAddress()).append("  Date - Time :").append(date).append(" - ").append(Time).append(" Status : Failed (IP Spoofing Attack)").append("\n");
                System.out.println(msg);
            }
        } else {
            PreparedStatement up = con.prepareStatement("insert into file_logs(file_name,sender_ip,sender_port,receiver_name,receiver_ip,details,time,date,attacker_name,attacker_ip)"
                    + "values('" + filename + "','" + IP + "','" + PORT + "','" + receiver_name + "','" + receiver_ip + "','Port Number or IP Address Failed','" + Time + "','" + date + "','" + current_name + "','" + current_ip + "')");
            up.executeUpdate();

            msg="IP or PORT Number Did Not Matched";
            out.print("<script>alert('IP or Port Number is Did Not Matched');</script>");
            status.append("Current System IP Address  : ").append(ip.getHostAddress()).append("  Date - Time :").append(date).append(" - ").append(Time).append(" Status : Failed (IP Spoofing Attack)").append("\n");
            System.out.println(msg);
        }
    } else {
        PreparedStatement up = con.prepareStatement("insert into file_logs(file_name,sender_ip,sender_port,receiver_name,receiver_ip,details,time,date,attacker_name,attacker_ip)"
                + "values('" + filename + "','" + IP + "','" + PORT + "','" + receiver_name + "','" + receiver_ip + "','File is Attacked by hacker','" + Time + "','" + date + "','" + current_name + "','" + current_ip + "')");
        up.executeUpdate();
//        new Destination().play();
        out.print("<script>alert('Your are UnAuthorized Person');</script>");
        status.append("Current System IP Address  : ").append(ip.getHostAddress()).append("  Date - Time :").append(date).append(" - ").append(Time).append(" Status : Failed (IP Spoofing Attack)").append("\n");
        msg= current_name + " is UnAuthorized Person";
        System.out.println(msg);
                //System.out.println("Your are UnAuthorized Person (Attacker)" +current_ip+"/"+current_name+"("+receiver_ip+"/"+receiver_name+")");

    }
    RequestDispatcher rd=request.getRequestDispatcher("Destination.jsp");
    rd.include(request,response);
%>

