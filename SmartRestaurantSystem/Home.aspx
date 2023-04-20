<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Template/css/Home.css" rel="stylesheet" />





    <section class="sec1 w-full h-screen">

        <div class="flex justify-center  items-center text-white my-auto  h-full home-title">
            <div class="space-y-5">
                <div>
                    <h1 class="text-5xl font-poppins-700 font-bold">Welcome to <span class="text-classic-yellow">Restaurantly</span>
                    </h1>
                    <h2 class="font-playfair-display-600 text-xl">Delivering greate fod for nore than 18 years</h2>
                </div>
                <div>
                    <a href="Menu.aspx" class="border-2 border-classic-yellow rounded-3xl px-5 py-2">OUR MENU</a>
                    <a href="Reservation.aspx" class="border-2 border-classic-yellow rounded-3xl px-5 py-2">BOOK A TABLE</a>
                </div>
            </div>
        </div>

    </section>

   <%-- <section class="bg-restaurantly-brown h-auto py-10 ">

        <!-- Section Title -->
        <div class="section-title py-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 py-10">
            <h2 class="title font-semibold text-3xl text-gray-400 ">M E N U</h2>
            <p id="title" class="font-playfair-display-700 text-classic-yellow text-5xl">Check Our Tasty Menu</p>

        </div>
        <!-- Section Title End-->

        <!-- Nav-Section End-->
        <div class="flex filters 2xl:mx-52 ">
            <div class="flex justify-center w-full border">
                <div id="nav-section" class="flex text-xl text-gray-400 font-playfair-display-600 space-x-5  px-5">
                    <div class="cursor-pointer" onclick="">All</div>

                    <div class="cursor-pointer" onclick="FillCategoryMenu()">Category</div>
                    <span></span>
                    <div class="cursor-pointer" onclick="ListAllSubCategoryMenu()">SubCategory</div>

                </div>
            </div>
        </div>
        <!-- Nav-Section End-->

    </section>--%>


    <section class="bg-restaurantly-darkbrown h-auto py-10 ">

        <!-- Section Title -->
        <div class="section-title py-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 py-10">
            <h2 class="title font-semibold text-3xl text-gray-400 ">C H E F S</h2>
            <p id="" class="font-playfair-display-700 text-classic-yellow text-5xl">Our Proffesional Chefs</p>

        </div>
        <!-- Section Title End-->

        <div class="flex justify-center mx-5  my-5 ">

            <div class="grid lg:grid-cols-3 space-x-5  lg:mx-60">
                <div>
                    <img src="Template/img/chefs/chefs-1.jpg" />
                </div>
                <div>
                    <img src="Template/img/chefs/chefs-2.jpg" />
                </div>
                <div>
                    <img src="Template/img/chefs/chefs-3.jpg" />
                </div>
            </div>
        </div>



    </section>





</asp:Content>

