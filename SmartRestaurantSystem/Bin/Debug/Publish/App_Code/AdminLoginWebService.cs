﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for AdminLoginWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class AdminLoginWebService : System.Web.Services.WebService
{

    public AdminLoginWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]
    public string AdminCheckLogin(String UserName, String Password)
    {


        string msg = "";
        SqlConnection con = new SqlConnection(Global.StrCon);
        try
        {
            SqlCommand cmd = new SqlCommand("AdminLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", UserName).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@Password", Password).DbType = DbType.String;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            cmd.Dispose();

            if (ds.Tables[0].Rows.Count > 0)
            {
                HttpContext.Current.Session["UserID"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                msg = "Valid";

            }
            else
            {

                msg = "Invalid";
            }


        }
        catch (Exception Exe)
        {

            msg = "error" + Exe.Message;

        }
        return msg;



    }


    [WebMethod(EnableSession = true)]
    public string Logout()
    {
        string msg = "";

        HttpContext.Current.Session.Abandon();
        HttpContext.Current.Session.Clear();

        msg = "Logout";
        return msg;
    }

}