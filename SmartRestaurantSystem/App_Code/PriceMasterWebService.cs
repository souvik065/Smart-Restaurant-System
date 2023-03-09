using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for PriceMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class PriceMasterWebService : System.Web.Services.WebService
{

    public PriceMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string PriceMasterInsert(Int32 DishID, Int32 MeasureTypeID, String Price)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {

            con.Open();

            SqlCommand cmd = new SqlCommand("PriceMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@MeasureTypeID", MeasureTypeID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@Price", Price).DbType = DbType.String;

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
