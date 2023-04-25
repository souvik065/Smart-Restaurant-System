using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for OrderMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class OrderMasterWebService : System.Web.Services.WebService
{

    public OrderMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string OrderMasterInsert( Int32 TableID, Int32 BillAmt, String PaymentMode, String rzpPaymentID, String rzpOrderID, String rzpSignature)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
                con.Open();

                SqlCommand cmd = new SqlCommand("OrderMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@BillAmt", BillAmt).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@PaymentMode", PaymentMode).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@rzpPaymentID", rzpPaymentID).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@rzpOrderID", rzpOrderID).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@rzpSignature", rzpSignature).DbType = DbType.String;


                msg = cmd.ExecuteScalar().ToString();
                cmd.Dispose();

               

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

    [WebMethod]
    public string UpdatePaymentStatus(Int32 TableID, Boolean PaymentStatus, String PaymentMode)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("UpdatePaymentStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus).DbType = DbType.Boolean;
            cmd.Parameters.AddWithValue("@PaymentMode", PaymentMode).DbType = DbType.String;


            cmd.ExecuteNonQuery();
            cmd.Dispose();
            msg = "Payemnt Successfully";


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



    [WebMethod] //-- Executing SubCategory GET/Read Function --// 
    public string OrderMasterGet(Int32 TableID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("OrderMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
        return GetDataWithoutPaging(cmd).GetXml();
    }


    [WebMethod] //-- Executing SubCategory GET/Read Function --// 
    public string ListAllCashPayments()
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("ListAllCashPayments", con);
        cmd.CommandType = CommandType.StoredProcedure;
        return GetDataWithoutPaging(cmd).GetXml();
    }



    [WebMethod]
    public string GetLatestOrderNo(Int32 TableNo)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("LatestOrderNo", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TableNo", TableNo).DbType = DbType.Int32;
        return GetDataWithoutPaging(cmd).GetXml();
    }

    public DataSet GetDataWithoutPaging(SqlCommand cmd)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        DataSet ds = new DataSet();
        try
        {
            con.Open();

            using (SqlDataAdapter adp = new SqlDataAdapter())
            {
                cmd.Connection = con;
                adp.SelectCommand = cmd;
                adp.Fill(ds, "DataDetails");


            }
            con.Close();


        }
        catch (Exception Exe)
        {


        }
        finally
        {

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        return ds;

    }


}
