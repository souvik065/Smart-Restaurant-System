<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="test1.aspx.cs" Inherits="Admin_test1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="h-[9rem] overflow-hidden bg-classic-brown  min-w-[5rem] max-w-[9rem] px-3 rounded " >
        <div class=" ">
        <input id="CheckboxMikProducts"  type="checkbox" name="Material" value="Milk Porudcts" />
           <label for="CheckboxMikProducts" class="cursor-pointer w-full h-full  ">
               <div class="rounded h-24 border  overflow-hidden">
                   <img class="w-full" src="../Assets/Images/MaterialPhoto/280220233ad708e6-000c-4c86-8adb-79d889ba533a.pn" />
               </div>
               <div class="font-semibold text-gray-400">Mik Products</div>
           </label>
        </div>
    </div>

    <div class="my-5">
        <label for="Online" class=" bg-classic-yellow text-blacks font-bold py-1 px-2">
            <input type="radio" name="pay" id="Online"/>
            Online
        </label>
    </div>

    <div>
        <input type="radio" name="pay" id="Cash"/>
        <label for="Cash">
            Cash
        </label>
    </div>
    <div>
        <p id="ip"></p>
    </div>
    <asp:Button ID="btnGetIP" runat="server" Text="GetIP" OnClick="btnGetIP_Click" />
    <asp:TextBox ID="txtIP" runat="server" CssClass="auto-style1" ForeColor="Black" Height="49px" Rows="10"></asp:TextBox>

    <div class="h-screen"></div>

    <style>
    h1 {
        color: green;
    }
        .auto-style1 {
            margin-top: 0;
        }
    </style>
  
     
   

 

    <center class="border">
        <h1>GeeksforGeeks</h1>
        <h3>Getting Client IP address</h3>
    </center>

    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>
     
      <script>

          /* Add "https://api.ipify.org?format=json" statement
                     this will communicate with the ipify servers in
                     order to retrieve the IP address $.getJSON will
                     load JSON-encoded data from the server using a
                     GET HTTP request */

          
      </script>

   <script>

       
       var deviceIP = "";
       var TableID = "";

       $(function () {

           $.getJSON('https://api.db-ip.com/v2/free/self', function (data) {
               //console.log(JSON.stringify(data, null, 2));
               // const getdata = JSON.stringify(data, null, 2);

               console.log(typeof (data));
               console.log(data.ipAddress)
               deviceIP = data.ipAddress;
               console.log("After ")

               
           });
           
           
       });

      


       $.getJSON("https://api.ipify.org?format=json", function (data) {

           // Setting text of element P with id gfg
           $("#ip").html(data.ip);
       })

        // "json" shows that data will be fetched in json format


       console.log("DeviceIP : ",  '<%= Session["DeviceIP"] %>')


   </script>
</asp:Content>

