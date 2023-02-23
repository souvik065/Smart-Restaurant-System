using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for TableMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class TableMasterWebService : System.Web.Services.WebService
{

    public TableMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string TableMasterManage(Int32 TableID, String TableNo)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (TableID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("TableMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TableNo", TableNo).DbType = DbType.String;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("TableMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@TableNo", TableNo).DbType = DbType.String;
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

    [WebMethod] //-- Executing TableMaster GET/Read Function --// 
    public string TableMasterGet(Int32 TableID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("TableMasterGet", con);
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

    [WebMethod]
    public string TableMasterDelete(Int32 TableID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (TableID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("TableMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
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


    [WebMethod] //-- Executing GET/Read Function of TableNo List --// 
    public List<ListItem> ListAllTableNo(Int32 TableID)
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllTableNo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TableID", TableID).DbType = DbType.Int32;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["TableID"].ToString(),
                        Text = sdr["TableNo"].ToString()

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
