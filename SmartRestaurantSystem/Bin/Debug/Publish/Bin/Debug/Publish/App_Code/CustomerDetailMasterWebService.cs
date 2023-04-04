using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for CustomerDetailMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CustomerDetailMasterWebService : System.Web.Services.WebService
{

    public CustomerDetailMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string CustomerDetailMasterInsert(String CustomerName, String Email, String MobileNo)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
                con.Open();

                SqlCommand cmd = new SqlCommand("CustomerDetailMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustomerName", CustomerName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Email", Email).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@MobileNo", MobileNo).DbType = DbType.String;

                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            

        }
        catch (Exception Exe)
        {
            msg = "error" + Exe.Message;

        }
        finally
        {

        }
        return msg;
    }
}
