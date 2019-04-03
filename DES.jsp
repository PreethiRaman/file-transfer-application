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
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="alg.GetHostnameFromIPAddress"%>
<%@page import="alg.ShowIP"%>
<%@page import="alg.DES"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Encryption</title>
    </head>
    <body>
        <h1 align="center">View Upload Files &emsp; <a href="Admin-Home.jsp">Click to Back</a></h1>

        <div style="position: relative;">
            <%
                Random r = new Random();
                int s = r.nextInt(9);
                int port1 = 2000 + s;
                String alltext = "";
                String path = (String) session.getAttribute("path");
                try {
                    DES c = new DES();
                    BufferedReader reader = new BufferedReader(new FileReader(path));
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) {
                        sb.append(c.cipher("12345678", line)).append("\n");
                    }
                    alltext = sb.toString();
                } catch (IOException ex) {
                } catch (Exception ex) {
                }

                //Get Available all Ip address (From local area network)
                ShowIP IP = new ShowIP();
                String temp[] = IP.getallIP().split("\n");
                GetHostnameFromIPAddress d = new GetHostnameFromIPAddress();
                LinkedHashSet<String> val = new LinkedHashSet();
                for (String temp1 : temp) {
                    String host = d.GetHost(temp1.trim()).trim();
                    String ips = temp1.trim();
                    if (!host.isEmpty()) {
                        val.add(ips + " / " + host);
                    }

                }
                InetAddress ip = null;
                try {
                    ip = InetAddress.getLocalHost();
                } catch (UnknownHostException ex) {
                    System.out.println(ex);
                }
                String temps=ip.toString().trim();
                String arr[]=temps.split("/");
                if(arr[0].startsWith("192."))
                {
                    
                }
                else
                {
                    String ex=arr[0];
                    arr[0]=arr[1];
                    arr[1]=ex;
                }
                val.add(arr[0]+" / "+arr[1]);
                System.out.println("this is ip   " +arr[0]+"  ip "+arr[1]);
                System.out.println(val+" =======");
            %>
            <p align="center">
                <textarea style="margin: 0px;height: 353px;width: 1193px;padding-left: 25px;color: wheat;font-size: 13px;border-style: groove;border-color: black;border-radius: 0px;background: navy;"><%=alltext%></textarea>
            </p>
            <form action="Before-Send.jsp">
                <p align="center">
                    <input type="text" name="secretkey" required="" placeholder="Enter Your Secret Key" style="width: 18.5%;height: 25px;border-color: green;padding-left: 10px;color: navy;font-weight: bold;">
                    <input type="text" name="port" value="<%=port1%>" readonly style="width: 10.5%;height: 25px;border-color: green;padding-left: 10px;color: navy;font-weight: bold;">
                </p>
                <script type="text/javascript">
                    function getIP()
                    {
                        var val = document.getElementById("IPGET").value;
                        var str = val.split("/");
                        document.getElementById("ip").value = str[0];
                        document.getElementById("name").value = str[1];
                    }
                </script>
                <p align="center">
                    <select name="ipadd" required="" onchange="getIP()" id="IPGET" style="width: 19%;height: 27px;border-color: green;padding-left: 10px;color: navy;font-weight: bold;">
                        <option hidden="" selected="" value="">Select Destination IP</option>
                        <%
                            Iterator get = val.iterator();
                            while (get.hasNext()) {
                        %>
                        <option><%=get.next().toString()%></option>
                        <%
                            }
                        %>
                    </select>
                </p>
                <p align="center">
                    <input type="text" id="ip" readonly="" placeholder="Selected IP" style="width: 10%;height: 25px;border-color: green;padding-left: 10px;color: navy;font-weight: bold;">
                    <input type="text" id="name" readonly="" placeholder="Selected Name" style="width: 10%;height: 25px;border-color: green;padding-left: 10px;color: navy;font-weight: bold;">
                </p>
                <p align="center">
                    <input type="submit"  value="Send File to Destination" style="width: 13%;height: 36px;background: crimson;border-color: green;color: white;font-weight: bold;">
                </p>
            </form>
        </div>
    </body>
</html>
