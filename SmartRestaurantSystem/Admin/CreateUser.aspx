<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="h-full">
        <!-- Page Heading Start -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class=" text-5xl">Create User</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Create User</span></div>
            </div>
        </div>
        <!-- Page Heading End -->

        <div>
            <div class="flex py-3 hidden text-classic-yellow font-poppins-400 font-bold px-3 shadow-2xl bg-classic-brown w-full">
                <div class="border border-b-2 py-3 px-5"><span>Add</span></div>
                <div class="border py-3 px-5"><span>View</span></div>
            </div>

            <!-- Hidden Fields Start-->
            <input id="hdnUserID" type="hidden" />

            <!-- Hidden Fields End-->


            <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 ">
                <div class="w-full">
                    <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">


                        <!-- Fields Start -->
                        <div class="grid lg:grid-cols-3 gap-5">
                            <div class=" w-full ">
                                <div>
                                    <lable for="" class="my-auto">User Name </lable>
                                    <span id="UserNameWarning" class="formerror text-red-600  text-sm"></span>
                                </div>
                                <input id="txtUserName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                            </div>

                            <div class=" w-full">
                                <div>
                                    <lable for="" class="my-auto">Password </lable>
                                    <span id="PasswordWarning" class="formerror text-red-600  text-sm"></span>
                                </div>
                                <input id="txtPassword" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow  py-1 px-2" type="password" />
                            </div>

                            <div class=" w-full ">
                                <lable for="ddlStaffType" class="my-auto w-1/3">Staff Type</lable><span id="ddlStaffTypeWarning" class="formerror text-red-600 text-sm"></span>

                                <select id="ddlStaffType" onchange="FormValDropDown(this.id)" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                    <option>--Select--</option>

                                </select>
                            </div>

                            <div class=" w-full ">
                                <lable for="ddlStaffDetail" class="my-auto w-1/3">Staff Detail</lable><span id="ddlStaffDetailWarning" class="formerror text-red-600 text-sm"></span>

                                <select id="ddlStaffDetail" onchange="FormValDropDown(this.id)" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                    <option>--Select--</option>

                                </select>
                            </div>
                        </div>
                        <!-- Fields End -->

                        <!-- Buttons -->
                        <div class="flex space-x-10 font-semibold">
                            <div class="">
                                <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Save" />
                            </div>
                            <div>
                                <input id="btnClear" class="border border-yellow-900  text-yellow-900 bg-transparent py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                            </div>
                        </div>
                        <!-- Buttons End-->



                    </div>
                </div>

            </div>

            <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
                <div class="w-full">
                    <table class="table-fixed" id="tblCategory">
                        <thead>
                            <tr>
                                <th>Sr.No</th>
                                <th>Category Name</th>
                                <th>Category Photo</th>
                                <th class="justify-around">Actions</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Sr.No</th>
                                <th>Category Name</th>
                                <th>Category Photo</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>






        </div>

    </section>

    <section class="h-[500px]"></section>

</asp:Content>

