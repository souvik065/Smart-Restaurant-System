<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="test1.aspx.cs" Inherits="Admin_test1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="h-[9rem] overflow-hidden bg-classic-brown  min-w-[5rem] max-w-[9rem] px-3 rounded " >
        <div class=" ">
        <input id="CheckboxMikProducts"  type="checkbox" name="Material" value="Milk Porudcts" />
           <label for="CheckboxMikProducts" class="cursor-pointer w-full h-full  ">
               <div class="rounded h-24 border  overflow-hidden">
                   <img class="w-full  " src="../Assets/Images/MaterialPhoto/280220233ad708e6-000c-4c86-8adb-79d889ba533a.pn" />
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


    <div class="h-screen"></div>

    <style>
    h1 {
        color: green;
    }
    </style>
  
     
   

 

    <center class="border">
        <h1>GeeksforGeeks</h1>
        <h3>Getting Client IP address</h3>
    </center>

   <script>

       
      

       $.getJSON('https://api.db-ip.com/v2/free/self', function (data) {
           console.log(JSON.stringify(data, null, 2));
       });

        // "json" shows that data will be fetched in json format
   </script>
</asp:Content>

