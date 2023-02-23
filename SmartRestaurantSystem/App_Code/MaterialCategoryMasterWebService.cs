using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for MaterialCategoryMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class MaterialCategoryMasterWebService : System.Web.Services.WebService
{

    public MaterialCategoryMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string MaterialCategoryMasterManage(Int32 MaterialCategoryID, String MaterialCategoryName)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (MaterialCategoryID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("MaterialCategoryMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialCategoryName", MaterialCategoryName).DbType = DbType.String;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("MaterialCategoryMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialCategoryID", MaterialCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@MaterialCategoryName", MaterialCategoryName).DbType = DbType.String;
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
    public string MaterialCategoryMasterGet(Int32 MaterialCategoryID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("MaterialCategoryMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MaterialCategoryID", MaterialCategoryID).DbType = DbType.Int32;
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
    public string MaterialCategoryMasterDelete(Int32 MaterialCategoryID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (MaterialCategoryID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("MaterialCategoryMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialCategoryID", MaterialCategoryID).DbType = DbType.Int32;
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


    [WebMethod] //-- Executing GET/Read Function of Material Category List --// 
    public List<ListItem> ListAllMaterialCategory()
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllMaterialCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["MaterialCategoryID"].ToString(),
                        Text = sdr["MaterialCategoryName"].ToString()

                    });

                }

            }

            con.Close();

        }
        catch (Exception Exe)
        {
            Console.WriteLine(Exe.Message);

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
