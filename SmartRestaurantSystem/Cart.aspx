<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                                            <input type="radio" name="rbtnPaymentMode" id="rbtnOnline" value="Online"/>
                                            Online
                                        </label>
                                    </div>
                                    <div class="my-5">
                                        <label for="rbtnCash" class="text-2xl bg-classic-yellow cursor-pointer text-black font-bold py-1 px-2">
                                            <input type="radio" name="rbtnPaymentMode" id="rbtnCash" value="Cash"/>
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
                                <input type="button" class="bg-yellow-900 font-bold text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" onclick="OrderItem(TableNo);" name="btnmakepayement" value="Make Payment" />
                            </div>

                        </div>
                        <!-- Make Payment Button End-->

                    </div>
                </div>
            </div>
        </div>

    </section>

    <section class="h-full bg-restaurantly-brown text-white overflow-x-hidden px-5">
        <div class="flex  justify-center py-16">
            <div class="w-full text-classic-yellow">

                <div class="">
                    <!-- Section Title -->
                    <div class="section-title my-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 my-10">
                        <h2 class="title font-semibold text-gray-400 ">O R D E R S</h2>
                        <p id="title" class="font-playfair-display-700 text-5xl"></p>

                    </div>
                    <!-- Section Title End-->

                    <!-- Hidden Fields Start-->
                    <input id="hdnOrderID" type="hidden" />
                    <!-- Hidden Fields End-->


                    <!-- Order Table Start-->
                    <div class="sm:flex sm:space-x-5 ">

                        <!-- Table Start-->

                        <div class="w-full my-5  shadow-2xl text-classic-yellow font-poppins-400  bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                            <div class="w-full  h-full flex justify-center items-center" id="CartTable">
                                <%--<div class="my-auto  space-y-5">
                                    <div><h1 class="text-2xl font-bold">No Item has been Selected</h1></div>
                                    <div class="flex justify-center">
                                        <a  href="Menu.aspx">
                                        <label  class=" bg-classic-yellow text-white font-semibold py-2 px-3">
                                        Order Item 
                                        </label></a>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                        <!-- Table End-->



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
                                        <input id="placeorder" type="button" value="Place Order" class="w-full  bg-classic-yellow text-white font-bold py-2" />
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                    <!-- Order Table End -->

                </div>
            </div>
        </div>
    </section>

    <section>

        <input type="hidden" id="razorpay_payment_id" name="razorpay_payment_id" />
        <input type="hidden" id="razorpay_order_id" name="razorpay_order_id" />
        <input type="hidden" id="razorpay_signature" name="razorpay_signature" />

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </section>

    <script>

        function ClearData() {
            $("#txtCustomerContact").val("");
            $("#txtCustomerName").val("");
            $("#txtCustomerEmail").val("");
        }
        var TableNo = 1;

        $(function () {
            ClearData();
            FillCartDetails(1);

        })
        $("#placeorder").on("click", function () {

            $("#CustomerDetails").show();
        })
        function closeblock() {
            $("#CustomerDetails").hide();
        }
        var TotalAmt = 0;

        function FillCartDetails(TableID) {
            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/CartMasterGet",
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
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            TotalAmt = 0;

            if (Details.length < 0) {



            } else {

                var DivTag = ` <table class="table-fixed bg-transparent text-center items-center justify-center  w-full" id="tblOrders">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Item</th>
                            <th>Name</th>
                            <th>Qty</th>
                            <th>Price</th>
                            <th>Total</th>

                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Item</th>
                            <th>Name</th>
                            <th>Qty</th>
                            <th>Price</th>
                            <th>Total</th>

                        </tr>
                    </tfoot>
                </table>`

                $("#CartTable").html(DivTag);

                table = $("#tblOrders").DataTable({
                    responsive: true,
                    autoWidth: false,
                    "deferRender": true,
                    searching: false,
                    ordering: true,
                    paging: false,
                    info: false

                })

                table.clear();

            }

            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";

                    var qty = "";
                    var price = "";
                    var total = "";
                    strImage = "<div class='flex justify-center h-16 w-16 md:h-28 md:w-28 sm:h-24 sm:w-24'><img class='rounded-full '  src='../Assets/Images/" + $(this).find("DishPhoto").text() + "'  ></div>";
                    qty = `<div class="Qty flex justify-center" id="` + $(this).find("DishID").text() + `">
                            <div id="`+ $(this).find("CartID").text() + `">
                                <input type="button" id="`+ $(this).find("CartID").text() + `" value="-"  class=" Minusbtn bg-classic-yellow text-white font-bold w-5" />
                            </div>
                            <div>
                            <input type="text" id="`+ $(this).find("CartID").text() + `Qty" class="bg-transparent w-7 text-center text-gray-400 font-bold" value="` + $(this).find("Qty").text() + `"/>
                            </div>
                            <div id="`+ $(this).find("CartID").text() + `">
                            <input type="button" id="`+ $(this).find("CartID").text() + `" value="+" class="Plusbtn bg-classic-yellow text-white font-bold w-5" />
                            </div>
                          </div>
                        `;

                    price = `` + $(this).find("Price").text() + ` ₹`;
                    total = `` + $(this).find("Total").text() + ` ₹`;
                    //strEditDelete += " <input class='bg-yellow-900 mx-2 xl:py-3 xl:px-5 text-center text-white py-1 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditDish(" + $(this).find("DishID").text() + ")' type='button' value='Edit' />";
                    //strEditDelete += " <input class='bg-red-900 mx-2 xl:py-3 xl:px-5 text-center text-white py-1 px-3 hover:bg-red-600 cursor-pointer' onclick='DeleteDish(" + $(this).find("DishID").text() + ",\"" + $(this).find("DishPhoto").text() + "\")' type='button' value='Delete' />";

                    // strEditDelete += " <input class='bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteSubCategory(" + $(this).find("DishID").text(), $(this).find("DishPhoto").text() + ")' type='button' value='Delete' />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        strImage,
                        $(this).find("DishName").text(),
                        qty,
                        price,
                        total,


                    ]).draw(false);

                    TotalAmt += parseInt($(this).find("Total").text());

                })
            }
            else {
                table.clear().draw();
            }


            $("#totalitems").html(Details.length);
            $("#totalamt").html(TotalAmt);


            var plusbtns = [...document.querySelectorAll(".Plusbtn")];
            var minusbtns = [...document.querySelectorAll(".Minusbtn")];

            for (var plus of plusbtns) {
                plus.addEventListener("click", function (e) {
                    var qty = $("#" + e.target.id + "Qty");
                    var num = parseInt(qty.val());
                    num += 1;
                    qty.val(num);

                    UpdateQty($(this).parent().attr('id'), qty.val());

                    FillCartDetails(1);

                });
            }

            for (var minus of minusbtns) {
                minus.addEventListener("click", function (e) {
                    var qty = $("#" + e.target.id + "Qty");

                    if (qty.val() > 1) {
                        var num = parseInt(qty.val());
                        num = num - 1;
                        qty.val(num);

                        UpdateQty($(this).parent().attr('id'), qty.val());

                        FillCartDetails(1);

                    } else if (qty.val() == 1) {
                        var CartID = $(this).parent().attr('id');
                        swal.fire({
                            icon: "warning",
                            text: "Are you sure you want to remove this Item from Cart.",
                            background: '#27272a',
                            showCancelButton: true,
                            confirmButtonText: 'Yes, delete it!',
                            cancelButtonText: 'No, cancel!',
                            reverseButtons: true



                        }).then((result) => {
                            if (result.isConfirmed) {
                                var msg = "";
                                $.ajax({

                                    url: "../WebServices/CartMasterWebService.asmx/CartMasterDelete",
                                    method: "POST",
                                    data: "{CartID:" + JSON.stringify(CartID) + "}",
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
                                FillCartDetails(1);


                            }
                        })

                        FillCartDetails(1);

                    }


                });
            }

        }


        function UpdateQty(CartID, Qty) {
            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/UpdateQty",
                method: "POST",
                data: "{CartID:" + JSON.stringify(CartID) + ", Qty:" + JSON.stringify(Qty) + "}",
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

        function StartPayment(TableNo) {
            $.ajax({
                type: "post",
                url: 'Webservices/RazorpayWebService.asmx/InitiatePayment',
                data: '{TableID:' + JSON.stringify(TableNo) + '}',
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
                        swal({ title: "", text: "Your Cart Is Empty !!", type: "warning" }, function () { window.location = "Menu.aspx"; });

                    }
                    else {
                        callingRZP(result);
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }

        function callingRZP(customerInfo) {
            var options = {
                "name": "Restaurantly",
                "order_id": customerInfo["OrderID"],
                "image": "https://i.postimg.cc/t4t07zHP/Logo.jpg",
                "prefill": {
                    "name": customerInfo["CustomerName"],
                    "email": customerInfo["Email"],
                    "contact": "+91" + customerInfo["MobileNo"],
                },
                "theme": {
                    "color": "#0c0b09"
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

                var BillAmt = $("#totalamt").text().trim();
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



                //if (PaymentMode != null) {
                //    $.ajax({

                //        url: "../WebServices/OrderMasterWebService.asmx/OrderMasterInsert",
                //        method: "POST",
                //        data: "{TableNo:" + JSON.stringify(TabelNo) + ", BillAmt:" + JSON.stringify(BillAmt) + ", PaymentMode:" + JSON.stringify(PaymentMode) + "}",
                //        contentType: "application/json; charset=utf-8",
                //        dataType: "json",
                //        success: function (res) {
                //            var result = res.d;
                //            if (result.includes("error")) {
                //                console.log(result);
                //            } else if (!result.includes("error")) {
                //                msg = result;
                //                $("#hdnOrderID").val(msg);
                //                alert(msg);
                //            }
                //        },
                //        error: function (err) {
                //            console.log(err)
                //        }

                //    });
                //}

                $.ajax({
                    url: "../WebServices/OrderMasterWebService.asmx/OrderMasterInsert",
                    method: "POST",
                    data: "{TableNo:" + JSON.stringify(TabelNo) + ", BillAmt:" + JSON.stringify(BillAmt) + ", PaymentMode:" + JSON.stringify(PaymentMode) + "}",
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

        function InsertCustomerDetail() {
            var customername = $("#txtCustomerName");
            var mobileno = $("#txtMobileNo");
            var email = $("#txtEmail");

            var Validate = FormValidation(customername, mobileno, email);
            if (Validate == true) {

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
            
        }

        function OrderItem(TabelNo) {

            

            var BillAmt = $("#totalamt").text().trim();
            
            

                var PaymentMode = document.querySelector("input[name='rbtnPaymentMode']:checked");
                debugger;
                if (PaymentMode != null) {
                    PaymentMode = document.querySelector("input[name='rbtnPaymentMode']:checked").value;
                } else {
                    swal.fire({
                        icon: "warning",
                        text: "Please Select the Payment Mode.",
                        background: '#27272a',
                    })

                }


            if (PaymentMode == "Online") {

                    InsertCustomerDetail();
                    StartPayment(TableNo);

                } else if (PaymentMode == "Cash"){
                    InsertCustomerDetail();
                    $.ajax({

                        url: "../WebServices/OrderMasterWebService.asmx/OrderMasterInsert",
                        method: "POST",
                        data: "{TableNo:" + JSON.stringify(TabelNo) + ", BillAmt:" + JSON.stringify(BillAmt) + ", PaymentMode:" + JSON.stringify(PaymentMode) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (!result.includes("error")) {
                                msg = result;
                                $("#hdnOrderID").val(msg);
                                alert(msg);
                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });


                    InsertOrderDetails(TabelNo);
                }

         
            


        }

        function InsertOrderDetails(TableNo) {
            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/CartMasterGet",
                method: "POST",
                data: "{TableID:" + JSON.stringify(TableNo) + "}",
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

                        url: "../WebServices/OrderDetailMasterWebService.asmx/OrderDetailMasterInsert",
                        method: "POST",
                        data: "{OrderID:" + JSON.stringify(OrderID) + ", DishID:" + JSON.stringify($(this).find("DishID").text()) + ", Qty:" + JSON.stringify($(this).find("Qty").text()) + ", Rate:" + JSON.stringify($(this).find("Price").text()) + ", Total:" + JSON.stringify($(this).find("Total").text()) + "}",
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




            CartMasterDeleteAll(TableNo);

        }


        function CartMasterDeleteAll(TableNo) {
            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/CartMasterDeleteAll",
                method: "POST",
                data: "{TableNo:" + JSON.stringify(TableNo) + "}",
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
            FillCartDetails(TableNo);
        }

        function FormValidation(customername, mobileno, email) {
            var returnval = true;
            if (customername.val() == "") {
                $("#txtCustomerNameWarning").text("* Cutomer Should not be Empty ");
                returnval = false;
            }

            if (email.val() == "") {
                $("#txtEmailWarning").text("* Email Should not be Empty ");
                returnval = false;
            }

            if (mobileno.val() == "") {
                $("#txtMobileNoWarning").text("* MobilelNo  Should not be Empty ");
                returnval = false;
            }


            return returnval;
        }

    </script>

</asp:Content>

