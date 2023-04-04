using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class ClientMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //IPHostEntry host;
        //host = Dns.GetHostEntry(Dns.GetHostName());
        //string localIP = "";


        //foreach (IPAddress ip in host.AddressList)
        //{
        //    if (ip.AddressFamily.ToString() == "InterNetwork")
        //    {
        //        localIP = ip.ToString();
        //        Session["DeviceIP"] = localIP;
        //    }

        //}

        GetIp();


    }



    public string GetIp()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }
        Session["DeviceIP"] = context.Request.ServerVariables["REMOTE_ADDR"];
        return context.Request.ServerVariables["REMOTE_ADDR"];


    }
}
