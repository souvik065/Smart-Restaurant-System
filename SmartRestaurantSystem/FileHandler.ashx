<%@ WebHandler Language="C#" Class="FileHandler" %>

using System;
using System.Web;

public class FileHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if(context.Request.Files.Count > 0)
        {
            String Imgtype = context.Request.QueryString["Type"];

            if(Imgtype == "DishPhoto")
            {
                string strGuID = Guid.NewGuid().ToString();
                HttpFileCollection files = context.Request.Files;
                for(int i=0; i<files.Count; i++)
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/DishPhoto/"));
                    if (!fileInfo.Directory.Exists)
                        fileInfo.Directory.Create();

                    HttpPostedFile uploadFile = files[i];
                    string filename = System.IO.Path.GetFileName(uploadFile.FileName);
                    string strExt = System.IO.Path.GetFileName(filename);
                    string strActualName = System.IO.Path.GetFileName(filename);
                }
            }
        }

        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}