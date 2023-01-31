<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Dishes.aspx.vb" Inherits="Dishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="">
            <div>
                <h1 class="text-5xl">Category Master</h1>
            </div>
        </div>
        <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
            <div ><span class="capitalize"> Master > Dishes </span></div>
        </div>
    </div>


    <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <div class="font-poppins-400 text-xl w-full space-y-10 px-5 py-5 font-bold">

                <!-- Fields -->
                <div class="grid gap-10 md:grid-cols-2  ">
                    <div class="flex space-x-5 w-full ">

                        <lable for="dllCategory" class="my-auto">Category Name </lable>
                        <select id="dllCategory" class="mx-auto bg-transparent py-2 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                            <option>--Selesct Category--</option>

                        </select>
                    </div>
                <div class="flex space-x-5 w-full ">

                    <lable for="dllSubCategory" class="my-auto">Sub-Category Name </lable>
                    <select id="dllSubCategory" class="  bg-transparent py-2 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                        <option>--Selesct Sub-Category--</option>

                    </select>
                </div>
                <div class="flex space-x-5 w-full ">

                    <lable for="txtIngredience" class="my-auto">Ingredience </lable>
                    <input id="txtIngredience" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                </div>
                <div class="flex space-x-5 w-full ">

                    <lable for="txtDishName" class="my-auto">Dish Name </lable>
                    <input id="txtDishName" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                </div>
                <div class="flex space-x-5 w-full ">

                    <lable for="fuDishPhoto" class="my-auto">Dish Photo </lable>
                    <input id="fuDishPhoto" class=" py-3 px-3 rounded-full
                                                        bg-gradient-to-br from-neutral-600 to-stone-700
                                                        file:rounded-full
                                                        file:border-none
                                                        file:text-white
                                                        file:px-6 file:py-3
                                                        file:cursor-pointer
                                                        file:shadow-lg file:shadow-yellow-900/50
                                                        cursor-pointer shadow-lg shadow-yellow-700/50
                                                        file:bg-yellow-800"
                                                        type="file" />
                </div>
            </div>
            <!-- Fields End-->

            <!-- Buttons -->
            <div class="flex space-x-10">
                <div class="">
                    <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer active:bg-black" type="button" value="Save" />
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

