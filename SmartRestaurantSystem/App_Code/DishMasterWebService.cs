using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for DisheMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class DishMasterWebService : System.Web.Services.WebService
{

    public DishMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string DishMasterManage(Int32 DishID, Int32 CategoryID, Int32 SubCategoryID, String DishName, String DishPhoto)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (DishID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DishMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CategoryID", CategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@SubCategoryID", SubCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@DishName", DishName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@DishPhoto", DishPhoto).DbType = DbType.String;


                msg = cmd.ExecuteScalar().ToString();
                cmd.Dispose();

               

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("DishMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@CategoryID", CategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@SubCategoryID", SubCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@DishName", DishName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@DishPhoto", DishPhoto).DbType = DbType.String;
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
    public string DishMasterGet(Int32 DishID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("DishMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
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
    public string DishMasterDelete(Int32 DishID, String DishPhoto)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (DishID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DishMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;

                cmd.ExecuteNonQuery();
                cmd.Dispose();

                con.Close();

                System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/" + DishPhoto + ""));
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
    public List<ListItem> ListAllDishes()
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllDish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["DishID"].ToString(),
                        Text = sdr["DishName"].ToString()

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
