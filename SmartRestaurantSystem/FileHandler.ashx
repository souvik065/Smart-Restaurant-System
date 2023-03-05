<%@ WebHandler Language="C#" Class="FileHandler" %>

using System;
using System.Web;

public class FileHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            String Imgtype = context.Request.QueryString["Type"];

            if (Imgtype == "DishPhoto")
            {
                string strGuID = Guid.NewGuid().ToString();
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/DishPhoto/"));
                    if (!fileInfo.Directory.Exists)
                    {
                        fileInfo.Directory.Create();
                    }

                    HttpPostedFile uploadFile = files[i];
                    string filename = System.IO.Path.GetFileName(uploadFile.FileName);
                    string strExt = System.IO.Path.GetExtension(filename);
                    string strActualName = System.IO.Path.GetFileName(filename);
                    string strFileName = DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Year.ToString() + strGuID + strExt;
                    string savefile1 = fileInfo.ToString() + "/" + strFileName;
                    uploadFile.SaveAs(savefile1);
                    context.Session["DishPhoto"] = "DishPhoto/" + strFileName;
                    context.Response.Write("DishPhoto/" + strFileName);

                }
            }
            else if (Imgtype == "StaffPhoto")
            {
                string strGuID = Guid.NewGuid().ToString();
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/StaffPhoto/"));
                    if (!fileInfo.Directory.Exists)
                    {
                        fileInfo.Directory.Create();
                    }

                    HttpPostedFile uploadFile = files[i];
                    string filename = System.IO.Path.GetFileName(uploadFile.FileName);
                    string strExt = System.IO.Path.GetExtension(filename);
                    string strActualName = System.IO.Path.GetFileName(filename);
                    string strFileName = DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Year.ToString() + strGuID + strExt;
                    string savefile1 = fileInfo.ToString() + "/" + strFileName;
                    uploadFile.SaveAs(savefile1);
                    context.Session["StaffPhoto"] = "StaffPhoto/" + strFileName;
                    context.Response.Write("StaffPhoto/" + strFileName);

                }
            }
            else if (Imgtype == "MaterialPhoto")
            {
                string strGuID = Guid.NewGuid().ToString();
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/MaterialPhoto/"));
                    if (!fileInfo.Directory.Exists)
                    {
                        fileInfo.Directory.Create();
                    }

                    HttpPostedFile uploadFile = files[i];
                    string filename = System.IO.Path.GetFileName(uploadFile.FileName);
                    string strExt = System.IO.Path.GetExtension(filename);
                    string strActualName = System.IO.Path.GetFileName(filename);
                    string strFileName = DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Year.ToString() + strGuID + strExt;
                    string savefile1 = fileInfo.ToString() + "/" + strFileName;
                    uploadFile.SaveAs(savefile1);
                    context.Session["MaterialPhoto"] = "MaterialPhoto/" + strFileName;
                    context.Response.Write("MaterialPhoto/" + strFileName);

                }
            }
            else if (Imgtype == "CategoryPhoto")
            {
                string strGuID = Guid.NewGuid().ToString();
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/CategoryPhoto/"));
                    if (!fileInfo.Directory.Exists)
                    {
                        fileInfo.Directory.Create();
                    }

                    HttpPostedFile uploadFile = files[i];
                    string filename = System.IO.Path.GetFileName(uploadFile.FileName);
                    string strExt = System.IO.Path.GetExtension(filename);
                    string strActualName = System.IO.Path.GetFileName(filename);
                    string strFileName = DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Year.ToString() + strGuID + strExt;
                    string savefile1 = fileInfo.ToString() + "/" + strFileName;
                    uploadFile.SaveAs(savefile1);
                    context.Session["CategoryPhoto"] = "CategoryPhoto/" + strFileName;
                    context.Response.Write("CategoryPhoto/" + strFileName);

                }
            }
            else if (Imgtype == "SubCategoryPhoto")
            {
                string strGuID = Guid.NewGuid().ToString();
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Assets/Images/SubCategoryPhoto/"));
                    if (!fileInfo.Directory.Exists)
                    {
                        fileInfo.Directory.Create();
                    }

                    HttpPostedFile uploadFile = files[i];
                    string filename = System.IO.Path.GetFileName(uploadFile.FileName);
                    string strExt = System.IO.Path.GetExtension(filename);
                    string strActualName = System.IO.Path.GetFileName(filename);
                    string strFileName = DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Year.ToString() + strGuID + strExt;
                    string savefile1 = fileInfo.ToString() + "/" + strFileName;
                    uploadFile.SaveAs(savefile1);
                    context.Session["SubCategoryPhoto"] = "SubCategoryPhoto/" + strFileName;
                    context.Response.Write("SubCategoryPhoto/" + strFileName);

                }
            }
        }

    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}