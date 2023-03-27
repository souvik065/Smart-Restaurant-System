using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class charge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string paymentID = Request.Form["razorpay_payment_id"];
            string orderID = Request.Form["razorpay_order_id"];
            string sign = Request.Form["razorpay_signature"];
            string cartorderid = Request.Form["OrderID"];
            Dictionary<string, string> input = new Dictionary<string, string>();

            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            RazorpayClient client = new RazorpayClient(Global.APIKey, Global.APISecretKey);

            input.Add("razorpay_payment_id", paymentID);
            input.Add("razorpay_order_id", orderID);
            input.Add("razorpay_signature", sign);

            Console.WriteLine(paymentID);
            Utils.verifyPaymentSignature(input);

            Response.Redirect("PaymentSuccess.aspx",false);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            Response.Write(ex.Message);
        }
    }
}