<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="h-full bg-restaurantly-brown text-white">
        <div class="flex  justify-center py-16">
            <div class="w-full mx-5 text-classic-yellow">

                <div class="border">
                    <!-- Section Title -->
                    <div class="section-title my-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 my-10">
                        <h2 class="title font-semibold text-gray-400 ">M E N U</h2>
                        <p class="font-playfair-display-700 text-5xl">Choose Your Category</p>
                    </div>
                    <!-- Section Title End-->





                    <!-- Category List -->
                    <div class="text-white menu-list">
                        <div class=" flex justify-around md:mx-20   2xl:mx-64 my-10 border " id="CategoryMenu">

                            <div id="" class=" my-5 space-x-3 text-center border cursor-pointer">
                                <div class="">
                                    <div class=" flex items-center justify-center  border-gray-500  ">
                                        <div class="w-52 h-52 border overflow-hidden">
                                            <img alt="Dish" class="" src="veg-icon.png" />
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="w-full">
                                    <div class="font-bold text-2xl  flex  justify-center ">
                                        <a>Veg</a>
                                    </div>
                                   
                                </div>
                            </div>

                            <div class=" my-5 space-x-3 text-center border cursor-pointer">
                                <div class="">
                                    <div class=" flex items-center justify-center  border-gray-500  ">
                                        <div class="w-52 h-52 border overflow-hidden">
                                            <img alt="Dish" class="" src="non-veg-icon.png" />
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="w-full">
                                    <div class="font-bold text-2xl  flex  justify-center ">
                                        <a>Non-Veg</a>
                                    </div>
                                   
                                </div>
                            </div>


                            
                        </div>
                    </div>
                    <!-- Menu List End-->

                    <!-- Sub-Category List Start-->
                    <div class="border">
                        <div class="px-5 mx-10 2xl:mx-48 xl:mx-32 lg:mx-20  md:mx-5  grid md:grid-cols-2">
                            
                            <div class="flex my-5 border space-x-3 menu-list">
                                <div class="border-4 h-52 w-52 border-gray-500 rounded-full ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class=" my-auto">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="flex my-5 border space-x-3 menu-list">
                                <div class="border-4 h-52 w-52 border-gray-500 rounded-full ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class=" my-auto">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                </div>
                            </div>

                            <div class="flex my-5 border space-x-3 menu-list">
                                <div class="border-4 h-52 w-52 border-gray-500 rounded-full ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class=" my-auto">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                </div>
                            </div>

                            <div class="flex my-5 border space-x-3 menu-list">
                                <div class="border-4 h-52 w-52 border-gray-500 rounded-full ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class=" my-auto">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                </div>
                            </div>

                            <div class="flex my-5 border space-x-3 menu-list">
                                <div class="border-4 h-52 w-52 border-gray-500 rounded-full ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class=" my-auto">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>Manchurian Soup</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <span>Noodels, Spcies,Green chili paste</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sub-Category List End-->

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
        $(function () {
            FillCategoryMenu();
        })

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
        }


        function OnCategoryMenuSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += `<div id="` + $(this).find("CategoryID").text() + `" class=" my-5 space-x-3 text-center border cursor-pointer">
                                <div class="">
                                    <div class=" flex items-center justify-center  border-gray-500  ">
                                        <div class="w-52 h-52 border overflow-hidden">
                                            <img alt="Dish" class="" src="Assets/Images/`+ $(this).find("CategoryPhoto").text() + `" />
                                        </div>

                                    </div>
                                </div>
                                <div class="w-full">
                                    <div class="font-bold text-2xl  flex  justify-center ">
                                        <a>`+ $(this).find("CategoryName").text() + `</a>
                                    </div>

                                </div>
                            </div>`;
                })
            }
            else {

            }
            $("#CategoryMenu").html(divTag)
        }


        function FillSubCategoryMenu(CategoryID) {
            $.ajax({
                url: "WebServices/SubCategoryMasterWebService.asmx/SubCategoryMasterGet",
                method: "POST",
                data: "{SubCategoryID:"+JSON.stringify(CategoryID)+"}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSubCategoryMenuSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }


        function OnSubCategoryMenuSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += `<div class="flex my-5 border space-x-3 menu-list">
                                <div class="border-4 h-52 w-52 border-gray-500 rounded-full ">
                                    <img alt="Dish" class="h-full w-full" src="Template/img/specials-3.png" />
                                </div>
                                <div class=" my-auto">
                                    <div class="font-bold  flex  justify-between ">
                                        <a>` + $(this).find("SubCategoryName").text() + `</a>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <!--<span>Noodels, Spcies,Green chili paste</span>-->
                                    </div>
                                </div>
                            </div>


                            <div id="` + $(this).find("CategoryID").text() + `" class=" my-5 space-x-3 text-center border cursor-pointer">
                                <div class="">
                                    <div class=" flex items-center justify-center  border-gray-500  ">
                                        <div class="w-52 h-52 border overflow-hidden">
                                            <img alt="Dish" class="" src="Assets/Images/`+ $(this).find("CategoryPhoto").text() + `" />
                                        </div>

                                    </div>
                                </div>
                                <div class="w-full">
                                    <div class="font-bold text-2xl  flex  justify-center ">
                                        <a>`+ $(this).find("CategoryName").text() + `</a>
                                    </div>

                                </div>
                            </div>`;
                })
            }
            else {

            }
            $("#CategoryMenu").html(divTag)
        }
    </script>
</asp:Content>

