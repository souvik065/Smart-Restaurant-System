<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Template/lib/tailwindcss/base.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/components.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/tailwind-dark.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/tailwind.css" rel="stylesheet" />
    <link href="Template/lib/tailwindcss/utilities.css" rel="stylesheet" />
    <script src="../lib/jquery/jquery.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>

    <link href="Template/css/DefaultPage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero-bg-img h-screen w-screen absolute">
        </div>
        <div class="flex  justify-center items-center h-screen ">
            <!-- Login Form Div Start-->
            <div class="absolute ">
                <div class="bg-classic-brown  flex justify-center items-center text-center h-[25rem] w-[400px] shadow-2xl opacity-95 text-classic-yellow">
                    <div class="space-y-10 relative">
                        <div class="">
                            <h4 class="text-3xl border-b border-classic-dimyellow pb-5 font-bold ">Login</h4>

                        </div>
                        <div class="space-y-5">

                            <!-- UserName Start-->
                            <div class="space-x-5 flex">
                                <div class="flex py-1 text-gray-400">
                                    <span class="px-1 ">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                                        </svg>
                                    </span>

                                </div>

                                <input id="txtUserName" class="bg-transparent  font-semibold border-b outline-none border-classic-dimyellow py-2 px-2" type="text" placeholder="Username" />
                            </div>
                            <!-- UserName End-->


                            <!-- Password Start-->
                            <div class="space-x-5 flex ">
                                <div class="flex py-1 text-gray-400">
                                    <span class="px-1 ">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 013 3m3 0a6 6 0 01-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1121.75 8.25z" />
                                        </svg>
                                    </span>
                                </div>
                                <input id="txtPassword" class="bg-transparent outline-none font-semibold border-b border-classic-dimyellow py-2 px-2" type="password" placeholder="Password" /><span onclick="toggle()" id="eye" class="absolute right-0 cursor-pointer"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg></span>


                            </div>
                            <!-- Password End-->

                            <!-- User Type -->
                            <div class="space-x-5 flex ">
                                <div class="font-bold text-gray-400 my-auto">
                                    <label>Role</label>
                                </div>
                                <div class=" w-full">
                                    <select id="ddlUserType" class="bg-transparent outline-none font-semibold border-b border-classic-dimyellow py-2 px-2 w-full" placeholder="UserType">
                                        <option class="text-gray-400 font-semibold" value="0">-Select Role-</option>
                                        <option value="true">Admin</option>
                                        <option value="false">Staff</option>

                                    </select>
                                </div>
                            </div>
                            <!-- User Type -->


                            <!-- Remember Me Start-->
                            <div>
                                <input type="checkbox" onclick="setCookie()" /> <span class="font-semibold"> Remember Me</span>
                            </div>
                            <!-- Remember Me End-->


                            <div class="">
                                <input id="btnLogin" class="bg-yellow-900 w-full text-white font-bold py-3 px-10 cursor-pointer hover:bg-yellow-700" type="button" value="Login" />

                            </div>
                        </div>
                        <div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Login Form Div End-->

        </div>
    </form>

    <script>
        var state = false;
        function toggle() {
            if (state) {
                document.getElementById("txtPassword").
                    setAttribute("type", "password");

                document.getElementById("eye").style.color = "#7a797e";
                state = false;
            } else {
                document.getElementById("txtPassword").setAttribute("type", "text");
                document.getElementById("eye").style.color =  "#5887ef";

                state = true;
            }
        }

        function setCookie() {
            var u = document.getElementById('txtUserName').value;
            var p = document.getElementById('txtPassword').value;

            document.cookie = "myusername=" + u + ";path=http://localhost:60873/";
            document.cookie = "mypassword=" + p + ";path=http://localhost:60873/";


        }


       

            $("#btnLogin").on("click", function () {
            debugger;
            var username = $("#txtUserName");
            var password = $("#txtPassword");
            var stafftypeid = $("#txt")

            if (username.val() == "")
            {
                alert("Please Enter the UserName");
            username.focus();
            return
            } else if (password.val() == "") {
                alert("Please Enter the Password");
            password.focus();
            return
            } else {

                var UserName = username.val().trim();
            var Password = password.val().trim();

            }

            $.ajax({

            url: "../WebServices/AdminLoginWebService.asmx/CheckLogin",
            method: "POST",
            data: "{UserName:" + JSON.stringify(UserName) + ", Password:" + JSON.stringify(Password) + ", StaffTypeID:"++"}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                    var result = response.d;
            if (result.includes("Invalid")) {
                alert("Invalid UserName or Password")
            } else {

                window.location.href = "CategoryMaster.aspx";
                    }

                },
            error: function (err) {
                console.log(err);
                }

            });

        });
   
    </script>

</body>
</html>
