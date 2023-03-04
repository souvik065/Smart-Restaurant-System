using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for IngredientsMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class IngredientsMasterWebService : System.Web.Services.WebService {

    public IngredientsMasterWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string IngredientsMasterInsert( Int32 MaterialID, Int32 DishID)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
           
                con.Open();

                SqlCommand cmd = new SqlCommand("IngredientsMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaterialID", MaterialID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
                

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

    public string IngredientsMasterUpdate(Int32 MaterialID, Int32 DishID)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {

            con.Open();

            SqlCommand cmd = new SqlCommand("IngredientsMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaterialID", MaterialID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;


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
    public string IngredientsMasterDelete(Int32 DishID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (DishID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("IngredientsMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                con.Close();

                msg = "Deleted Successfully";
            }

        }
        catch (Exception Exe)
        {
            msg = "error" + Exe.Message;

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

    [WebMethod] //-- Executing Category GET/Read Function --// 
    public string IngredientsMasterGet(Int32 DishID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("IngredientsMasterGet", con);
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

}
