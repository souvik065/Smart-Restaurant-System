using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for MaterialMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class MaterialMasterWebService : System.Web.Services.WebService
{

    public MaterialMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string MaterialMasterManage(Int32 MaterialID,Int32 MaterialCategoryID, String MaterialName, String MeasuredIn)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (MaterialID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("MaterialMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialName", MaterialName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@MaterialCategoryID", MaterialCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@MeasuredIn", MeasuredIn).DbType = DbType.String;


                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("MaterialMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialID", MaterialID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@MaterialName", MaterialName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@MaterialCategoryID", MaterialCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@MeasuredIn", MeasuredIn).DbType = DbType.String;
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

    [WebMethod] //-- Executing Material Master GET/Read Function --// 
    public string MaterialMasterGet(Int32 MaterialID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("MaterialMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MaterialID", MaterialID).DbType = DbType.Int32;
        return GetDataWithoutPaging(cmd).GetXml();
    }



    public DataSet GetDataWithoutPaging(SqlCommand cmd)
    {
        String msg = "";
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
            msg = Exe.Message;
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
    public string MaterialMasterDelete(Int32 MaterialID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (MaterialID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("MaterialMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialID", MaterialID).DbType = DbType.Int32;
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


    [WebMethod] //-- Executing GET/Read Function of Material List --// 
    public List<ListItem> ListAllMaterial()
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllMaterial", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["MaterialID"].ToString(),
                        Text = sdr["MaterialName"].ToString()

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
