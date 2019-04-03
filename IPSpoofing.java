/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alg;

/**
 *
 * @author David
 */
public class IPSpoofing
{
    public static void main(String args[])
    {
        int key1=321;
        int key2=532;
        int key3=353;
        int key4=754;
        String ip="192.168.1.9";
        String port="2004";
        if(ip.contains("192.168.1.9")||ip.contains("192.168.1.9"))
        {
            //Send Screte Key
            int count=0;
            int spoofingkeys[]=new int[4];
            spoofingkeys[0]=key1;
            spoofingkeys[1]=key2;
            spoofingkeys[2]=key3;
            spoofingkeys[3]=key4;
            count=spoofingkeys.length;
            //Receiver enter sender secrete key
            int r_keys[] ={321,443,353,1333};
        
            //It will Check keys
            int flag=0;
            
            for(int i=0;i<count;i++)
            {    
                if(r_keys[i] == spoofingkeys[i])
                {
                    flag++;
                }
            }
            if(flag == count)
            {
                //file can decryption then download
            }
            else
            {
                //this is ip spoofing attacks 
                //you can't download... failed
            }
        }
    }
}
