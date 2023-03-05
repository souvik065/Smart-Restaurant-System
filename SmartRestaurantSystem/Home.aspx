<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Template/css/Home.css" rel="stylesheet" />

    <section class="sec1 w-full h-screen">

        <div class="flex justify-center  items-center text-white my-auto  h-full home-title">
            <div class="space-y-5">
                <div>
                    <h1 class="text-5xl font-poppins-700 font-bold">
                        Welcome to <span class="text-classic-yellow">Restaurantly</span>
                    </h1>
                    <h2 class="font-playfair-display-600 text-xl">Delivering greate fod for nore than 18 years</h2>
                </div>
                <div>
                    <a class="border-2 border-classic-yellow rounded-3xl px-5 py-2">OUR MENU</a>
                    <a class="border-2 border-classic-yellow rounded-3xl px-5 py-2">OUR MENU</a>


                </div>
            </div>
        </div>

    </section>
    <section class="sec2 h-screen" ></section>
</asp:Content>

