<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="test1.aspx.cs" Inherits="Admin_test1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="h-[9rem] overflow-hidden bg-classic-brown  min-w-[5rem] max-w-[9rem] px-3 rounded " >
        <div class=" ">
        <input id="CheckboxMikProducts"  type="checkbox" name="Material" value="Milk Porudcts" />
           <label for="CheckboxMikProducts" class="cursor-pointer w-full h-full  ">
               <div class="rounded h-[5rem] overflow-hidden">
                   <img class="w-full max-h-max " src="../Assets/Images/MaterialPhoto/280220233ad708e6-000c-4c86-8adb-79d889ba533a.png" />
               </div>
               <div class="font-semibold text-gray-400">Mik Products</div>
           </label>
        </div>
    </div>


    <div class="h-screen"></div>
    <script>
       
    </script>
</asp:Content>

