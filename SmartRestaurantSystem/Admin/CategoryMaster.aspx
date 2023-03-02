<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="Admin_CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="h-full">
        <!--Page Heading -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class=" text-5xl">Category Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Category Master</span></div>
            </div>
        </div>
        <!--Page Heading End-->

        <div>
            <div class="flex py-3 hidden text-classic-yellow font-poppins-400 font-bold px-3 shadow-2xl bg-classic-brown w-full">
                <div class="border border-b-2 py-3 px-5"><span>Add</span></div>
                <div class="border py-3 px-5"><span>View</span></div>
            </div>
            <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 ">
                <div class="w-full">
                    <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">
                        <input id="hdnCategoryID" type="hidden" />

                        <!-- Fields -->
                        <div class="  w-full">

                            <lable for="" class="my-auto">Category Name</lable><span id="categorynameval" class="formerror text-red-600  text-sm"></span>

                            <input id="txtCategoryName" class="bg-transparent text-gray-400  border w-1/2 border-classic-dimyellow  py-1 px-2" type="text" />


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

            <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
                <div class="w-full">
                    <table class="table-fixed" id="tblCategory">
                        <thead>
                            <tr>
                                <th>Sr.No</th>
                                <th>Category Name</th>
                                <th class="justify-around">Actions</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Sr.No</th>
                                <th>Category Name</th>
                                <th>Actions</th>
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
            table = $("#tblCategory").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillCategoryDetails(0);
        })

        function FormValidation(categoryname) {
            var returnval = true;
            if (categoryname.val() == "") {
                $("#categorynameval").text("* Category Name Should not be Empty ");
                returnval = false;
            }

            return returnval;
        }

        function ClearFields() {
            $('#txtCategoryName').val("");
            $('#hdnCategoryID').val("");

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }






        $("#btnSave").on('click', function () {
            var categoryname = $('#txtCategoryName');
            var categoryid = $('#hdnCategoryID');

            var Validate = FormValidation(categoryname);
            if (Validate == true) {
                var CategoryID = categoryid.val() == "" ? 0 : categoryid.val();
                var CategoryName = categoryname.val().trim();

                $.ajax({

                    url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterManage",
                    method: "POST",
                    data: "{CategoryID:" + JSON.stringify(CategoryID) + ", CategoryName:" + JSON.stringify(CategoryName) + "}",
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
                FillCategoryDetails(0);
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

        function FillCategoryDetails(CategoryID) {
            $.ajax({

                url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterGet",
                method: "POST",
                data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
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

                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditCategory(" + $(this).find("CategoryID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteCategory(" + $(this).find("CategoryID").text() + ")\" type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("CategoryName").text(),
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditCategory(CategoryID) {
            $.ajax({

                url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterGet",
                method: "POST",
                data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillCategoryDetails(0);

        }


        function OnEditSuccess(response) {
            debugger;
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnCategoryID]").val(Details.find("CategoryID").text());
            $("[id=txtCategoryName]").val(Details.find("CategoryName").text());

            $("[id=txtCategoryName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteCategory(CategoryID) {

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

                        url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterDelete",
                        method: "POST",
                        data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (result.includes("Success")) {
                                msg = result;
                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });
                    FillCategoryDetails(0);
                    ClearFields();

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





    </script>

</asp:Content>

