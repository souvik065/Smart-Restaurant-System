<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   

    <section class="h-full bg-restaurantly-brown text-white overflow-x-hidden px-5">
        <div class="flex  justify-center py-16">
            <div class="w-full text-classic-yellow">

                <div class="">
                    <!-- Section Title -->
                    <div class="section-title my-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 my-10">
                        <h2 class="title font-semibold text-3xl text-gray-400 ">C A R T</h2>
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

    <form id="formPaymentSuccess" action="charge.aspx" runat="server">
        <input type="hidden" id="razorpay_payment_id" name="razorpay_payment_id" />
        <input type="hidden" id="razorpay_order_id" name="razorpay_order_id" />
        <input type="hidden" id="razorpay_signature" name="razorpay_signature" />


    </form>

    <section>
    </section>
   <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script>


        function ClearData() {
            $("#txtCustomerContact").val("");
            $("#txtCustomerName").val("");
            $("#txtCustomerEmail").val("");
        }


        $(document).ready(() => {
            FillCartDetails(localStorage.getItem("TableID"));


        });

        $(function () {
            ClearData();



        });





        $("#placeorder").on("click", function () {

            //$("#CustomerDetails").show();
            OrderItem();
            
        });

        function closeblock() {
            $("#CustomerDetails").hide();
        }
        var TotalAmt = 0;





        function FillCartDetails() {

            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/CartMasterGet",
                method: "POST",
                data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + "}",
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

                                UpdateCartDetail();

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


        

        function OrderItem() {
          
            var BillAmt = $("#totalamt").text().trim();
            localStorage.setItem("OrderID", null);

            swal.fire({
                icon: "info",
                text: "Are you sure. You Want to Place Order",
                background: '#27272a',
                showCancelButton: true,
                confirmButtonText: 'Yes',
                cancelButtonText: 'cancel!',
                reverseButtons: true



            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({

                        url: "../WebServices/OrderMasterWebService.asmx/OrderMasterInsert",
                        method: "POST",
                        data: "{TableID:" + JSON.stringify(localStorage.getItem("TableID")) + ", BillAmt:" + JSON.stringify(BillAmt) + ", PaymentMode:'',rzpPaymentID:'', rzpOrderID:'', rzpSignature:''}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (!result.includes("error")) {
                                msg = result;
                                localStorage.setItem("OrderID", result)
                                $("#hdnOrderID").val(result);
                                InsertOrderDetails();
                                UpdateCartDetail();
                                FillCartDetails();


                                swal.fire({
                                    icon: "success",
                                    title: "Order Placed Successfully",
                                    text: "Do you want to see your Order Status or Order Something Else.",
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
                        error: function (err) {
                            console.log(err)
                        }

                    });

                   

                    

                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    //swal.fire({
                    //    title: "Cancelled",
                    //    text: "Your Record is Safe :)",
                    //    icon: "info",
                    //    background: '#27272a',

                    //})

                }
            })




                    


                    
               


           
         


        }

        function InsertOrderDetails() {

            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/CartMasterGet",
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

            // $("#CustomerDetails").hide();

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
                        data: "{OrderID:" + JSON.stringify(OrderID) + ", DishID:" + JSON.stringify($(this).find("DishID").text()) + ",MeasureTypeID:" + JSON.stringify($(this).find("MeasureTypeID").text()) + ", Qty:" + JSON.stringify($(this).find("Qty").text()) + ", Rate:" + JSON.stringify($(this).find("Price").text()) + ", Total:" + JSON.stringify($(this).find("Total").text()) + "}",
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
            FillCartDetails();
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
       

    </script>

</asp:Content>

