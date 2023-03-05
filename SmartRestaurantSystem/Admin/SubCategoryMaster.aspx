<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SubCategoryMaster.aspx.cs" Inherits="Admin_SubCategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="h-full">
        <!-- Page Heading -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Sub-Category Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Sub-Category Master</span></div>
            </div>
        </div>
        <!-- Page Heading End -->

        <!-- Form Content -->
        <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">

                    <!-- Fields -->
                     <!--Image Preview-->
                        <div class="md:flex md:justify-start  mx-5 justify-center">
                            <div class="text-center min-w-[15rem] max-w-[20rem] h-full rounded-lg overflow-hidden ">
                                <div><span id="imgCategoryPhotoWarning" class="formerror text-red-600  text-sm"></span></div>

                                <label for="fuCategoryPhoto" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:bg-bray-800 bg-gray-700 hover:bg-gray-100 border-gray-600 hover:border-gray-500 hover:bg-gray-600">
                                    <img id="imgCategoryPhoto" alt="" onchange="FormValTextBox(this.id)" src="#" style="display: none;" class="h-full w-full" />
                                    <div class="ImagePreviewLabel  flex flex-col items-center justify-center absolute pt-5 pb-6">
                                        <svg aria-hidden="true" class="w-10 h-10 mb-3 text-gray-400" fill="none" stroke="currentcolor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 16a4 4 0 01-.88-7.903a5 5 0 1115.9 6l16 6a5 5 0 011 9.9m15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                                        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400"><span class="font-semibold">click to upload</span> or drag and drop</p>
                                        <p class="text-xs text-gray-500 dark:text-gray-400">png or jpg  (max. 800x400px)</p>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <!--Image Preview End-->

                    <div class="grid gap-10 md:grid-cols-2 ">
                        <div class=" w-full ">
                            <input id="hdnSubCategoryID" type="hidden" />
                            <lable for="ddlCategory" class="my-auto w-1/3">Category Name</lable><span id="ddlCategoryWarning" class="formerror text-red-600 text-sm"></span>

                            <select id="ddlCategory" onchange="FormValDropDown(this.id)" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                <option>--Selesct Category--</option>

                            </select>
                        </div>
                        <div class=" w-full">

                            <lable for="txtSubCategoryName" class="my-auto">Sub-Category Name</lable><span id="txtSubCategoryNameWarning" class="formerror text-red-600  text-sm"></span>

                            <input id="txtSubCategoryName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                        </div>
                    </div>
                    <!-- Fields End -->

                    <!-- Action buttons -->
                    <div class="flex space-x-10">
                        <div class="">
                            <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Save" />
                        </div>
                        <div>
                            <input id="btnClear" class="border border-yellow-900 bg-transparent text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                        </div>
                    </div>
                    <!--Action Buttons End-->





                </div>


            </div>

        </div>
        <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <table class="table-fixed" id="tblSubCategory">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th class="justify-around">Actions</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!--Form Content End-->
    </section>
    <section class="h-[500px]"></section>



    <script>
        $(function () {
            table = $("#tblSubCategory").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillSubCategoryDetails(0);
            ListAllCategory();
        })






        function ClearFields() {
            $('#ddlCategory').val(0);
            $('#txtSubCategoryName').val("");
            $('#hdnSubCategoryID').val("");

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }








        $("#btnSave").on('click', function () {
            debugger;
            var categoryid = $('#ddlCategory');
            var subcategoryid = $('#hdnSubCategoryID');
            var subcategoryname = $('#txtSubCategoryName');

            var Validate = FormValidation(subcategoryname, categoryid);
            if (Validate == true) {

                var SubCategoryID = subcategoryid.val() == "" ? 0 : subcategoryid.val();
                var CategoryID = categoryid.val();
                var SubCategoryName = subcategoryname.val().trim();

                $.ajax({

                    url: "../WebServices/SubCategoryMasterWebService.asmx/SubCategoryMasterManage",
                    method: "POST",
                    data: "{SubCategoryID:" + JSON.stringify(SubCategoryID) + ",CategoryID:" + JSON.stringify(CategoryID) + " ,SubCategoryName:" + JSON.stringify(SubCategoryName) + "}",
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
                FillSubCategoryDetails(0);
                ClearFields();
            }


        });


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

        function FillSubCategoryDetails(CategoryID) {
            $.ajax({

                url: "../WebServices/SubCategoryMasterWebService.asmx/SubCategoryMasterGet",
                method: "POST",
                data: "{SubCategoryID:" + JSON.stringify(CategoryID) + "}",
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

                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditSubCategory(" + $(this).find("SubCategoryID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteSubCategory(" + $(this).find("SubCategoryID").text() + ")\" type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("CategoryName").text(),
                        $(this).find("SubCategoryName").text(),

                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditSubCategory(SubCategoryID) {
            $.ajax({

                url: "../WebServices/SubCategoryMasterWebService.asmx/SubCategoryMasterGet",
                method: "POST",
                data: "{SubCategoryID:" + JSON.stringify(SubCategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillSubCategoryDetails(0);

        }


        function OnEditSuccess(response) {
            debugger;
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnSubCategoryID]").val(Details.find("SubCategoryID").text());
            console.log(Details.find("SubCategoryID").text());
            $("[id=txtSubCategoryName]").val(Details.find("SubCategoryName").text());
            $("#ddlCategory").val(Details.find("CategoryID").text());

            $("[id=txtSubCategoryName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteSubCategory(SubCategoryID) {

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

                        url: "../WebServices/SubCategoryMasterWebService.asmx/SubCategoryMasterDelete",
                        method: "POST",
                        data: "{SubCategoryID:" + JSON.stringify(SubCategoryID) + "}",
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
                    FillSubCategoryDetails(0);
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

        function ListAllCategory() {

            $.ajax({

                url: "../WebServices/CategoryMasterWebService.asmx/ListAllCategory",
                method: "POST",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlCategory");
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

        function FormValidation(subcategoryname, categoryid) {
            var returnval = true;
            debugger;
            if (subcategoryname.val() == "") {
                $('#txtSubCategoryNameWarning').text("*Please Enter the SubCategory Name");
                returnval = false;
            }

            if (categoryid.val() == 0) {
                $('#ddlCategoryWarning').text("*Please Select the Catgoey Name")
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

