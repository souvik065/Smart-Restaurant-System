<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="h-full bg-restaurantly-brown text-white overflow-x-hidden">
        <div class="flex  justify-center py-16">
            <div class="w-full text-classic-yellow">

                <div class="menu">
                    <!-- Section Title -->
                    <div class="section-title my-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64  mx-10">
                        <h2 class="title font-semibold text-gray-400 ">M E N U</h2>
                        <p id="menu-title" class="font-playfair-display-700 text-5xl">Choose Your Category</p>
                    </div>
                    <!-- Section Title End-->

                    <!-- Nav-Section End-->
                    <div  class="flex filters 2xl:mx-52 ">
                        <div>
                            <div id="nav-section" class="flex text-xl text-gray-400 font-playfair-display-600 space-x-5  px-5">
                                <div class="cursor-pointer" onclick="FillCategoryMenu()">Category</div>
                                <span>/</span>
                                <div class="cursor-pointer" onclick="ListAllSubCategoryMenu()">SubCategory</div>

                            </div>
                        </div>
                    </div>
                    <!-- Nav-Section End-->



                    <!-- Category List -->
                    <div data-category class="text-white category-menu-list  ">
                        <div class="CategoryMenu flex justify-center 2xl:mx-52  my-10" >

                            <div id="CategoryMenu" class="flex ">

                            </div>

                        </div>
                    </div>
                    <!-- Menu List End-->

                    <!-- Sub-Category List Start-->
                    <div data-subcategory class=" subcategory-menu-list ">
                        <div class="px-5 md:mx-10 2xl:mx-48 xl:mx-32 lg:mx-20  md:mx-5 flex overflow-x-scroll lg:space-x-52 space-x-14  " id="SubCategoryMenu">

                           <%-- <div class=" flex cursor-pointer  space-x-3 menu-list  my-auto">
                                <div class="border-4 2xl:h-52 xl:h-44  sm:h-36 lg:w-1/3 h-28 border-gray-500 rounded-full  ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class="dish my-auto  w-2/3 ">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                    <div class="dish-price py-2  flex justify-between md:mx-5">
                                        <div class="space-y-2 w-1/2">
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                           
                                        </div>
                                        <div class="my-auto">
                                            <div class="my-auto">
                                                <div>
                                                    <input type="button" value="+ Add" class="text-white bg-classic-yellow px-3 py-2 cursor-pointer" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                            <div class=" flex cursor-pointer  space-x-3 menu-list  my-auto">
                                <div class="border-4 2xl:h-52 xl:h-44  sm:h-36 lg:w-1/3 h-28 border-gray-500 rounded-full  ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class="dish my-auto  w-2/3 ">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                    <div class="dish-price py-2  flex justify-between md:mx-5">
                                        <div class="space-y-2 w-1/2">
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                           
                                        </div>
                                        <div class="my-auto">
                                            <div class="my-auto">
                                                <div>
                                                    <input type="button" value="+ Add" class="text-white bg-classic-yellow px-3 py-2 cursor-pointer" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                            <div class=" flex cursor-pointer  space-x-3 menu-list  my-auto">
                                <div class="border-4 2xl:h-52 xl:h-44  sm:h-36 lg:w-1/3 h-28 border-gray-500 rounded-full  ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class="dish my-auto  w-2/3 ">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                    <div class="dish-price py-2  flex justify-between md:mx-5">
                                        <div class="space-y-2 w-1/2">
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                           
                                        </div>
                                        <div class="my-auto">
                                            <div class="my-auto">
                                                <div>
                                                    <input type="button" value="+ Add" class="text-white bg-classic-yellow px-3 py-2 cursor-pointer" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>


                            <div class=" flex cursor-pointer  space-x-3 menu-list  my-auto">
                                <div class="border-4 2xl:h-52 xl:h-44  sm:h-36 lg:w-1/3 h-28 border-gray-500 rounded-full  ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class="dish my-auto  w-2/3 ">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                    <div class="dish-price py-2  flex justify-between md:mx-5">
                                        <div class="space-y-2 w-1/2">
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            <div class="flex justify-around font-semibold">
                                                <div class="flex">
                                                    <input type="radio" value="regular" />
                                                    <h3 class="">Regular</h3>
                                                </div>
                                                <div>
                                                    <span>Price</span>
                                                </div>
                                            </div>
                                            
                                           
                                        </div>
                                        <div class="my-auto">
                                            <div class="my-auto">
                                                <div>
                                                    <input type="button" value="+ Add" class="text-white bg-classic-yellow px-3 py-2 cursor-pointer" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>--%>

                           
                        </div>
                    </div>
                    <!-- Sub-Category List End-->


                    <!-- Dishes List Start-->
                    <div data-dish class="flex justify-center items-center  dish-menu-list my-5">
                        <div class="px-5 mx-10 w-full 2xl:mx-48  lg:mx-20  md:mx-5  grid gap-5 md:grid-cols-2 " id="DishMenu">
                            <input id="Radio1"  type="radio" />
                        </div>
                    </div>
                    <!-- Dishes List End-->


                    <!-- Order Table Start-->
                    <div>
                        <div>
                            <div></div>
                            <div></div>

                        </div>
                    </div>
                    <!-- Order Table Start-->



                </div>





                <%--<!-- Filters End-->
                    <div class="flex filters justify-center ">
                        <div>
                            <ul class="flex text-xl font-playfair-display-600 space-x-10  ">
                                <li class="cursor-pointer" onclick="FillCategoryMenu()">All</li>
                                <li class="cursor-pointer">Starters</li>
                                <li class="cursor-pointer">Salads</li>
                                <li class="cursor-pointer">Specially</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Filters End-->--%>
            </div>
        </div>
    </section>
    <script>



        var SubCategoryDiv = document.getElementById("SubCategoryMenu");
        SubCategoryDiv.addEventListener("wheel", function (e) {



        });


        $(function () {
            FillCategoryMenu();
            $(".dish-price").slideUp();
        });

        //var menu = document.querySelector(".menu");
        //var category = document.querySelector("[data-category]");
        //var subcategory = document.querySelector("[data-subcategory]");
        //menu.addEventListener("click", e => {
        //    debugger;
        //    if (e.target.matches("[data-category]")) {
        //        debugger;
        //        category.classList.add("hidden");
        //        subcategory.classList.remove("hidden");


        //    }
        //});

       

        /* Ctageoy Methods Start*/ // Listing All the Categories
        function FillCategoryMenu() {
            $.ajax({
                url: "WebServices/CategoryMasterWebService.asmx/CategoryMasterGet",
                method: "POST",
                data: "{CategoryID:0}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnCategoryMenuSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

            document.querySelector(".category-menu-list").classList.remove("hidden");
            document.querySelector(".subcategory-menu-list").classList.add("hidden");
            document.querySelector(".dish-menu-list").classList.add("hidden");

            

        }

        function OnCategoryMenuSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += `
                            <div id="` + $(this).find("CategoryID").text() + `"   class="category my-5 mx-10 text-center  cursor-pointer">
                                <div class="">
                                    <div class=" flex items-center justify-center  border-gray-500  ">
                                        <div class="w-14 h-14 overflow-hidden">
                                            <img alt="Dish" class="" src="Assets/Images/`+ $(this).find("CategoryPhoto").text() + `" />
                                        </div>

                                    </div>
                                </div>
                                <div class="w-full ">
                                    <div class="font-semibold text-xl  flex  justify-center text-center">
                                        <p class="">`+ $(this).find("CategoryName").text() + `</p>
                                    </div>
                                </div>
                            </div>`;
                })


                
            }
            else {

            }
            $("#CategoryMenu").html(divTag)

            var cats = [...document.querySelectorAll(".category")];

            for (var cat of cats) {
                cat.addEventListener('click', function (e) {

                    ListAllSubCategoryByCategory(this.id)
                })
            }
        }
        /* Ctageoy Methods End*/

        /* Sub-Ctageoy Methods Start*/
        function ListAllSubCategoryByCategory(CategoryID) {
            document.getElementById('SubCategoryMenu').scrollIntoView();
            $.ajax({
                url: "WebServices/SubCategoryMasterWebService.asmx/ListAllSubCategoryByCategory",
                method: "POST",
                data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSubCategoryMenuSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

            //document.querySelector(".category-menu-list").classList.add("hidden");
            document.querySelector(".subcategory-menu-list").classList.remove("hidden");
            document.querySelector(".dish-menu-list").classList.add("hidden");

        }

        function OnSubCategoryMenuSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += `<div id="` + $(this).find("SubCategoryID").text() + `"  class="subcategory flex justify-center  my-5 cursor-pointer space-x-3 menu-list">
                                  <div class="text-center space-y-3">
                                    <div class="border-4 2xl:h-48 2xl:w-48 xl:h-44 xl:w-44 sm:h-36 sm:w-36  lg:w-1/3 h-28 w-28 border-gray-500 rounded-full  overflow-hidden">
                                        <img alt="Dish" class="h-full w-full" src="Assets/Images/`+ $(this).find("SubCategoryPhoto").text() + `" />
                                    </div>
                                    <div class="text-center my-auto ">
                                        <div class="font-bold text-center flex justify-center text-2xl">
                                            <p>` + $(this).find("SubCategoryName").text() + `</p>
                                        </div>
                                    
                                    </div>
                                  </div>
                                </div>
                           `;
                })
            }
            else {

            }
            $("#SubCategoryMenu").html(divTag);

            var subcategories = [...document.querySelectorAll(".subcategory")];

            for (var subcat of subcategories) {
                subcat.addEventListener('click', function (e) {
                    ListAllDishBySubCategory(this.id)
                })
            }
        }
        /* Sub-Ctageoy Methods End*/

        /* Dish Methods Start*/
        function ListAllDishBySubCategory(SubCategoryID) {
            document.getElementById('DishMenu').scrollIntoView();
            $.ajax({
                url: "WebServices/DishMasterWebService.asmx/ListAllDishBySubCategory",
                method: "POST",
                data: "{SubCategoryID:" + JSON.stringify(SubCategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnDishMenuSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

            document.querySelector(".subcategory-menu-list").classList.add("hidden");
            document.querySelector(".dish-menu-list").classList.remove("hidden");

            $(".dish-price").slideToggle();

            var dishdetails = [...document.querySelectorAll(".dish-details")];
            var dishes = [...document.querySelectorAll(".dish")];


            for (var dish of dishdetails) {
                dish.addEventListener("click", function (e) {
                    $("#"+this.id+"-Price-Div").slideToggle();
                });
            }

            for (var d of dishes) {
                d.addEventListener("click", function (e) {
                    if (e.target.matches("[data-add]")) {
                        

                        let MeasureTypeID = document.querySelector("input[name='radiogroup" + e.target.id + "']:checked").value;

                        CartMasterInsert(e.target.id, MeasureTypeID);

                        $("#" + e.target.id + "-Price-Div").slideToggle();


                    }
                });
            }


        }

        function OnDishMenuSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            $("#DishMenu").html("<div><p>Empty</p></div>");
            var qty = "";
            qty = `<div class="Qty flex justify-center" id="` + $(this).find("DishID").text() + `">
                            <div id="`+ $(this).find("DishID").text() + `">
                                <input type="button" id="`+ $(this).find("DishID").text() + `" value="-"  class=" Minusbtn bg-classic-yellow text-white font-bold w-5" />
                            </div>
                            <div>
                            <input type="text" id="`+ $(this).find("DishID").text() + `Qty" class="bg-transparent w-7 text-center text-gray-400 font-bold" value="` + $(this).find("Qty").text() + `"/>
                            </div>
                            <div id="`+ $(this).find("DishID").text() + `">
                            <input type="button" id="`+ $(this).find("DishID").text() + `" value="+" class="Plusbtn bg-classic-yellow text-white font-bold w-5" />
                            </div>
                          </div>
                        `;
            if (Details.length > 0) {
                $.each(Details, function () {



                    divTag += `<div class="dish flex cursor-pointer  space-x-3 menu-list  my-auto" >
                                <div class="border-4 2xl:h-48 2xl:w-48 xl:h-44 xl:w-44 sm:h-36 sm:w-36  lg:w-1/3 h-28 w-28 border-gray-500 rounded-full  overflow-hidden">
                                    <img alt="Dish" class="h-full w-full" src="Assets/Images/`+ $(this).find("DishPhoto").text()+`" />
                                </div>
                                <div class=" my-auto  w-2/3 space-y-5">
                                    <div class="dish-details" id="` + $(this).find("DishID").text() +`">
                                        <div class="font-bold  flex  justify-between ">
                                            <a>`+ $(this).find("DishName").text() + `</a>
                                        </div>
                                        <div class="text-sm text-gray-400 font-semibold">
                                            <span>Noodels, Spcies,Green chili paste</span>
                                        </div>
                                    </div>
                                    <div class="dish-price py-2  flex justify-between md:mx-5" id="`+ $(this).find("DishID").text() +`-Price-Div">
                                        <div class="space-y-2 w-autos " id="`+ $(this).find("DishID").text() +`-Price">
                                            
                                        </div>
                                        
                                        <div class="my-auto">
                                            <div class="my-auto">
                                                <div>
                                                    <input data-add type="button" id="`+ $(this).find("DishID").text() + `" value="+ Add"  class="dish-add-btn text-white bg-classic-yellow px-3 py-2 cursor-pointer" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>`;
                   

                    $("#DishMenu").html(divTag);

                    ListAllDishPrice($(this).find("DishID").text());

                })
            }
            else {

            }

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

        function ListAllDishPrice(DishID) {
            
            $.ajax({

                url: "../WebServices/PriceMasterWebService.asmx/ListAllDishPrice",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnListAllDishPriceSuccess,
                error: function (err) {
                    console.log(err)
                }

            });
        }

        function OnListAllDishPriceSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += `<div class="flex justify-around font-semibold space-x-3  w-auto">
                                    <label for="rbtn`+ $(this).find("MeasureTypeID").text() + $(this).find("DishID").text() +`" class="flex w-full  justify-around font-semibold space-x-3">
                                    <div class="flex space-x-3">
                                        <input type="radio" id="rbtn`+ $(this).find("MeasureTypeID").text() + $(this).find("DishID").text()+`"  name="radiogroup`+ $(this).find("DishID").text() + `" value="` + $(this).find("MeasureTypeID").text()+`" />
                                       
                                            <h3 class=""> `+ $(this).find("MeasureType").text() +`</h3>
                                    </div>
                                    <div class="text-gray-400 font-bold">
                                        <span>`+ $(this).find("Price").text() +`</span><span> ₹</span>
                                    </div>
                                    </label>

                              </div>`;

                    var pricediv = $("#" + $(this).find("DishID").text() + "-Price").html(divTag);

                    
                })

            }
            else {

            }


            

        }
        /* Dish Methods End*/

        /* Order Methods Start*/
        function CartMasterInsert(DishID, MeasureTypeID) {

            //let radiobtns = document.querySelectorAll("input[name=ragdiogroup" + DishName + "]");
            //let selected = document.querySelector("input[name='radiogroup" + DishName + "']:checked").value;
            //console.log(selected);

            $.ajax({

                url: "../WebServices/CartMasterWebService.asmx/CartMasterInsert",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + ", TableID:" + JSON.stringify(localStorage.getItem("TableID")) + ",MeasureTypeID:" + JSON.stringify(MeasureTypeID)+"}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var result = res.d;
                    if (result.includes("error")) {
                        console.log(result);
                    } else if (result.includes("Success")) {

                        UpdateCartDetail();

                        swal.fire({
                            icon: "success",
                            text: "Item Added to Cart Successfully",
                            background: '#27272a',
                        })
                    }
                },
                error: function (err) {
                    console.log(err)
                }

            });


            
        }



        /* Order Methods End*/

        //$("#DishMenu").on('load', function () {

        //    var dishmenu = document.querySelector("#DishMenu");
        //    var dishes = [...document.querySelectorAll(".dish")];

        //    for (var dish of dishes) {
        //        dish.addEventListener('click', e => {
        //            console.log(e.target.id);
        //        })
        //    }

        //})

        //var menu = document.querySelector(".menu");

        //menu.addEventListener('click', function (e) {

        //    alert('menu');

        //    var category = document.querySelector(".CategoryMenu");

        //    category.addEventListener('click', function (e) {

        //        alert('category');


        //        var cats = [...document.querySelectorAll(".category")];

        //        for (var cat of cats) {
        //            cat.addEventListener('click', function (e) {
        //                alert('cat');

        //                alert(this.id);
        //                e.stopPropagation();
        //            })
        //        }

        //    });


        //});

       

        

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

