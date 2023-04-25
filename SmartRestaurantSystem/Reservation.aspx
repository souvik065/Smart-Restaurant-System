<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="Reservation.aspx.cs" Inherits="Reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="bg-restaurantly-brown h-auto py-10 ">

        <!-- Section Title -->
        <div class="section-title py-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 py-10 mx-3">
            <h2 class="title font-semibold text-2xl text-gray-400 ">R E S E R V A T I O N</h2>
            <p id="title" class="font-playfair-display-700 text-classic-yellow text-5xl">Book a Table</p>

        </div>
        <!-- Section Title End-->


        <div class=" md:mx-20 lg: xl:mx-32 2xl:mx-64">
            <div class=" space-y-10  ">
                <div class="grid lg:grid-cols-3 gap-5 md:grid-cols-2  ">

                    <div class="">
                        <span id="txtNameWarning" class="text-red-700"></span>
                        <input type="text" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full  transition py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" id="txtName" placeholder="Your Name" />
                    </div>
                    <div class=" ">
                        <span id="txtEmailWarning" class="text-red-700"></span>
                        <input type="email" id="txtEmail" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Your Email" />
                    </div>
                    <div>
                        <span id="txtMobileNoWarning" class="text-red-700"></span>
                        <input type="text" id="txtMobileNo" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Mobile No" />

                    </div>

                    <div class="">
                        <span id="txtDateWarning" class="text-red-700"></span>
                        <input type="date" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full  transition py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" id="txtDate" placeholder="Your Name" />
                    </div>
                    <div class=" ">
                        <span id="txtTimeWarning" class="text-red-700"></span>
                        <input type="date" onfocus="(this.type='time')" id="txtTime" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Time" />
                    </div>
                    <div>
                        <span id="txtNoOfPeopleWarning" class="text-red-700"></span>
                        <input type="text" id="txtNoOfPeople" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="No of People" />

                    </div>

                </div>
                <div>
                    <span id="txtMessageWarning" class="text-red-700"></span>
                    <textarea id="txtMessage" onkeyup="FormValTextBox(this.id)" placeholder="Message" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow"></textarea>
                </div>
                <div class="flex justify-center ">
                    <input type="button" id="btnBookTable" value="Book Table" class="bg-classic-yellow cursor-pointer text-white rounded-full px-5 py-2" />
                </div>


            </div>
        </div>

    </section>

    <script>





        function FormValidation(name, email, mobileno, time, date) {
            var returnval = true;
            var emailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            var mobilenoRegex = /^(0|91)?[6-9][0-9]{9}$/;
            var dateRegex = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-.\/])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;


            if (name.val() == "") {
                $("#txtCustomerNameWarning").text("* Cutomer Should not be Empty ");
                
                returnval = false;
            }

            if (email.val() == "") {
                $("#txtEmailWarning").text("* Email Should not be Empty ");
                returnval = false;
            } else
                if (!emailRegex.test(email.val())) {
                    $("#txtEmailWarning").text("* Invalid Email Address. ");
                    returnval = false;
                }

            if (mobileno.val() == "") {
                $("#txtMobileNoWarning").text("* MobilelNo  Should not be Empty ");
                returnval = false;


            } else if (!mobilenoRegex.test(mobileno.val())) {
                $("#txtMobileNoWarning").text("* Invalid Mobile No. ");
                returnval = false;
            }







            return returnval;
        }
    </script>
</asp:Content>

