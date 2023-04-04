using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for StaffDetailMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class StaffDetailMasterWebService : System.Web.Services.WebService
{

    public StaffDetailMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string StaffDetailMasterManage(Int32 StaffID, Int32 StaffTypeID, String StaffName, String MobileNo, String Address, String StaffPhoto)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (StaffID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("StaffDetailMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaffTypeID", StaffTypeID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@StaffName", StaffName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@MobileNo", MobileNo).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Address", Address).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@StaffPhoto", StaffPhoto).DbType = DbType.String;



                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("StaffDetailMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaffID", StaffID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@StaffTypeID", StaffTypeID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@StaffName", StaffName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@MobileNo", MobileNo).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Address", Address).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@StaffPhoto", StaffPhoto).DbType = DbType.String;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Updated Successfully";

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

    [WebMethod] //-- Executing SubCategory GET/Read Function --// 
    public string StaffDetailMasterGet(Int32 StaffID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("StaffDetailMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StaffID", StaffID).DbType = DbType.Int32;
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
    public string StaffDetailMasterDelete(Int32 StaffID, String StaffPhoto)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (StaffID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("StaffDetailMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaffID", StaffID).DbType = DbType.Int32;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                con.Close();

                System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/" + StaffPhoto + ""));
                if (fileInfo.Exists)
                    fileInfo.Delete();

                msg = "Record Deleted Successfully";

            }

        }
        catch (Exception Exe)
        {
            msg = "Error" + Exe.Message;

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


    [WebMethod] //-- Executing GET/Read Function of Category List --// 
    public List<ListItem> ListAllStaff()
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllStaff", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["StaffID"].ToString(),
                        Text = sdr["StaffName"].ToString()

                    });

                }

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
        return List;
    }

}
