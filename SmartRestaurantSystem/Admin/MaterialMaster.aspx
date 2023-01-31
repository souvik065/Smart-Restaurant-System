<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="MaterialMaster.aspx.vb" Inherits="Admin_MaterialMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="">
            <div>
                <h1 class="text-5xl">Material Master</h1>
            </div>
        </div>
        <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
            <div><span class="capitalize">Master > Material Master</span></div>
        </div>
    </div>


    <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">

                <!-- Fields -->
                <div class="grid gap-10 md:grid-cols-2 lg:grid-cols-3">
                    <div class="flex space-x-5 w-full ">

                        <lable for="dllMaterialCategory" class="my-auto">Material Category </lable>
                        <select id="dllMaterialCategory" class="  bg-transparent py-2 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                            <option>--Selesct Material Category--</option>

                        </select>
                    </div>

                     <div class="flex space-x-5 w-4/5">

                        <lable for="txtMeasuredIn" class="my-auto">Measured In </lable>

                        <input id="txtMeasuredIn" placeholder="" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1"  type="text" />
                    </div>
                    <div class="flex space-x-5 w-full">

                        <lable for="txtMaterialName" class="my-auto">Material Name </lable>

                        <input id="txtMaterialName" placeholder="example:- Slicer, Mixer" class="bg-transparent border font-thin w-full border-classic-dimyellow w-1/2 py-1 px-1"  type="text" />
                    </div>
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

