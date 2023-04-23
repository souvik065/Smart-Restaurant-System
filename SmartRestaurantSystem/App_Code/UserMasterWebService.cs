using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class UserMasterWebService : System.Web.Services.WebService
{

    public UserMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string UserMasterManage(Int32 UserID, String UserName, String Password, Int32 StaffTypeID, Int32 StaffID)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (UserID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("CreateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", UserName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Password", Password).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@StaffTypeID", StaffTypeID).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@StaffID", StaffID).DbType = DbType.String;


                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "User Created Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("UpdateUserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", UserID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@UserName", UserName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Password", Password).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@StaffTypeID", StaffTypeID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@StaffID", StaffID).DbType = DbType.Int32;

                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "User Detail Updated Successfully";


              

                con.Close();

            }

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


    [WebMethod] //-- Executing Category GET/Read Function --// 
    public string UserMasterGet(Int32 UserID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("UserMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", UserID).DbType = DbType.Int32;
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

    [WebMethod]
    public string UserMasterDelete(Int32 UserID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (UserID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("UserMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", UserID).DbType = DbType.Int32;
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

}
