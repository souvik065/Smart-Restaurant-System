<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MaterialMaster.aspx.cs" Inherits="Admin_MaterialMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
        <!-- Header -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Material Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Dishes </span></div>
            </div>
        </div>
        <!-- Header End-->


        <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <div class="font-poppins-400 text-xl w-full space-y-12 px-5 py-5 font-bold">

                    <!-- Fields -->

                

                    <!--Other Fields -->
                    <div class="grid gap-11 grid-cols-1 xl:grid-cols-3 lg:grid-cols-2 md:grid-cols-1 ">
                        <!-- Material Category Name -->
                        <div class="flex space-x-5 w-full ">
                            <input id="hdnMaterialID" type="hidden" />
                            <lable for="ddlMaterialCategory" class="my-auto">Material Category </lable>
                            <div class="w-full">
                                <div><span id="ddlMaterialCategoryWarning" class="formerror text-red-600 text-sm"></span></div>

                                <select id="ddlMaterialCategory" onchange="FormValDropDown(this.id)" class="mx-auto  bg-transparent py-3 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                                    <option>--Select Category--</option>

                                </select>
                            </div>
                        </div>
                        <!-- Material Category Name End-->

                        <!-- Material Name-->
                        <div class="flex space-x-5 w-full ">
                            <lable for="txtMaterialName" class="my-auto w-1/5">Material Name </lable>
                            <div class="w-full">
                                <div><span id="txtMaterialNameWarning" class="formerror text-red-600  text-sm"></span></div>
                                <input id="txtMaterialName" onkeyup="FormValTextBox(this.id)" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                            </div>
                        </div>
                        <!-- Material Name End-->

                        <!-- Measured In -->
                        <div class="flex space-x-5 w-full ">
                            <lable for="txtMeasuredIn" class="my-auto w-1/5">Measured In </lable>
                            <div class="w-full">
                                <div><span id="txtMeasuredInWarning" class="formerror text-red-600  text-sm"></span></div>
                                <input id="txtMeasuredIn" onkeyup="FormValTextBox(this.id)" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                            </div>
                        </div>
                        <!-- Measured In End-->

                    </div>
                    <!--Other Fields End-->




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

        <!--Table Section-->
        <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <table class="table-fixed" id="tblMaterial">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Material Name</th>
                            <th>Material Category</th>
                            <th>Measured In</th>


                            <th class="justify-around">Actions</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Material Name</th>
                            <th>Material Category</th>
                            <th>Measured In</th>


                            <th class="justify-around">Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <!--Table Section End-->

    </section>
    <section class="h-[500px]"></section>

    <script>
        // const { swal } = require("./Template/Js/sweetalert2@11");


        $(function () {
            table = $("#tblMaterial").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillMaterialDetails(0);
            ListAllMaterialCategory();
        })

        function MaterialCategoryOnChange(id) {
            FormValDropDown(id)
        }


        function ClearFields() {

            $('#ddlMaterialCategory').val(0);
            $('#txtMaterialName').val("");
            $('#txtMeasuredIn').val("");
            $('#hdnMaterialID').val("");

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }


        $("#btnSave").on('click', function () {
            debugger;

            var materialcategoryid = $('#ddlMaterialCategory');
            var materialid = $('#hdnMaterialID');
            var materialname = $('#txtMaterialName');
            var measuredin = $('#txtMeasuredIn');


            var Validate = FormValidation(materialcategoryid, materialname, measuredin);
            if (Validate == true) {

                var MaterialID = materialid.val() == "" ? 0 : materialid.val();
                var MaterialCategoryID = materialcategoryid.val();
                var MaterialName = materialname.val().trim();
                var MeasuredIn = measuredin.val().trim();
                

                $.ajax({

                    url: "WebServices/MaterialMasterWebService.asmx/MaterialMasterManage",
                    method: "POST",
                    data: "{MaterialID:" + JSON.stringify(MaterialID) + ", MaterialName:" + JSON.stringify(MaterialName) + ",MeasuredIn:" + JSON.stringify(MeasuredIn) + " ,MaterialCategoryID:" + JSON.stringify(MaterialCategoryID) + "}",
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
                FillMaterialDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var materialid = $("#hdnMaterialID");

            if (materialid.val() > 0) {

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

        function FillMaterialDetails(MaterialID) {
            $.ajax({

                url: "WebServices/MaterialMasterWebService.asmx/MaterialMasterGet",
                method: "POST",
                data: "{MaterialID:" + JSON.stringify(MaterialID) + "}",
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

                    strEditDelete += " <input class='bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditMaterial(" + $(this).find("MaterialID").text() + ")' type='button' value='Edit' />";
                    strEditDelete += " <input class='bg-red-900 mx-2 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteMaterial(" + $(this).find("MaterialID").text() + ")' type='button' value='Delete' />";



                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("MaterialName").text(),
                        $(this).find("MaterialCategoryName").text(),
                        $(this).find("MeasuredIn").text(),
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditMaterial(MaterialID) {
            $.ajax({

                url: "WebServices/MaterialMasterWebService.asmx/MaterialMasterGet",
                method: "POST",
                data: "{MaterialID:" + JSON.stringify(MaterialID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillMaterialDetails(0);

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnMaterialID]").val(Details.find("MaterialID").text());
            $("[id=ddlMaterialCategory]").val(Details.find("MaterialCategoryID").text());
            $("[id=txtMaterialName]").val(Details.find("MaterialName").text());
            $("[id=txtMeasuredIn]").val(Details.find("MeasuredIn").text());

            $("[id*=txtMaterialName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteMaterial(MaterialD) {

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

                        url: "WebServices/MaterialMasterWebService.asmx/MaterialMasterDelete",
                        method: "POST",
                        data: "{MaterialID:" + JSON.stringify(MaterialD) + "}",
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
                    FillMaterialDetails(0);
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



        /* DropDown Filling Functions*/
        function ListAllMaterialCategory() {

            $.ajax({

                url: "WebServices/MaterialCategoryMasterWebService.asmx/ListAllMaterialCategory",
                method: "POST",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlMaterialCategory");
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


        /* Form Validation Functions*/
        function FormValidation(materialcategoryid, materialname, measuredin) {
            var returnval = true;
            debugger;
            if (materialcategoryid.val() == 0) {
                $('#ddlMaterialCategoryWarning').text("*Please Select the Material Catgoey Name");
                returnval = false;
            }


            if (materialname.val() == "") {
                $('#txtMaterialNameWarning').text("*Please Enter the Material Name")
                returnval = false;
            }

            if (measuredin.val() == "") {
                $('#txtMeasuredInWarning').text("*Please Enter the MeasuredIn")
                returnval = false;
            }


            return returnval;

        }

        function FormValTextBox(id) {
            if ($("#" + id).val() != "") {
                $("#" + id + "Warning").text("");
            }


        }

        function FormValDropDown(id) {
            if ($("#" + id).val() != 0) {
                $("#" + id + "Warning").text("");
            }


        }
        /* Form Validation Functions End*/


    </script>
</asp:Content>

