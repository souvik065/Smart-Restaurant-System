<%@ Page Title="" Language="VB" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="false" CodeFile="Orders.aspx.vb" Inherits="Orders" %>

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
                                            <th class="">Qty</th>
                                            <th class="">Price</th>

                                        </tr>
                                    </thead>

                                    <tfoot>
                                        <tr>
                                           <th>Sr.No</th>
                                            <th>Item</th>
                                            <th>Name</th>
                                            <th class="">Qty</th>
                                            <th class="">Price</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!-- Table End-->


                         <div class="sm:w-1/5 my-5  h-auto shadow-2xl text-classic-yellow font-poppins-400 bg-opacity-50 bg-restaurantly-darkbrown py-5 px-5">
                            <div class="w-full flex justify-center">
                                <div class="py-5 space-y-10">
                                    <div>
                                        <h4 class="text-2xl">Total Item: <span id="totalitem"> 5</span></h4>
                                    </div>
                                    <div>
                                        <h4 class="text-2xl">Total Price: <span id="totalprice"> 500 </span>₹</h4>
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
            FillOrderDetails(1);


        })

        function FillOrderDetails(TableID) {
            $.ajax({

                url: "../WebServices/OrderMasterWebService.asmx/OrderMasterGet",
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

            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";
                   

                    strImage = "<diV class='flex justify-center '><img class='rounded-full '  src='../Assets/Images/" + $(this).find("DishPhoto").text() + "' style=' height:100px; width:100px; ' ></div>";
                    //strEditDelete += " <input class='bg-yellow-900 mx-2 xl:py-3 xl:px-5 text-center text-white py-1 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditDish(" + $(this).find("DishID").text() + ")' type='button' value='Edit' />";
                    //strEditDelete += " <input class='bg-red-900 mx-2 xl:py-3 xl:px-5 text-center text-white py-1 px-3 hover:bg-red-600 cursor-pointer' onclick='DeleteDish(" + $(this).find("DishID").text() + ",\"" + $(this).find("DishPhoto").text() + "\")' type='button' value='Delete' />";

                    // strEditDelete += " <input class='bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteSubCategory(" + $(this).find("DishID").text(), $(this).find("DishPhoto").text() + ")' type='button' value='Delete' />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        strImage,
                        $(this).find("DishName").text(),
                        $(this).find("Qty").text(),
                        $(this).find("Price").text(),

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }
    </script>
</asp:Content>

