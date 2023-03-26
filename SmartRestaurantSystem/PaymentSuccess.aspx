<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="PaymentSuccess.aspx.cs" Inherits="PaymentSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/invoice.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <section class="inner-section invoice-part py-14 flex justify-center">
            <div class="text-white ">
                <div class="row space-y-5s">
                    <div class="col-lg-12 text-3xl font-bold">
                        <br />
                        <div class="alert-info">
                            <h3>Thank you! We have recieved your order.</h3>
                        </div>
                    </div>
                    <div class="col-lg-12 font-semibold text-2xl">
                        <div class="account-card">
                            <div class="account-title">
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
            $(function () {
                for (i = 0; i < localStorage.length; i++) {
                    var KeyName = localStorage.key(i);
                    if (KeyName.includes('rzp')) {
                        localStorage.removeItem(KeyName);
                    }
                }
                FillOrderDetails();
            })

            

            function FillOrderDetails() {
                $.ajax({
                    url: "WebServices/ClientOrderWebService.asmx/GetOrderDetails",
                    method: "POST",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: OnOrderDetailsSuccess,
                    error: function (err) {
                        console.log(err);
                    }
                });
            }

            function OnOrderDetailsSuccess(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var details = xml.find("DataDetails");
                var divTag = "";
                var divTag1 = "";

                if (details.length > 0) {
                    $.each(details, function () {
                        divTag += "<h6>Order Number <span>" + $(this).find("InvoiceNo").text() + "</span></h6>";
                        divTag += "<h6>Order Date <span>" + $(this).find("OrderDate").text() + "</span></h6>";
                        divTag += "<h6>Total Amount <span>" + $(this).find("NetAmount").text() + "</span></h6>";
                        $("#orderDetails").html(divTag);

                        divTag1 += "<h5>" + $(this).find("DeliveryMessage").text() + "</h5>";
                        $("#deliveryMessage").html(divTag1);
                    });
                }
            }
        </script>
    </form>
</asp:Content>

