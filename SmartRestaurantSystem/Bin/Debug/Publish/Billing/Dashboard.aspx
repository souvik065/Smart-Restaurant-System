﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Billing/BillingMasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Kitchen_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Heading -->
    <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="">
            <div>
                <h1 class=" text-5xl">Billing</h1>
            </div>
        </div>
        <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
            <div><span class="capitalize"></span></div>
        </div>
    </div>
    <!--Page Heading End-->
    <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
        <div class="w-full">
            <table class="table-fixed" id="tblOrders">
                <thead>
                    <tr>
                        <th>Sr.No</th>
                        <th>OrderDate</th>
                        <th>TableNo</th>
                        <th>OrderID</th>
                        <th>Total</th>
                      
                        <th>Action</th>
                       
                        
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>Sr.No</th>
                        <th>OrderDate</th>
                        <th>TableNo</th>
                        <th>OrderID</th>
                        <th>Total</th>

                        <th>Action</th>

                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <section class="h-64"></section>

    <script>

        $(function () {
            table = $("#tblOrders").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true,
                paging: false,
                searching: false,
                ordering: false,
                info: false,
            })
            ListAllCashPayments();
        })


        setInterval(function () {
            var table = $("#tblOrders").DataTable

            ListAllCashPayments();

        }, 5000);

        // ListAllCashPayments Orders
        function ListAllCashPayments() {
            $.ajax({

                url: "../WebServices/OrderMasterWebService.asmx/ListAllCashPayments",
                method: "POST",
                data: "{}",
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


                    //var strEditDelete = "";
                    //strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditCategory(" + $(this).find("CategoryID").text() + ")\" type='button' value=\"Edit\" />";
                    //strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteCategory(" + $(this).find("CategoryID").text() + ")\" type='button' value=\"Delete\" />";
                    var btnStatus = "";
                    btnStatus = ` <input type="button" onclick="OrderStatusUpdate(` + $(this).find("OrderID").text() + `)" value="` + $(this).find("OrderId").text() + `" class="bg-yellow-900 text-white hover:bg-yellow-700 cursor-pointer font-semibold py-1 px-6"/>`;

                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("OrderDate").text(),
                        $(this).find("TableNo").text(),
                        $(this).find("OrderID").text(),
                        $(this).find("Total").text(),
                        btnStatus

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }


        function UpdatePaymentStatus(PaymentStatus, PaymentMode) {

            //var PaymentStatus = $('#hdnPayemntStatus');
            //var PaymentMode = $('#hdnPaymentMode');

            $.ajax({

                url: "WebServices/OrderMasterWebService.asmx/UpdatePaymentStatus",
                method: "POST",
                data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + ", PaymentStatus:" + JSON.stringify(PaymentStatus) + ", PaymentMode:" + JSON.stringify(PaymentMode) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var result = res.d;
                    if (result.includes("error")) {
                        console.log(result);
                    } else if (result.includes("Success")) {
                        ViewOrderStatus();

                        swal.fire({
                            icon: "success",
                            title: "Order Payment Mode Cash",
                            text: "You have to proceed your Payment to the Bill Counter",
                            showDenyButton: true,
                            background: '#27272a',
                            showCancelButton: true,
                            denyButtonText: 'Menu',
                            confirmButtonText: 'Order Status',
                            cancelButtonText: 'No, cancel!',
                            reverseButtons: true



                        }).then((result) => {
                            if (result.isConfirmed) {

                                location.href = "ViewOrders.aspx";



                            } else if (result.isDenied) {

                                location.href = "Menu.aspx";


                            } else if (result.dismiss === Swal.DismissReason.cancel) {


                            }
                        });

                    }
                },

                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

        }

        function OrderStatusUpdate(OrderDetailID) {

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

                        url: "../WebServices/OrderDetailMasterWebService.asmx/OrderDetailStatusUpdate",
                        method: "POST",
                        data: "{OrderDetailID:" + JSON.stringify(OrderDetailID) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        async: false,
                        error: function (err) {
                            console.log(err);
                        }

                    });
                    DisplayOrders();


                } 

                }
            );
            


        }


        function UpdatePaymentStatus(PaymentStatus, PaymentMode) {

            //var PaymentStatus = $('#hdnPayemntStatus');
            //var PaymentMode = $('#hdnPaymentMode');

            $.ajax({

                url: "WebServices/OrderMasterWebService.asmx/UpdatePaymentStatus",
                method: "POST",
                data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + ", PaymentStatus:" + JSON.stringify(PaymentStatus) + ", PaymentMode:" + JSON.stringify(PaymentMode) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var result = res.d;
                    if (result.includes("error")) {
                        console.log(result);
                    } else if (result.includes("Success")) {
                        ViewOrderStatus();

                        swal.fire({
                            icon: "success",
                            title: "Order Payment Mode Cash",
                            text: "You have to proceed your Payment to the Bill Counter",
                            showDenyButton: true,
                            background: '#27272a',
                            showCancelButton: true,
                            denyButtonText: 'Menu',
                            confirmButtonText: 'Order Status',
                            cancelButtonText: 'No, cancel!',
                            reverseButtons: true



                        }).then((result) => {
                            if (result.isConfirmed) {

                                location.href = "ViewOrders.aspx";



                            } else if (result.isDenied) {

                                location.href = "Menu.aspx";


                            } else if (result.dismiss === Swal.DismissReason.cancel) {


                            }
                        });

                    }
                },

                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

        }

    </script>
</asp:Content>

