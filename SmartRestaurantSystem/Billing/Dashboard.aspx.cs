using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kitchen_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            if(Session["StaffType"] != "Kitchen Staff")
            {
                Response.Redirect("~/Admin/Default.aspx");

            }

        }
    }
}