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
                            <h4 class="text-3xl border-b border-classic-light-yellow pb-5 font-bold ">Login</h4>

                        </div>
                        <div class="space-y-10">
                            <div class="space-x-5">
                                <label for="txtUserName" class="font-bold ">UserName </label>
                                <input id="txtUserName" class="bg-transparent border border-classic-light-yellow py-2 px-2" type="text" placeholder="Username" />
                            </div>
                            <div class="space-x-5">
                                <label for="txtPassword" class="font-bold">Password </label>
                                <input id="txtPassword" class="bg-transparent border border-classic-light-yellow py-2 px-2" type="password" placeholder="Password" />
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
