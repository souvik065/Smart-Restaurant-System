<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="Admin_CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl">
        <div class="">
            <div>
                <h1 class="text-5xl">Category Master</h1>
            </div>
        </div>
        <div>
            <div></div>
        </div>
    </div>


    <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <div class="font-poppins-400 text-xl w-full">
                <div class="flex space-x-5 w-full">

                    <lable for="" class="">Category Name</lable>
                    <input class="bg-transparent border w-full border-classic-light-yellow w-1/2 py-1 px-1" id="txtCategoryName" type="text" />
                </div>

            </div>
        </div>

    </div>

</asp:Content>

