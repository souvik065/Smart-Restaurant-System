using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for SupplierMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SupplierMasterWebService : System.Web.Services.WebService
{

    public SupplierMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string SupplierMasterManage(Int32 SupplierID, String SupplierName, String Email, String ContactNo, String ContactPerson,String GSTNo, String Address)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (SupplierID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SupplierMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SupplierName", SupplierName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Email", Email).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@ContactPerson", ContactPerson).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@GSTNo", GSTNo).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Address", Address).DbType = DbType.String;


                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("SupplierMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SupplierID", SupplierID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@SupplierName", SupplierName).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Email", Email).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@ContactPerson", ContactPerson).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@GSTNo", GSTNo).DbType = DbType.String;
                cmd.Parameters.AddWithValue("@Address", Address).DbType = DbType.String;
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
    public string SupplierMasterGet(Int32 SupplierID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("SupplierMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SupplierID", SupplierID).DbType = DbType.Int32;
        return GetDataWithoutPaging(cmd).GetXml();
    }



    public DataSet GetDataWithoutPaging(SqlCommand cmd)
    {
        String msg;
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
    public string SupplierMasterDelete(Int32 SupplierID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (SupplierID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SupplierMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SupplierID", SupplierID).DbType = DbType.Int32;

                cmd.ExecuteNonQuery();
                cmd.Dispose();

                con.Close();

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


    [WebMethod] //-- Executing GET/Read Function of Supplier List --// 
    public List<ListItem> ListAllSupplier()
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllSupplier", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["SupplierID"].ToString(),
                        Text = sdr["SupplierName"].ToString()

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
