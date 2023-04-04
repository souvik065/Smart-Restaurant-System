using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using Razorpay.Api;
using System.Net;

/// <summary>
/// Summary description for RazorPayWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class RazorPayWebService : System.Web.Services.WebService
{

    public RazorPayWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]
    public Dictionary<string, object> InitiatePayment(Int32 TableID)
    {
        Dictionary<string, object> customerInfo = new Dictionary<string, object>();
        SqlConnection conn = new SqlConnection(Global.StrCon);

        try
        {
            SqlCommand cmd = new SqlCommand("CartDetailTotal", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                RazorpayClient client = new RazorpayClient(Global.APIKey, Global.APISecretKey);
                Guid guid = Guid.NewGuid();
                var Total = ds.Tables[0].Rows[0]["Total"];
                Session.Remove("Total");
                HttpContext.Current.Session["Total"] = ds.Tables[0].Rows[0]["Total"];

                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("amount", Convert.ToInt64(Convert.ToInt64(Total) * 100)); // amount in the smallest currency unit
                options.Add("receipt", guid);
                options.Add("currency", "INR");
                Order order = client.Order.Create(options);

                customerInfo.Add("Msg", "success");
                customerInfo.Add("OrderID", Convert.ToString(order["id"]));
                customerInfo.Add("CustomerName", ds.Tables[0].Rows[0]["CustomerName"].ToString());
                customerInfo.Add("MobileNo", ds.Tables[0].Rows[0]["MobileNo"].ToString());
                customerInfo.Add("Email", ds.Tables[0].Rows[0]["Email"].ToString());


            }
            else
            {
                customerInfo.Add("Msg", "Cart Empty");
            }
        }
        catch (Exception ex)
        {
            customerInfo.Add("Msg", "error " + ex.Message);
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return customerInfo;
    }

}
