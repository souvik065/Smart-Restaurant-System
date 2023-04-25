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
                        <div class="grid lg:grid-cols-2 gap-5">
                            <div class=" w-full ">
                                <lable for="ddlStaffType" class="my-auto w-1/3">Staff Type</lable><span id="ddlStaffTypeWarning" class="formerror text-red-600 text-sm"></span>

                                <select id="ddlStaffType" onchange="" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                    <option>--Select--</option>

                                </select>
                            </div>

                            <div class=" w-full ">
                                <lable for="ddlStaffDetail" class="my-auto w-1/3">Staff Detail</lable><span id="ddlStaffDetailWarning" class="formerror text-red-600 text-sm"></span>

                                <select id="ddlStaffDetail" onchange="FormValDropDown(this.id)" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                    <option>--Select--</option>

                                </select>
                            </div>
                            <div class=" w-full ">
                                <div>
                                    <lable for="" class="my-auto">User Name </lable>
                                    <span id="UserNameWarning" class="formerror text-red-600  text-sm"></span>
                                </div>
                                <input id="txtUserName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                            </div>

                            
                            <div>
                                <lable for="" class="my-auto">Password </lable>
                                <div class="border border-classic-dimyellow flex ">
                                    <input id="txtPassword"  class="bg-transparent text-gray-400 font-semibold  w-full   py-1 px-2" type="password"  />
                                    <span onclick="toggle()" id="eye" class="my-auto cursor-pointer px-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg></span>
                                </div>
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
                    <table class="table-fixed" id="tblUsers">
                        <thead>
                            <tr>
                                <th>Sr.No</th>
                                <th>User Name</th>
                                <th>Password</th>
                                <th>User Type</th>
                                <th>Staff Name</th>

                                <th class="justify-around">Actions</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Sr.No</th>
                                <th>User Name</th>
                                <th>Password</th>
                                <th>Staff Name</th>

                                <th class="justify-around">Actions</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>






        </div>

    </section>

    <section class="h-[500px]"></section>

    <script>

        $(function () {
            table = $("#tblUsers").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            ListAllStaffType();
            FillUserDetails(0);
        });

        var state = false;
        function toggle() {
            if (state) {
                document.getElementById("txtPassword").
                    setAttribute("type", "password");

                document.getElementById("eye").style.color = "#7a797e";
                state = false;
            } else {
                document.getElementById("txtPassword").setAttribute("type", "text");
                document.getElementById("eye").style.color = "#5887ef";

                state = true;
            }
        }


        $('#ddlStaffType').on('change', function () {

            FormValDropDown(this.id);

            ListAllStaffByStaffType(this.value);


        });



        function ClearFields() {
            $('#txtUserName').val("");
            $('#txtPassword').val("");
            $('#ddlStaffType').val(0);
            $('#ddlStaffDetail').val(0);


            $('#hdnUserID').val("");



            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }

        $("#btnClear").on('click', function () {
            var categoryid = $("#hdnCategoryID");

            if (categoryid.val() > 0) {

                $("[id=btnSave]").val("Save");
                $("[id=btnClear]").val("Clear");

                ClearFields();

                Swal.fire({
                    title: 'Cancled',
                    text: 'Record Updation Terminted',
                    color: "white",
                    background: '#27272a',
                    icon: 'info'

                })

            } else {
                ClearFields();
            }

        });


        $("#btnSave").on('click', function () {
            var userid = $('#hdnUserID');
            var username = $('#txtUserName');
            var password = $('#txtPassword');
            var stafftypeid = $('#ddlStaffType');
            var staffid = $('#ddlStaffDetail');


            var Validate = FormValidation(username, password, stafftypeid, staffid);
            if (Validate == true) {
                var UserID = userid.val() == "" ? 0 : userid.val();
                var UserName = username.val().trim();
                var Password = password.val().trim();
                var StaffTypeID = stafftypeid.val().trim();
                var StaffID = staffid.val().trim();

                $.ajax({

                    url: "../WebServices/UserMasterWebService.asmx/UserMasterManage",
                    method: "POST",
                    data: "{UserID:" + JSON.stringify(UserID) + ", UserName:" + JSON.stringify(UserName) + ", Password:" + JSON.stringify(Password) + ", StaffTypeID:" + JSON.stringify(StaffTypeID) + ",StaffID:" + JSON.stringify(StaffID) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (result.includes("Success")) {
                            swal.fire({
                                icon: "success",
                                title: result,
                                background: '#27272a',
                            })
                            FillUserDetails(0);
                            ClearFields();

                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });

            }


        });


        function FillUserDetails(UserID) {
            $.ajax({

                url: "../WebServices/UserMasterWebService.asmx/UserMasterGet",
                method: "POST",
                data: "{UserID:" + JSON.stringify(UserID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }


        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            table.clear();

            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";

                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditUser(" + $(this).find("UserID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteUser(" + $(this).find("UserID").text() + ")\" type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("UserName").text(),
                        $(this).find("Password").text(),
                        $(this).find("StaffType").text(),
                        $(this).find("StaffName").text(),
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditUser(UserID) {
            $.ajax({

                url: "../WebServices/UserMasterWebService.asmx/UserMasterGet",
                method: "POST",
                data: "{UserID:" + JSON.stringify(UserID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnUserID]").val(Details.find("UserID").text());
            $("[id=txtUserName]").val(Details.find("UserName").text());
            $("[id=txtPassword]").val(Details.find("Password").text());
            $("[id=ddlStaffType]").val(Details.find("StaffTypeID").text());
            ListAllStaffByStaffType(Details.find("StaffTypeID").text());
            $("[id=ddlStaffDetail]").val(Details.find("StaffID").text());

            $("[id=txtUserName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteUser(UserID) {

            swal.fire({
                icon: "warning",
                text: "Are you sure.",
                background: '#27272a',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true



            }).then((result) => {
                if (result.isConfirmed) {
                    var msg = "";
                    $.ajax({

                        url: "../WebServices/UserMasterWebService.asmx/UserMasterDelete",
                        method: "POST",
                        data: "{UserID:" + JSON.stringify(UserID) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (result.includes("Success")) {
                                msg = result;

                            }

                            FillUserDetails(0);
                            ClearFields();


                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });

                    swal.fire({
                        title: "Deleted",
                        icon: "success",
                        text: msg,
                        background: '#27272a',

                    })

                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    swal.fire({
                        title: "Cancelled",
                        text: "Your Record is Safe :)",
                        icon: "info",
                        background: '#27272a',

                    })

                }
            })




        }





        /* DropDown Filling Functions*/




        function ListAllStaffType() {

            $.ajax({

                url: "../WebServices/StaffTypeMasterWebService.asmx/ListAllStaffType",
                method: "POST",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlStaffType");
                    ddlcatgeory.empty();
                    //ddlcatgeory.append($("<option></option>").val('0').text('-- Select Category --'));
                    $.each(res.d, function () {
                        ddlcatgeory.append($("<option></option>").val(this['Value']).text(this['Text']));
                    })
                },
                error: function (err) {
                    console.log(err)
                }

            });


        }


        function ListAllStaffByStaffType(StaffTypeID) {

            $.ajax({

                url: "../WebServices/StaffDetailMasterWebService.asmx/ListAllStaffByStaffType",
                method: "POST",
                data: "{StaffTypeID:" + JSON.stringify(StaffTypeID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlStaffDetail");
                    ddlcatgeory.empty();
                    //ddlcatgeory.append($("<option></option>").val('0').text('-- Select Category --'));
                    $.each(res.d, function () {
                        ddlcatgeory.append($("<option></option>").val(this['Value']).text(this['Text']));
                    })
                },
                error: function (err) {
                    console.log(err)
                }

            });


        }

        /* DropDown Filling Functions End*/



        function FormValidation(categoryname, categoryphoto, hdnphotopath) {
            var returnval = true;
            if (categoryname.val() == "") {
                $("#categorynameval").text("* Category Name Should not be Empty ");
                returnval = false;
            }

            if (hdnphotopath.val() == '') {
                if (categoryphoto.val() == '') {
                    $('#imgCategoryPhotoWarning').text("*Please Select the Category Photo")
                    swal.fire({
                        title: "Category Photo is Not Selected",
                        text: "Please Select the Dish Photo",
                        icon: "warning",
                        background: '#27272a',

                    })

                    returnval = false;
                }

            }

            return returnval;
        }

    </script>

</asp:Content>

