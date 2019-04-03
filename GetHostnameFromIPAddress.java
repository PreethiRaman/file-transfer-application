 
package alg;

 
import java.net.InetAddress;
import java.net.UnknownHostException;

public class GetHostnameFromIPAddress 
{	
    public String GetHost(String ip)
    {
        String temp="";
        try
        {
            InetAddress inetAddr = InetAddress.getByName(ip);

            String hostname = inetAddr.getHostName();
            if(!ip.equalsIgnoreCase(hostname))
                temp=hostname;
        }
        catch (UnknownHostException e) 
        {
            System.out.println(e.getMessage());
        }
        return temp;
    }

}