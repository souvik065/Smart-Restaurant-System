using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for MeasureTypeMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class MeasureTypeMasterWebService : System.Web.Services.WebService
{

    public MeasureTypeMasterWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string MeasureTypeMasterManage(Int32 MeasureTypeID, Int32 SubCategoryID,  String MeasureType)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            if (MeasureTypeID == 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("MeasureTypeMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubCategoryID", SubCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@MeasureType", MeasureType).DbType = DbType.String;

                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "Record Inserted Successfully";

                con.Close();
            }
            else
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("MeasureTypeMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MeasureTypeID", MeasureTypeID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@SubCategoryID", SubCategoryID).DbType = DbType.Int32;
                cmd.Parameters.AddWithValue("@MeasureType", MeasureType).DbType = DbType.String;

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
    public string MeasureTypeMasterGet(Int32 MeasureTypeID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("MeasureTypeMasterGet", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MeasureTypeID", MeasureTypeID).DbType = DbType.Int32;
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
    public string MeasureTypeMasterDelete(Int32 MeasureTypeID)
    {
        SqlConnection con = new SqlConnection(Global.StrCon);
        String msg = "";
        try
        {
            if (MeasureTypeID > 0)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("MeasureTypeMasterDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MeasureTypeID", MeasureTypeID).DbType = DbType.Int32;
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
    public string ListAllMeasureTypeBySubCategory(Int32 SubCategoryID)
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        SqlCommand cmd = new SqlCommand("ListAllMeasureTypeBySubCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SubCategoryID", SubCategoryID).DbType = DbType.Int32;
        return GetDataWithoutPaging(cmd).GetXml();

    }


    [WebMethod] //-- Executing GET/Read Function of Category List --// 
    public List<ListItem> ListAllMeasureType(Int32 MeasureTypeID)
    {

        SqlConnection con = new SqlConnection(Global.StrCon);
        List<ListItem> List = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllMeasureTypeID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MeasureTypeID", MeasureTypeID).DbType = DbType.Int32;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    List.Add(new ListItem
                    {

                        Value = sdr["MeasureTypeID"].ToString(),
                        Text = sdr["MeasureType"].ToString()

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
