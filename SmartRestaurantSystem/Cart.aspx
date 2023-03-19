<%@ Page Title="" Language="VB" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="h-full bg-restaurantly-brown text-white overflow-x-hidden px-5">
        <div class="flex  justify-center py-16">
            <div class="w-full text-classic-yellow">

                <div class="">
                    <!-- Section Title -->
                    <div class="section-title my-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 my-10">
                        <h2 class="title font-semibold text-gray-400 ">O R D E R S</h2>
                        <p id="title" class="font-playfair-display-700 text-5xl"></p>
                        <div>
                            <input type="button" id="Minusbtn" value="-" class="bg-classic-yellow text-white font-bold w-5" />
                            <input type="text" id="txtQty" class="bg-transparent w-7 text-center text-gray-400 font-bold" value="1" />
                            <input type="button" id="Plusbtn" value="+" class="bg-classic-yellow text-white font-bold w-5" />



                        </div>
                    </div>
                    <!-- Section Title End-->


                    <!-- Order Table Start-->
                    <div class="sm:flex sm:space-x-5 ">

                        <!-- Table Start-->

                        <div class="w-full my-5  shadow-2xl text-classic-yellow font-poppins-400  bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                            <div class="w-full flex justify-center">
                                <table class="table-fixed bg-transparent text-center items-center justify-center  w-full" id="tblOrders">
                                    <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Item</th>
                                            <th>Name</th>
                                            <th >Qty</th>
                                            <th >Price</th>
                                            <th>Total</th>

                                        </tr>
                                    </thead>

                                    <tfoot>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Item</th>
                                            <th>Name</th>
                                            <th >Qty</th>
                                            <th >Price</th>
                                            <th>Total</th>

                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!-- Table End-->


                        <div class="sm:w-1/5 my-5  h-auto shadow-2xl text-classic-yellow font-poppins-400 bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                            <div class="w-full flex justify-center">
                                <div class="">
                                    <div class="py-5 space-y-10">
                                        <div>
                                            <h4 class="text-2xl">Total Item: <span id="totalitems"></span></h4>
                                        </div>
                                        <div>
                                            <h4 class="text-2xl">Total Amount: <span id="totalamt"> </span> ₹</h4>
                                        </div>

                                    </div>
                                    <div>
                                        <input type="button" value="Place Order" class="w-full  bg-classic-yellow text-white font-bold py-2" />
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

    <script>
        $(function () {
            table = $("#tblOrders").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillCartDetails(1);


        })

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
            table.clear();
            TotalAmt = 0;
            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";

                    var qty = "";
                    var price = "";
                    var total = "";
                    strImage = "<div class='flex justify-center h-16 w-16 md:h-28 md:w-28 sm:h-24 sm:w-24'><img class='rounded-full '  src='../Assets/Images/" + $(this).find("DishPhoto").text() + "'  ></div>";
                    qty = `<div class="Qty flex justify-center" id="` + $(this).find("DishID").text() + `">
                            <div id="`+ $(this).find("CartID").text()+`">
                                <input type="button" id="`+ $(this).find("CartID").text() + `" value="-"  class=" Minusbtn bg-classic-yellow text-white font-bold w-5" />
                            </div>
                            <div>
                            <input type="text" id="`+ $(this).find("CartID").text() + `Qty" class="bg-transparent w-7 text-center text-gray-400 font-bold" value="` + $(this).find("Qty").text() + `"/>
                            </div>
                            <div id="`+ $(this).find("CartID").text() +`">
                            <input type="button" id="`+ $(this).find("CartID").text() + `" value="+" class="Plusbtn bg-classic-yellow text-white font-bold w-5" />
                            </div>
                          </div>
                        `;

                    price = `` + $(this).find("Price").text() +` ₹`;
                    total = `` + $(this).find("Total").text() +` ₹`;
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
                                            msg = result;
                                        }
                                    },
                                    error: function (err) {
                                        console.log(err)
                                    }

                                });

                            } 
                        })

                    }

                    FillCartDetails(1);

                });
            }

        }


        function UpdateQty(CartID, Qty) {
            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/UpdateQty",
                method: "POST",
                data: "{CartID:" + JSON.stringify(CartID) + ", Qty:"+JSON.stringify(Qty)+"}",
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
    </script>
</asp:Content>

