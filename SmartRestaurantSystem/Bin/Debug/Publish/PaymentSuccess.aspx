﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="PaymentSuccess.aspx.cs" Inherits="PaymentSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/invoice.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <section class="inner-section invoice-part py-14 flex justify-center py-10 my-14">
            <div class="text-white ">
                <div class="row space-y-5">
                    <div class=" flex justify-center">
                        <img src="Template/img/download%20(6).png" />
                    </div>
                    <div class="col-lg-12 text-3xl font-bold">
                        <br />
                        <div class="alert-info">
                            <h3>Thank you! We have recieved your order.</h3>
                        </div>
                    </div>
                    <div class="col-lg-12 font-semibold text-2xl">
                        <div class="account-card">
                            <div class="account-title  flex justify-center ">
                                <h4>order recieved</h4>
                            </div>
                            <div class="account-content">
                                <div class="invoice-recieved" id="orderDetails">
                                   
                                </div>
                                <br />
                                <div id="deliveryMessage" style="text-align:center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            var OrderID = "";
            var TableNo = 1;

            OrderID = localStorage.getItem("OrderID");

            $(function () {
                for (i = 0; i < localStorage.length; i++) {
                    var KeyName = localStorage.key(i);
                    if (KeyName.includes('rzp')) {
                        localStorage.removeItem(KeyName);
                    }
                }

                UpdatePaymentStatus(true, 'Online');
            })


            function InsertOrderDetails(TableNo) {
                $.ajax({

                    url: "WebServices/CartMasterWebService.asmx/CartMasterGet",
                    method: "POST",
                    data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnInsertOrderDetailsSuccess,
                    async: false,
                    error: function (err) {
                        console.log(err);
                    }

                });

            }

            function OnInsertOrderDetailsSuccess(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);

                var Details = xml.find("DataDetails");
                var OrderID = $("#hdnOrderID").val();

                if (Details.length > 0) {
                    $.each(Details, function () {

                        $.ajax({

                            url: "WebServices/OrderDetailMasterWebService.asmx/OrderDetailMasterInsert",
                            method: "POST",
                            data: "{OrderID:" + JSON.stringify(localStorage.getItem("OrderID")) + ", DishID:" + JSON.stringify($(this).find("DishID").text()) + ",MeasureTypeID:" + JSON.stringify($(this).find("MeasureTypeID").text()) + ", Qty:" + JSON.stringify($(this).find("Qty").text()) + ", Rate:" + JSON.stringify($(this).find("Price").text()) + ", Total:" + JSON.stringify($(this).find("Total").text()) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (res) {
                                var result = res.d;
                                if (result.includes("error")) {
                                    console.log(result);

                                } else if (!result.includes("error")) {
                                    msg = result;

                                }
                            },
                            error: function (err) {
                                console.log(err)
                            }

                        });


                    })



                }
                else {

                }



                CartMasterDeleteAll();

            }



            function CartMasterDeleteAll() {
                $.ajax({

                    url: "WebServices/CartMasterWebService.asmx/CartMasterDeleteAll",
                    method: "POST",
                    data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (result.includes("Success")) {
                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });
                
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
    </form>
</asp:Content>

