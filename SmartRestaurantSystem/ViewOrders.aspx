<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="" id="CustomerDetails" hidden>
        <div class=" absolute  w-full h-screen bg-black bg-opacity-50  flex  justify-center">
            <div class="md:w-2/5  w-full  mx-14 h-auto my-auto shadow-2xl shadow-white text-classic-yellow font-poppins-400  bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                <div id="closeButton" onclick="closeblock()" class=" flex  justify-end text-white font-bold right-0">
                    <div class=" px-2  cursor-pointer hover:bg-gray-500">
                        <span>X</span>
                    </div>
                </div>
                <div class="w-full  flex justify-center item-center">

                    <div class="space-y-5 w-full ">
                        <!-- Customer Details Start-->
                        <div class="space-y-5 w-full ">
                            <div class="font-semibold flex space-x-10">
                                <h4 class="text-2xl text-gray-400 font-bold">Customer Details</h4>
                            </div>
                            <!-- Customer Name  Start-->
                            <div class=" w-full  flex justify-center">
                                <div class="w-4/5">
                                    <div>
                                        <lable for="txtCustomerName" class="my-auto font-semibold">Name </lable>
                                        <span id="txtCustomerNameWarning" class="formerror  text-red-600  text-sm"></span>
                                    </div>
                                    <input id="txtCustomerName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow mr-5  py-1 px-2" type="text" placeholder="" />
                                </div>
                            </div>
                            <!-- Customer Name  End-->

                            <!--  Email  Start-->
                            <div class=" w-full  flex justify-center">
                                <div class="w-4/5">
                                    <div>
                                        <lable for="txtEmail" class="my-auto font-semibold">Email </lable>
                                        <span id="txtEmailWarning" class="formerror  text-red-600  text-sm"></span>
                                    </div>
                                    <input id="txtEmail" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow mr-5  py-1 px-2" type="text" />
                                </div>
                            </div>
                            <!--  Email  End-->

                            <!--  Contact No  Start-->
                            <div class=" w-full  flex justify-center">
                                <div class="w-4/5">
                                    <div>
                                        <lable for="txtMobileNo" class="my-auto font-semibold">Contact No.</lable>
                                        <span id="txtMobileNoWarning" class="formerror  text-red-600  text-sm"></span>
                                    </div>
                                    <input id="txtMobileNo" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow mr-5  py-1 px-2" type="text" placeholder="(+91)" />
                                </div>
                            </div>
                            <!--  Contact No  End-->
                        </div>
                        <!-- Customer Details End-->

                        <!-- Paymentmode Start-->
                        <div class="space-y-5 w-full ">
                            <div>
                                <h4 class="text-2xl  text-gray-400 font-bold">Payment Mode</h4>
                            </div>
                            <div class="font-semibold flex  justify-center">
                                <div class="flex space-x-10">
                                    <div class="my-5">
                                        <label for="rbtnOnline" class="text-2xl bg-classic-yellow cursor-pointer text-black font-bold py-1 px-2">
                                            <input type="radio" name="rbtnPaymentMode" id="rbtnOnline" value="Online" />
                                            Online
                                        </label>
                                    </div>
                                    <div class="my-5">
                                        <label for="rbtnCash" class="text-2xl bg-classic-yellow cursor-pointer text-black font-bold py-1 px-2">
                                            <input type="radio" name="rbtnPaymentMode" id="rbtnCash" value="Cash" />
                                            Cash
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Paymentmode End-->

                        <!-- Make Payment Button Start-->
                        <div class="font-semibold flex space-x-5  flex justify-center">
                            <div>
                                <input type="button" class="bg-yellow-900 font-bold text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" onclick="MakePayment();" name="btnmakepayement" value="Make Payment" />
                            </div>

                        </div>
                        <!-- Make Payment Button End-->

                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- Hidden Fields Start-->
    <input id="hdnPaymentMode" type="hidden" />
    <input id="hdnPayemntStatus" type="hidden" />
    <!-- Hidden Fields End-->

    

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

                <div class="sm:flex sm:space-x-5">
                    <div class="w-full my-5 shadow-2xl text-classic-yellow font-poppins-400  bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                        <div class="w-full flex justify-center">
                            <table class="table-fixed bg-transparent text-center items-center justify-center  w-full" id="tblViewOrderDetails">
                                <thead class="space-y-5">
                                    <tr>
                                        <th>Sr.No</th>
                                        <th>Dish Name</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                        <th>Total</th>


                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Sr.No</th>
                                        <th>Dish Name</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                        <th>Total</th>

                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <div class="sm:w-1/5 my-5  h-auto shadow-2xl text-classic-yellow font-poppins-400 bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                        <div class="w-full flex justify-center">
                            <div class="">
                                <div class="py-5 space-y-10">
                                    <div>
                                        <h4 class="text-xl font-bold lg:text-2xl">Total Item: <span class="font-semibold text-gray-400" id="totalitems"></span></h4>
                                    </div>
                                    <div>
                                        <h4 class="text-xl font-bold lg:text-2xl">Total Amount:<span class="font-semibold text-gray-400"> <span id="totalamt"></span><span>₹</span></span></h4>
                                    </div>

                                </div>
                                <div>
                                    <input id="btnMakePayment" type="button" onclick="" value="Make Payment" class="w-full  bg-classic-yellow text-white font-bold py-2" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>

      <form id="formpaymentsuccess" action="PaymentSuccess.aspx" runat="server">
        <input type="hidden" id="razorpay_payment_id" name="razorpay_payment_id" />
        <input type="hidden" id="razorpay_order_id" name="razorpay_order_id" />
        <input type="hidden" id="razorpay_signature" name="razorpay_signature" />


    </form>


    <!-- Table Ends -->
   <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script>
        $(function () {
            var table = $("#tblViewOrderDetails").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true,
                paging: false,
                info: false,
                searching: false,
            });

            ViewOrderStatus();


        });

        setInterval(function () {
            var table = $("#tblViewOrderDetails").DataTable
            ViewOrderStatus();

        }, 5000);

        function ViewOrderStatus() {


            $.ajax({
                url: "WebServices/OrderDetailMasterWebService.asmx/ViewOrderStatus",
                method: "POST",
                data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + "}",
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
            var table = $("#tblViewOrderDetails").DataTable();
            table.clear();

            var RowNumber = "";
            var TotalAmt = 0;


            if (Details.length > 0) {
                $.each(Details, function () {

                    RowNumber = `<div class="my-5">` + $(this).find("RowNumber").text() + `</div>`;


                    table.row.add([
                        RowNumber,
                        $(this).find("DishName").text(),
                        $(this).find("Qty").text(),
                        $(this).find("Status").text(),
                        $(this).find("Total").text()


                    ]).draw(false);

                    TotalAmt += parseInt($(this).find("Total").text());

                });
            } else {
                table.clear().draw();
            }

            $("#totalitems").html(Details.length);
            $("#totalamt").html(TotalAmt);

        }


        $("#btnMakePayment").on('click', function () {

            $("#CustomerDetails").show();

        });


        function MakePayment() {

            var customername = $("#txtCustomerName");
            var mobileno = $("#txtMobileNo");
            var email = $("#txtEmail");

            var Validate = FormValidation(customername, mobileno, email);
            if (Validate == true) {


                var PaymentMode = document.querySelector("input[name='rbtnPaymentMode']:checked");
                if (PaymentMode != null) {
                    PaymentMode = document.querySelector("input[name='rbtnPaymentMode']:checked").value;
                } else {
                    swal.fire({
                        icon: "warning",
                        text: "Please Select the Payment Mode.",
                        background: '#27272a',
                    })

                }

                if (PaymentMode != null) {
                    InsertCustomerDetail();
                    debugger;
                    if (PaymentMode == "Online") {

                        startpayment();
                    } else if (PaymentMode == "Cash") {
                        $('#hdnPayemntStatus').val(false);
                        $('#hdnPaymentMode').val("Cash");
                        UpdatePaymentStatus(false, 'Cash');


                       
                    }
                    
                    closeblock()

                    

                }

            }


        }

        function closeblock() {
            $("#CustomerDetails").hide();


        }


        function InsertCustomerDetail() {
            var customername = $("#txtCustomerName");
            var mobileno = $("#txtMobileNo");
            var email = $("#txtEmail");


            var CustomerName = customername.val().trim();
            var Email = email.val().trim();
            var MobileNo = mobileno.val().trim();

            $.ajax({

                url: "../WebServices/CustomerDetailMasterWebService.asmx/CustomerDetailMasterInsert",
                method: "POST",
                data: "{CustomerName:" + JSON.stringify(CustomerName) + ", Email:" + JSON.stringify(Email) + ", MobileNo:" + JSON.stringify(MobileNo) + "}",
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

        }


        function startpayment() {
            $.ajax({
                type: "POST",
                url: 'WebServices/RazorPayWebService.asmx/initiatepayment',
                data: '{TableID:' + JSON.stringify(localStorage.getItem("TableID")) + '}',
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var result = response.d;
                    console.log(result);
                    if (result["Msg"].includes("error")) {
                        console.log(result["msg"]);
                    }
                    else if (result["Msg"].includes("cart empty")) {
                        swal.fire({ title: "", text: "your cart is empty !!", type: "warning" }, function () { window.location = "menu.aspx"; });

                    }
                    else {
                        callingrzp(result);
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }

        function callingrzp(customerinfo) {
            debugger;
            var options = {
                "name": "Restaurantly",
                "order_id": customerinfo["OrderID"],
                "image": "https://i.postimg.cc/t4t07zhp/logo.jpg",
                "prefill": {
                    "name": customerinfo["CustomerName"],
                    "email": customerinfo["Email"],
                    "contact": "+91" + customerinfo["MobileNo"],
                },
                "theme": {
                    "color": "#0c0b09"
                }
            }

            // boolean whether to show image inside a white frame. (default: true)
            debugger;
            options.theme.image_padding = false;
            options.handler = function (response) {
                var paymentid = response.razorpay_payment_id;
                var rzporderid = customerinfo["orderid"];
                var sign = response.razorpay_signature;
                document.getElementById('razorpay_payment_id').value = paymentid;
                document.getElementById('razorpay_order_id').value = rzporderid;
                document.getElementById('razorpay_signature').value = sign;

                var billamt = $("#totalamt").text().trim();
                var paymentmode = document.querySelector("input[name='rbtnpaymentmode']:checked");

                //if (paymentmode != null) {
                //    paymentmode = document.querySelector("input[name='rbtnpaymentmode']:checked").value;
                //} else {
                //    swal.fire({
                //        icon: "warning",
                //        text: "please select the payment mode.",
                //        background: '#27272a',
                //    })

                //}

                $("#formpaymentsuccess").submit();

            };
            options.modal = {
                ondismiss: function () {
                    window.location.href = "paymentfailure.aspx";
                },
                // boolean indicating whether pressing escape key 
                // should close the checkout form. (default: true)
                escape: false,
                // boolean indicating whether clicking translucent blank
                // space outside checkout form should close the form. (default: false)
                backdropclose: false
            };

            var rzp = new Razorpay(options);
            rzp.on('payment.failed', function (response) {
                window.location.href = "paymentfailure.aspx";
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



            e.preventdefault();

        }


        function FormValidation(customername, mobileno, email) {
            var returnval = true;
            var emailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            var mobilenoRegex = /^(0|91)?[6-9][0-9]{9}$/;

            if (customername.val() == "") {
                $("#txtCustomerNameWarning").text("* Cutomer Should not be Empty ");
                returnval = false;
            }

            if (email.val() == "") {
                $("#txtEmailWarning").text("* Email Should not be Empty ");
                returnval = false;
            } else
                if (!emailRegex.test(email.val())) {
                    $("#txtEmailWarning").text("* Invalid Email Address. ");
                    returnval = false;
                }

            if (mobileno.val() == "") {
                $("#txtMobileNoWarning").text("* MobilelNo  Should not be Empty ");
                returnval = false;


            } else if (!mobilenoRegex.test(mobileno.val())) {
                $("#txtMobileNoWarning").text("* Invalid Mobile No. ");
                returnval = false;
            }

            return returnval;
        }


        function UpdatePaymentStatus(PaymentStatus, PaymentMode){

            //var PaymentStatus = $('#hdnPayemntStatus');
            //var PaymentMode = $('#hdnPaymentMode');

            $.ajax({

                url: "WebServices/OrderMasterWebService.asmx/UpdatePaymentStatus",
                method: "POST",
                data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + ", PaymentStatus:" + JSON.stringify(PaymentStatus)+", PaymentMode:"+JSON.stringify(PaymentMode)+"}",
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



        function UpdateCartDetail() {
            $.ajax({

                url: "WebServices/CartMasterWebService.asmx/CartMasterGet",
                method: "POST",
                data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnUpdateCartDetailSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }


        function OnUpdateCartDetailSuccess(response) {
           
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            var TotalAmt = 0;
            var TotalItems = 0;

            if (Details.length > 0) {
                $("#lblCartCount").html(Details.length);
                $("#lblCartTotalItem").html(Details.length);

            }


            if (Details.length > 0) {
                $.each(Details, function () {

                    TotalAmt += parseInt($(this).find("Total").text());

                })

                $("#lblCartTotalAmount").html(TotalAmt);

            }
            else {

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

