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
                        <p id="title" class="font-playfair-display-700 text-5xl">Choose Your Category</p>
                    </div>
                    <!-- Section Title End-->

                    <!-- Filters End-->
                    <div class="flex filters 2xl:mx-52 border">
                        <div>
                            <ul class="flex text-xl font-playfair-display-600 space-x-10  ">
                                <li class="cursor-pointer" onclick="FillCategoryMenu()">Category</li>

                            </ul>
                        </div>
                    </div>
                    <!-- Filters End-->



                    <!-- Category List -->
                    <div class="text-white menu-list  border">
                        <div class=" flex justify-around 2xl:mx-52  my-10 border " id="CategoryMenu">
                        </div>
                    </div>
                    <!-- Menu List End-->

                    <!-- Sub-Category List Start-->
                    <div class="border">
                        <div class="px-5 mx-10 2xl:mx-48 xl:mx-32 lg:mx-20  md:mx-5  grid md:grid-cols-2 " id="SubCategoryMenu">

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


                    <!-- Dishes List Start-->
                    <div class="border">
                        <div class="px-5 mx-10 2xl:mx-48 xl:mx-32 lg:mx-20  md:mx-5  grid md:grid-cols-2 " id="Dishes">
                        </div>
                    </div>
                    <!-- Dishes List End-->


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

                    divTag += `
                            <div id="` + $(this).find("CategoryID").text() + `"  onclick="ListAllSubCategoryByCategory(this.id)" class=" my-5  text-center border cursor-pointer">
                                <div class="">
                                    <div class=" flex items-center justify-center  border-gray-500  ">
                                        <div class="w-52 h-52 border overflow-hidden">
                                            <img alt="Dish" class="" src="Assets/Images/`+ $(this).find("CategoryPhoto").text() + `" />
                                        </div>

                                    </div>
                                </div>
                                <div class="w-full ">
                                    <div class="font-bold text-2xl  flex  justify-center text-center">
                                        <p class="">`+ $(this).find("CategoryName").text() + `</p>
                                    </div>
                                </div>
                            </div>`;
                })
            }
            else {

            }
            $("#CategoryMenu").html(divTag)
        }


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
                                        <p>` + $(this).find("SubCategoryName").text() + `</p>
                                    </div>
                                    <div class="text-sm text-gray-400 font-semibold">
                                        <!--<span>Noodels, Spcies,Green chili paste</span>-->
                                    </div>
                                   </div>
                                </div>
                           `;
                })
            }
            else {

            }
            $("#SubCategoryMenu").html(divTag)
        }
    </script>
</asp:Content>

