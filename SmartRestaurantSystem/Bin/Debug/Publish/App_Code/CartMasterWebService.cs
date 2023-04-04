using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for CartMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CartMasterWebService : System.Web.Services.WebService
{

    public CartMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string CartMasterInsert(Int32 DishID, Int32 TableID, Int32 MeasureTypeID)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("CartMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@MeasureTypeID", MeasureTypeID).DbType = DbType.Int32;

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



    [WebMethod]
    public string UpdateQty(Int32 CartID, Int32 Qty)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("CartMasterUpdateQty", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CartID", CartID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@Qty", Qty).DbType = DbType.Int32;
           

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



    [WebMethod]
    public string CartMasterDelete(Int32 CartID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (CartID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("CartMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", CartID).DbType = DbType.Int32;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                con.Close();


            }

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
        return msg;

    }


    [WebMethod]
    public string CartMasterDeleteAll(Int32 TableID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (TableID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("CartMasterDeleteAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                con.Close();
                msg = "Record Deleted successfully";

            }

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
        return msg;

    }



    [WebMethod] //-- Executing Cart Master GET/Read Function --// 
    public string CartMasterGet(Int32 TableID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("CartMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
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
