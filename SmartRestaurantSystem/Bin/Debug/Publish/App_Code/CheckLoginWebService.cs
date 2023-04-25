using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for AdminLoginWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CheckLoginWebService : System.Web.Services.WebService
{

    public CheckLoginWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]
    public string CheckLogin(String UserName, String Password, Int32 StaffTypeID)
    {


        string msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            SqlCommand cmd = new SqlCommand("CheckLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", UserName).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@Password", Password).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@StaffTypeID", StaffTypeID).DbType = DbType.Int32;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            cmd.Dispose();

            if (ds.Tables[0].Rows.Count > 0)
            {
                HttpContext.Current.Session["UserID"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                string userid = ds.Tables[0].Rows[0]["UserID"].ToString();
                HttpContext.Current.Session["StaffType"] = ds.Tables[0].Rows[0]["StaffType"].ToString();
                var stafftype = ds.Tables[0].Rows[0]["StaffType"].ToString();

                msg = "Valid";

            }
            else
            {

                msg = "Invalid";
            }


        }
        catch (Exception Exe)
        {

            msg = "error" + Exe.Message;

        }
        return msg;



    }


    [WebMethod(EnableSession = true)]
    public string Logout()
    {
        string msg = "";

        HttpContext.Current.Session.Abandon();
        HttpContext.Current.Session.Clear();

        msg = "Logout";
        return msg;
    }

}
