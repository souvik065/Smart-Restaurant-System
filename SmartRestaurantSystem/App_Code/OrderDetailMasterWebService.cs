﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for OrderDetailMasterWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class OrderDetailMasterWebService : System.Web.Services.WebService {

    public OrderDetailMasterWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string OrderDetailMasterInsert(Int32 OrderID, Int32 DishID, Int32 Qty, Int32 Rate, Int32 Total)
    {
        String msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("OrderDetailMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@OrderID", OrderID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@DishID", DishID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@Qty", Qty).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@Rate", Rate).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@Total", Total).DbType = DbType.Int32;


            cmd.ExecuteNonQuery();
            cmd.Dispose();

            msg = "Record Successfully Inserted";

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

}