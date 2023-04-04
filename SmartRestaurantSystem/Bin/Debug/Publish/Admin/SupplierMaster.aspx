<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SupplierMaster.aspx.cs" Inherits="Admin_SupplierMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="max-h-max"></section>
    <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="">
            <div>
                <h1 class="text-5xl">Supplier Master</h1>
            </div>
        </div>
        <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
            <div><span class="capitalize">Imventory > Supplier Master</span></div>
        </div>
    </div>


    <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">

                <!-- Fields -->
                <div class="grid gap-10 md:grid-cols-2 lg:grid-cols-3">
                    <div class="flex space-x-5  ">
                        <lable for="txtSupplierName" class="my-auto w-1/2">Supplier Name </lable>
                        <input id="hdnSupplierID" type="hidden" />

                        <input id="txtSupplierName" placeholder="" class="bg-transparent border w-full border-classic-dimyellow my-2 " type="text" />

                    </div>

                    <div class="flex space-x-5">

                        <lable for="txtEmail" class="my-auto">EmailID </lable>

                        <input id="txtEmail" placeholder="" class="bg-transparent my-1 border w-full border-classic-dimyellow   px-1" type="text" />
                    </div>
                    <div class="flex space-x-5 w-full">

                        <lable for="txtContactNo" class="my-auto w-1/3">Contact No </lable>

                        <input id="txtContactNo" placeholder="example:- Slicer, Mixer" class="bg-transparent border my-1 font-thin w-full border-classic-dimyellow   px-1" type="text" />
                    </div>
                    <div class="flex space-x-5 w-full">

                        <lable for="txtContactPerson" class="my-auto w-1/2">Contact Person </lable>

                        <input id="txtContactPerson" placeholder="example:- Slicer, Mixer" class="bg-transparent border my-1 font-thin w-full border-classic-dimyellow px-1" type="text" />
                    </div>
                    <div class="flex space-x-5 w-full">

                        <lable for="txtGstNo" class="my-auto">GST No </lable>

                        <input id="txtGstNo" placeholder="example:- Slicer, Mixer" class="bg-transparent border my-1 font-thin w-full border-classic-dimyellow  px-1" type="text" />
                    </div>
                    <div class="flex space-x-5 w-full">

                        <lable for="TextAreaAddress" class="my-auto">Address </lable>
                        <textarea id="TextAreaAddress" class="bg-transparent border border-classic-dimyellow" cols="20" rows="2"></textarea>
                        <%--<input id="txtAddress" placeholder="example:- Slicer, Mixer" class="bg-transparent border font-thin w-full border-classic-dimyellow w-1/2 py-1 px-1"  type="text" />--%>
                    </div>
                </div>

                <!-- Fields End-->

                <!-- Buttons -->
                <div class="flex space-x-10">
                    <div class="">
                        <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Save" />
                    </div>
                    <div>
                        <input id="btnClear" class="border border-yellow-900 bg-transparents text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                    </div>
                </div>
                <!-- Buttons End-->




            </div>
        </div>

    </div>

    <!--Table Section-->
    <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <table class="table-fixed" id="tblStaff">
                <thead>
                    <tr>
                        <th>Sr.No</th>
                        <th>Supplier Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Conatct Person</th>
                        <th>GST No</th>
                        <th>Address</th>


                        <th class="justify-around">Actions</th>
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>Sr.No</th>
                        <th>Supplier Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Conatct Person</th>
                        <th>GST No</th>
                        <th>Address</th>


                        <th class="justify-around">Actions</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <!--Table Section End-->

    <section class="h-[500px]"></section>


    <script>
        // const { swal } = require("./Template/Js/sweetalert2@11");


        $(function () {
            table = $("#tblStaff").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })

            FillSupplierDetails(0);

        })

        function getBrowserData() {
            let data = navigator.appName;
            console.log(data)
        }




        function ClearFields() {

            $('#txtSupplierName').val("");
            $('#txtEmail').val("");
            $('#txtContactNo').val("");
            $('#txtContactPerson').val("");
            $('#txtGstNo').val("");

            $('#TextAreaAddress').val("");

            $('#hdnSupplierID').val("");

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }


        $("#btnSave").on('click', function () {
            debugger;

            var suppliername = $('#txtSupplierName');
            var email = $('#txtEmail');
            var contactno = $('#txtContactNo');
            var contactperson = $('#txtContactPerson');
            var gstno = $('#txtGstNo');

            var address = $('#TextAreaAddress');
            var supplierid = $('#hdnSupplierID');



            var Validate = FormValidation(suppliername, email, gstno, contactno, address);
            if (Validate == true) {

                var SupplierID = supplierid.val() == "" ? 0 : supplierid.val();
                var SupplierName = suppliername.val();
                var Email = email.val().trim();
                var ContactNo = contactno.val().trim();
                var ContactPerson = contactperson.val().trim();
                var GSTNo = gstno.val().trim();
                var Address = address.val().trim();


                $.ajax({

                    url: "WebServices/SupplierMasterWebService.asmx/SupplierMasterManage",
                    method: "POST",
                    data: "{SupplierID:" + JSON.stringify(SupplierID) + ", SupplierName:" + JSON.stringify(SupplierName) + ",Email:" + JSON.stringify(Email) + " ,ContactNo:" + JSON.stringify(ContactNo) + ",GSTNo:"+JSON.stringify(GSTNo)+",Address:" + JSON.stringify(Address) + ",ContactPerson:" + JSON.stringify(ContactPerson) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (result.includes("Success")) {
                            swal.fire({
                                icon: "success",
                                text: result,
                                background: '#27272a',
                            })
                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });
                FillSupplierDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var supplierid = $("#hdnSupplierID");

            if (supplierid.val() > 0) {

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

        function FillSupplierDetails(SupplierID) {
            $.ajax({

                url: "WebServices/SupplierMasterWebService.asmx/SupplierMasterGet",
                method: "POST",
                data: "{SupplierID:" + JSON.stringify(SupplierID) + "}",
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
            debugger;
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            table.clear();

            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";

                    strEditDelete += " <input class='bg-yellow-900 mx-2 2xl:py-3 2xl:px-5 text-center text-white py-1 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditSupplier(" + $(this).find("SupplierID").text() + ")' type='button' value='Edit' />";
                    strEditDelete += " <input class='bg-red-900 mx-2 2xl:py-3 2xl:px-5 text-center text-white py-1 px-3 hover:bg-red-600 cursor-pointer' onclick='DeleteSupplier(" + $(this).find("SupplierID").text() + ")' type='button' value='Delete' />";

                    // strEditDelete += " <input class='bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteSubCategory(" + $(this).find("DishID").text(), $(this).find("DishPhoto").text() + ")' type='button' value='Delete' />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("SupplierName").text(),
                        $(this).find("Email").text(),
                        $(this).find("ContactNo").text(),
                        $(this).find("ContactPerson").text(),
                        $(this).find("GSTNo").text(),
                        $(this).find("Address").text(),

                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditSupplier(SupplierID) {
            $.ajax({

                url: "WebServices/SupplierMasterWebService.asmx/SupplierMasterGet",
                method: "POST",
                data: "{SupplierID:" + JSON.stringify(SupplierID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillStaffDetails(0);

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnSupplierID]").val(Details.find("SupplierID").text());
            $("[id=txtSupplierName]").val(Details.find("SupplierName").text());
            $("[id=txtEmail]").val(Details.find("Email").text());
            $("[id=txtContactNo]").val(Details.find("ContactNo").text());
            $("[id=txtContactPerson]").val(Details.find("ContactPerson").text());
            $("[id=txtAddress]").val(Details.find("Address").text());


            $("[id*=txtSupplierName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteSupplier(SupplierID) {

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

                        url: "WebServices/SupplierMasterWebService.asmx/SupplierMasterDelete",
                        method: "POST",
                        data: "{SupplierID:" + JSON.stringify(SupplierID) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (result.includes("Success")) {
                                msg = result;
                                swal.fire({
                                    title: "Deleted",
                                    icon: "success",
                                    text: result,
                                    background: '#27272a',

                                })

                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });
                    FillSupplierDetails(0);
                    ClearFields();



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



        /* Form Validation Functions*/
        function FormValidation(suppliername, email, contactno, address) {
            var returnval = true;

            if (contactno.val() == "") {
                $('#txtContactNoWarning').text("*Please Select the ContactNo")
                returnval = false;
            }

            if (address.val() == "") {
                $('#TextAreaAddressWarning').text("*Please Select the Address")
                returnval = false;
            }

            if (suppliername.val() == "") {
                $('#txtSupplierNameWarning').text("*Please Enter the Supplier Name")
                returnval = false;
            }

            if (email.val() == "") {
                $('#txtEmailWarning').text("*Please Enter the Email")
                returnval = false;
            }



            return returnval;

        }






    </script>
</asp:Content>

