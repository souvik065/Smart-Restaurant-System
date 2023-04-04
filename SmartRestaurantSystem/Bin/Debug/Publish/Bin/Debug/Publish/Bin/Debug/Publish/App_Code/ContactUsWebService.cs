using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Net.Mail;

/// <summary>
/// Summary description for ContactUsWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ContactUsWebService : System.Web.Services.WebService
{

    public ContactUsWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string SendEmail(String Name, String Email,String Subject, String Message)
    {
        String msg = "";
        String To = "bhattacharyasouvik39@gmail.com";
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(To);
            mail.From = new MailAddress(Email);
            mail.Subject = Subject;
            mail.Body = "<p>Name: " + Name + "<br/>Email: " + Email + "<br/>Subject: " + Subject + "<br/>Message: " + Message + " </p>";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("bhattacharyasouvik065@gmail.com", "gywmzkjtgxadbqdx");
            smtp.Send(mail);

            msg = "Email Send Successfully";

            //String Body = "<p>Name:  </p>";
            //MailMessage message = new MailMessage(From,To,Subject,Message);
            //message.IsBodyHtml = true;

            //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;

            //client.Credentials = new System.Net.NetworkCredential("bhattacharyasouvik065@gmail.com", "gywmzkjtgxadbqdx");
            //client.Send(message);

            //msg = "Message Send Successfully";


        }
        catch (Exception Exe)
        {
            msg = "Error" + Exe.Message;
        }
        return msg;
    }

}
