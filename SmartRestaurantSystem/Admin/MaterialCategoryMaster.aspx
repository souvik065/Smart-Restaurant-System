<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="MaterialCategoryMaster.aspx.vb" Inherits="Admin_MaterialCategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="">
            <div>
                <h1 class="text-5xl">Material Category Master</h1>
            </div>
        </div>
        <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
            <div ><span class="capitalize"> Master > Material Category Master</span></div>
        </div>
    </div>


    <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">

                <!-- Fields -->
                <div class="flex space-x-5 w-full">

                    <lable for="" class="">Material Category Name </lable>
                    <input id="txtMaterialCategory" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1"  type="text" />
                </div>
                <!-- Fields End-->

                <!-- Buttons -->
                <div class="flex space-x-10">
                    <div class="">
                        <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Save" />
                    </div>
                    <div>
                        <input id="btnClear" class="border border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                    </div>
                </div>
                <!-- Buttons End-->


            </div>
        </div>

    </div>
</asp:Content>

