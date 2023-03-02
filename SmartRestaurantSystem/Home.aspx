<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Template/css/Home.css" rel="stylesheet" />

    <section class="sec1 w-full h-screen">

        <div class="flex justify-center items-center text-white my-auto border h-full">
            <div>
                <div>
                    <h1 class="text-4xl font-poppins-400 font-bold">
                        Welcome to <span>Restaurantly</span>
                    </h1>
                    <h2 class="font-poppins-400">Delivering greate fod for nore than 18 years</h2>
                </div>
                <div></div>
            </div>
        </div>

    </section>
    <section class="sec2 h-screen" ></section>
</asp:Content>

