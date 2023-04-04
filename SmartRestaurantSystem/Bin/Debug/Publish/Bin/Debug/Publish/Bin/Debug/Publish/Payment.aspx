<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
       .disable {
            pointer-events: none;
            color: grey;
            opacity: 0.6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" action="charge.aspx" runat="server">
        <%--    <section class="inner-section checkout-part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="account-card">
                        <div class="checkout-check">
                            <%--<input type="checkbox" id="checkout-check"><label for="checkout-check">By making this purchase you agree to our <a href="#">Terms and Conditions</a>.</label></div>
                            <div class="checkout-proced" style="text-align: center;">
                                <%--<button type="button" id="btnCheckOut" style="width: 50%; text-align: center;" class="btn btn-inline">OK</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
        <input type="hidden" id="razorpay_payment_id" name="razorpay_payment_id" />
        <input type="hidden" id="razorpay_order_id" name="razorpay_order_id" />
        <input type="hidden" id="razorpay_signature" name="razorpay_signature" />

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            $(function () {
                $.ajax({
                    type: "post",
                    url: 'Webservices/RazorpayWebService.asmx/InitiatePayment',
                    data: '{}',
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        var result = response.d;
                        console.log(result);
                        if (result["Msg"].includes("error")) {
                            console.log(result["Msg"]);
                        }
                        else if (result["Msg"].includes("Cart Empty")) {
                            swal({ title: "", text: "Your Cart Is Empty !!", type: "warning" }, function () { window.location = "shop.aspx"; });

                        }
                        else {
                            callingRZP(result);
                        }
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            });

            function callingRZP(customerInfo) {
                var options = {
                    "name": "S. Motiram Enterprise",
                    "order_id": customerInfo["OrderID"],
                    "image": "https://i.postimg.cc/t4t07zHP/Logo.jpg",
                    "prefill": {
                        "name": customerInfo["CustomerName"],
                        "email": customerInfo["EmailID"],
                        "contact": "+91" + customerInfo["MobileNo"],
                    },
                    "theme": {
                        "color": "#F37254"
                    }
                }

                // Boolean whether to show image inside a white frame. (default: true)
                options.theme.image_padding = false;
                options.handler = function (response) {
                    var paymentID = response.razorpay_payment_id;
                    var rzporderID = customerInfo["OrderID"];
                    var sign = response.razorpay_signature;

                    document.getElementById('razorpay_payment_id').value = paymentID;
                    document.getElementById('razorpay_order_id').value = rzporderID;
                    document.getElementById('razorpay_signature').value = sign;
                    $.ajax({
                        url: "WebServices/ClientOrderWebService.asmx/ManageOrderMaster",
                        method: "POST",
                        data: '{}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (result.includes("Cart Empty !!")) {
                                swal("", "Your Cart Is Empty !!", "warning");
                            }
                            else {
                                var OrderID = result;
                                $.ajax({
                                    type: "post",
                                    url: 'Webservices/ClientOrderWebService.asmx/PaymentSuccess',
                                    data: '{OrderID:' + JSON.stringify(OrderID) + ',rzpPaymentID: ' + JSON.stringify(paymentID) + ', rzpOrderID: ' + JSON.stringify(rzporderID) + ', rzpSignature: ' + JSON.stringify(sign) + '}',
                                    contentType: "application/json;charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        var result = response.d;
                                        console.log(result);
                                        if (result.includes("error"))
                                            console.log(result);
                                        else {
                                            $('body').addClass("disable");
                                            swal({
                                                title: "Processing Order...",
                                                text: 'Please Do Not Close This Page. Otherwise your order may not be Placed !!',
                                                type: "warning",
                                                showConfirmButton: false
                                            })
                                            SaveGeneralBill();
                                            SendInvoiceEmail();
                                            SendClientSMS();
                                            SendAdminSMS();
                                            $('body').removeClass("disable");
                                            $("#form1").submit();
                                        }
                                    },
                                    error: function (err) {
                                        console.log(err);
                                    }
                                });
                            }
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                    
                };
                options.modal = {
                    ondismiss: function () {
                        window.location.href = "PaymentFailure.aspx";
                    },
                    // Boolean indicating whether pressing escape key 
                    // should close the checkout form. (default: true)
                    escape: false,
                    // Boolean indicating whether clicking translucent blank
                    // space outside checkout form should close the form. (default: false)
                    backdropclose: false
                };

                var rzp = new Razorpay(options);
                rzp.on('payment.failed', function (response) {
                    window.location.href = "PaymentFailure.aspx";
                    console.log(response);
                    console.log(response.error.code);
                    console.log(response.error.description);
                    console.log(response.error.source);
                    console.log(response.error.step);
                    console.log(response.error.reason);
                    console.log(response.error.metadata.order_id);
                    console.log(response.error.metadata.payment_id);
                });
                rzp.open();
                e.preventDefault();

            }

            function SaveGeneralBill() {
                $.ajax({
                    type: "post",
                    url: 'Webservices/ClientOrderWebService.asmx/SaveGeneralBill',
                    data: '{}',
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        var result = response.d;
                        console.log(result);
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            }

            function SendInvoiceEmail() {
                window.open("Admin/PrintBill.aspx", "_blank");
            }

            function SendClientSMS() {
                $.ajax({
                    url: "WebServices/ClientOrderWebService.asmx/SendClientSMS",
                    method: "POST",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        var result = response.d;
                        console.log(result);
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            }

            function SendAdminSMS() {
                $.ajax({
                    url: "WebServices/ClientOrderWebService.asmx/SendAdminSMS",
                    method: "POST",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        var result = response.d;
                        console.log(result);
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            }
        </script>
    </form>
</asp:Content>

