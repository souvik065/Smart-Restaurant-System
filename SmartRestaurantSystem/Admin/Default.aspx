<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Template/lib/tailwindcss/base.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/components.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/tailwind-dark.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/tailwind.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/utilities.css" rel="stylesheet" />

    <script src="https://cdn.tailwindcss.com"></script>

    <link href="Template/css/DefaultPage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero-bg-img h-screen w-screen absolute">
        </div>
        <div class="flex  justify-center items-center h-screen ">
            <div class="absolute">
                <div class="bg-classic-brown flex justify-center items-center text-center h-[350px] w-[400px] shadow-2xl opacity-95 text-classic-yellow">
                    <div class="space-y-10">
                        <div class="">
                            <h4 class="text-3xl border-b border-classic-dimyellow pb-5 font-bold ">Login</h4>

                        </div>
                        <div class="space-y-10">
                            <div class="space-x-5 flex">
                                <div class="flex py-1">
                                    <span class="px-1 ">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                                        </svg>
                                    </span>
                                    <label for="txtUserName" class="font-bold ">UserName </label>
                                </div>

                                <input id="txtUserName" class="bg-transparent border border-classic-dimyellow py-2 px-2" type="text" placeholder="Username" />
                            </div>
                            <div class="space-x-5 flex">
                                <div class="flex py-1">
                                    <span class="px-1 ">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 013 3m3 0a6 6 0 01-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1121.75 8.25z" />
                                        </svg>

                                    </span>
                                    <label for="txtPassword" class="font-bold">Password </label>
                                </div>
                                <input id="txtPassword" class="bg-transparent border border-classic-dimyellow py-2 px-2" type="password" placeholder="Password" />
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>
