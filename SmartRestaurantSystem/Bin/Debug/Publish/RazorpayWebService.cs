using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for RazorpayWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class RazorpayWebService : System.Web.Services.WebService {

    public RazorpayWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod(EnableSession = true)]
    public Dictionary<string, object> InitiatePayment()
    {
        Dictionary<string, object> customerInfo = new Dictionary<string, object>();
        SqlConnection conn = new SqlConnection(Global.StrCon);

        try
        {
            SqlCommand cmd = new SqlCommand("CartDetailTotal", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RegistrationID", HttpContext.Current.Session["RegistrationID"]).DbType = DbType.Int64;
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
                    customerInfo.Add("CustomerName", ds.Tables[0].Rows[0]["Name"].ToString());
                    customerInfo.Add("MobileNo", ds.Tables[0].Rows[0]["MobileNo"].ToString());
                    customerInfo.Add("EmailID", ds.Tables[0].Rows[0]["EmailID"].ToString());
                
                
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

    [WebMethod(EnableSession = true)]
    public Dictionary<string, object> InitiateDistributorPayment()
    {
        Dictionary<string, object> customerInfo = new Dictionary<string, object>();
        SqlConnection conn = new SqlConnection(Global.StrCon);

        try
        {
            SqlCommand cmd = new SqlCommand("DistributorCartDetailTotal", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DistributorID", HttpContext.Current.Session["DistributorID"]).DbType = DbType.Int32;
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
                customerInfo.Add("CustomerName", ds.Tables[0].Rows[0]["PersonName"].ToString());
                customerInfo.Add("MobileNo", ds.Tables[0].Rows[0]["MobileNo"].ToString());
                customerInfo.Add("EmailID", ds.Tables[0].Rows[0]["EmailID"].ToString());


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

    [WebMethod(EnableSession = true)]
    public Dictionary<string, object> InitiatePendingPayment(string PaymentAmount)
    {
        Dictionary<string, object> customerInfo = new Dictionary<string, object>();
        SqlConnection conn = new SqlConnection(Global.StrCon);

        try
        {
            SqlCommand cmd = new SqlCommand("DistributorMasterGet", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DistributorID", HttpContext.Current.Session["DistributorID"]).DbType = DbType.Int32;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                RazorpayClient client = new RazorpayClient(Global.APIKey, Global.APISecretKey);
                Guid guid = Guid.NewGuid();
                var Total = PaymentAmount;

                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("amount", Convert.ToInt64(Convert.ToInt64(Total) * 100)); // amount in the smallest currency unit
                options.Add("receipt", guid);
                options.Add("currency", "INR");
                Order order = client.Order.Create(options);

                customerInfo.Add("Msg", "success");
                customerInfo.Add("OrderID", Convert.ToString(order["id"]));
                customerInfo.Add("CustomerName", ds.Tables[0].Rows[0]["PersonName"].ToString());
                customerInfo.Add("MobileNo", ds.Tables[0].Rows[0]["MobileNo"].ToString());
                customerInfo.Add("EmailID", ds.Tables[0].Rows[0]["EmailID"].ToString());
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
