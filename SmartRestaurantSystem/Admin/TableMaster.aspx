<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TableMaster.aspx.cs" Inherits="Admin_TableMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="h-full">
        <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Table Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Category Master</span></div>
            </div>
        </div>

        <div>
            <div class="flex hidden py-3 text-classic-yellow font-poppins-400 font-bold px-3 shadow-2xl bg-classic-brown w-full">
                <div class="border border-b-2 py-3 px-5"><span>Add</span></div>
                <div class="border py-3 px-5"><span>View</span></div>
            </div>
            <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 ">
                <div class="w-full">
                    <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">
                        <!-- Fields -->
                        <!-- Table No -->

                        <div class="flex space-x-5 w-full text-center">
                            <div class="w-1/6">
                                <input id="hdnTableID" type="hidden" />
                                <lable for="" class="my-auto">Table No </lable>
                            </div>
                            <div class=" w-1/5">
                                <div><span id="txtTableNoWarning" class="formerror text-red-600  text-sm"></span></div>
                                <input id="txtTableNo" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400  border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                            </div>
                        </div>
                        <!-- Table No End-->

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
                    <table class="table-fixed" id="tblTable">
                        <thead>
                            <tr>
                                <th>Sr.No</th>
                                <th>Table No</th>
                                <th class="justify-around">Actions</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Sr.No</th>
                                <th>Table No</th>
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
            table = $("#tblTable").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillTableNoDetails(0);
        })

        

        function ClearFields() {
            $('#txtTableNo').val("");
            $('#hdnTableID').val("");

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }






        $("#btnSave").on('click', function () {
            var tableno = $('#txtTableNo');
            var tableid = $('#hdnTableID');

            var Validate = FormValidation(tableno);
            if (Validate == true) {
                var TableID = tableid.val() == "" ? 0 : tableid.val();
                var TableNo = tableno.val().trim();

                $.ajax({

                    url: "WebServices/TableMasterWebService.asmx/TableMasterManage",
                    method: "POST",
                    data: "{TableID:" + JSON.stringify(TableID) + ", TableNo:" + JSON.stringify(TableNo) + "}",
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
                FillTableNoDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var tableid = $("#hdnTableID");

            if (tableid.val() > 0) {

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

        function FillTableNoDetails(TableID) {
            $.ajax({

                url: "WebServices/TableMasterWebService.asmx/TableMasterGet",
                method: "POST",
                data: "{TableID:" + JSON.stringify(TableID) + "}",
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

                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditTableNo(" + $(this).find("TableID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteTableNo(" + $(this).find("TableID").text() + ")\" type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("TableNo").text(),
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditTableNo(TableID) {
            $.ajax({

                url: "WebServices/TableMasterWebService.asmx/TableMasterGet",
                method: "POST",
                data: "{TableID:" + JSON.stringify(TableID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillTableNoDetails(0);

        }


        function OnEditSuccess(response) {
            debugger;
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnTableID]").val(Details.find("TableID").text());
            $("[id=txtTableNo]").val(Details.find("TableNo").text());

            $("[id=txtTableNo]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteTableNo(TableID) {

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

                        url: "WebServices/TableMasterWebService.asmx/TableMasterDelete",
                        method: "POST",
                        data: "{TableID:" + JSON.stringify(TableID) + "}",
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
                    FillTableNoDetails(0);
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


        /* Form Validation Functions*/

        function FormValidation(tableno) {
            var returnval = true;
            debugger;
            if (tableno.val() == "") {
                $('#txtTableNoWarning').text("*Please Enter the Table No");
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

