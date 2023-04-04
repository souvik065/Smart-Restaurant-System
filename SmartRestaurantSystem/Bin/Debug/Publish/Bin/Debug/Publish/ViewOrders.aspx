<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Table Start-->
    <section class="h-full bg-restaurantly-brown text-white overflow-x-hidden px-5">
        <div class="flex  justify-center py-16">
            <div class="w-full text-classic-yellow">
                <!--Page Heading -->
                <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
                    <div class="">
                        <div>
                            <h1 class=" text-5xl">YOUR ORDERS</h1>
                        </div>
                    </div>
                    <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                        <div><span class="capitalize"></span></div>
                    </div>
                </div>
                <!--Page Heading End-->
                <div class="w-full my-10 shadow-2xl text-classic-yellow font-poppins-400  bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                    <div class="w-full flex justify-center">
                        <table class="table-fixed bg-transparent text-center items-center justify-center  w-full" id="tblViewOrders">
                            <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Dish Name</th>
                                    <th>Quantity</th>
                                    <th>Status</th>

                                </tr>
                            </thead>

                            <tfoot>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Dish Name</th>
                                    <th>Quantity</th>
                                    <th>Status</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Table Ends -->
    <script>
        $(function () {
            var table = $("#tblViewOrders").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true,
                paging: false,
                info: false,
                searching: false,
            });

            ViewOrderStatus(1);


        });

        setInterval(function () {
            var table = $("#tblViewOrders").DataTable

            ViewOrderStatus();

        }, 5000);

        function ViewOrderStatus() {


            $.ajax({
                url: "WebServices/OrderDetailMasterWebService.asmx/ViewOrderStatus",
                method: "POST",
                data: "{TableNo:" + JSON.stringify(localStorage.getItem("TableID")) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                error: function (err) {
                    console.log(err);
                }
            });
        }

        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            var table = $("#tblViewOrders").DataTable();
            table.clear();

            if (Details.length > 0) {
                $.each(Details, function () {
                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("DishName").text(),
                        $(this).find("Quantity").text(),
                        $(this).find("Status").text()
                    ]).draw(false);
                });
            } else {
                table.clear().draw();
            }
        }




        //$(function () {
        //    table = $("#tblViewOrders").DataTable({
        //        responsive: true,
        //        autoWidth: false,
        //        "deferRender": true,
        //        paging: false,
        //        info: false,
        //        searching: false,

        //    });
        //    ViewOrderStatus(1);
        //    setInterval( function (){
        //       table.ajax.reload();

        //    }, 30000);

        //})
        //// List Order Status
        //function ViewOrderStatus(TableNo)
        //{
        //    $.ajax({

        //        url: "WebServices/OrderDetailMasterWebService.asmx/ViewOrderStatus",
        //        method: "POST",
        //        data: "{TableNo:" + JSON.stringify(TableNo) + "}",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: OnSuccess,
        //        error: function (err) {
        //            console.log(err)
        //        }

        //    });

        //}
        //function OnSuccess(response) {
        //    var xmlDoc = $.parseXML(response.d);
        //    var xml = $(xmlDoc);

        //    var Details = xml.find("DataDetails");
        //    table.clear();

        //    if (Details.length > 0) {
        //        $.each(Details, function () {

        //            table.row.add([
        //                $(this).find("RowNumber").text(),
        //                $(this).find("DishName").text(),
        //                $(this).find("Quantity").text(),
        //                $(this).find("Status").text()
        //            ]).draw(false);
        //        })
        //    }
        //    else {
        //        table.clear().draw();
        //    }

        //}
    </script>
</asp:Content>

