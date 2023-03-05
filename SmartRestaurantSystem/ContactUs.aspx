<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Template/css/ContactUs.css" rel="stylesheet" />
    <section class="h-full bg-restaurantly-brown text-white">
        <div class="flex  justify-center py-10">
            <div class="w-full mx-5 text-classic-yellow">
                <!-- Section Title -->
                <div class="section-title my-16 space-y-5 w-full justify-start w-full md:mx-20 lg: xl:mx-32 2xl:mx-64 my-10 mx-5">
                    <h2 class="title font-semibold text-gray-400">C O N T A C T</h2>
                    <p class="font-playfair-display-700 text-5xl">Contact Us</p>
                </div>
                <!-- Section Title End-->

                <!-- Google Maps -->
                <div class="map  max-h-max w-screen">

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29759.05715367346!2d72.80531007886772!3d21.196840298069404!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be04e7b00c61b85%3A0xd205dfbc8098dfaf!2sI2TE%20%5BInstitute%20of%20Information%20Technology%20And%20Education%5D!5e0!3m2!1sen!2sin!4v1678014501474!5m2!1sen!2sin" width="100%" height="250px" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <!-- Google Maps End-->

                <!-- ContactUs Form -->
                <div class="contactus-form flex justify-center items-center  h-auto">
                    <div class="grid md:grid-cols-2 space-y-5 sm:mx-10">
                        <div class="text-white">
                            <div class="py-5 space-y-5 ">
                                <div class="flex space-x-2">
                                    <div class="bg-classic-yellow rounded-full w-10 h-10 items-center flex justify-center ">
                                        <span>
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
                                            </svg>
                                        </span>
                                    </div>
                                    <div>
                                        <h4 class="text-xl font-bold">Location:</h4>
                                        <p>A108 Adam Street, New York, NY 535022</p>
                                    </div>
                                </div>
                                <div class="flex space-x-2">
                                    <div class="bg-classic-yellow rounded-full w-10 h-10 items-center flex justify-center">
                                        <span>
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                                            </svg>
                                        </span>
                                    </div>
                                    <div>
                                        <h4 class="text-xl font-bold">Open Hours:</h4>
                                        <p>
                                            Monday-Saturday:
                                           11:00 AM - 2300 PM
                                        </p>
                                    </div>
                                </div>
                                <div class="flex space-x-2">
                                    <div class="bg-classic-yellow rounded-full w-10 h-10 items-center flex justify-center">
                                        <span>
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                                            </svg>
                                        </span>
                                    </div>
                                    <div>
                                        <h4 class="text-xl font-bold">Email:</h4>
                                        <p>info@restaurantly.com</p>
                                    </div>
                                </div>

                                <div class="flex space-x-2">
                                    <div class="bg-classic-yellow rounded-full w-10 h-10 items-center flex justify-center">
                                        <span>
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 1.5H8.25A2.25 2.25 0 006 3.75v16.5a2.25 2.25 0 002.25 2.25h7.5A2.25 2.25 0 0018 20.25V3.75a2.25 2.25 0 00-2.25-2.25H13.5m-3 0V3h3V1.5m-3 0h3m-3 18.75h3" />
                                            </svg>
                                        </span>
                                    </div>
                                    <div>
                                        <h1 class="text-xl font-bold">Call:</h1>
                                        <p>+91 866662258</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div>
                            <div class=" space-y-10  ">
                                <div class="flex space-x-5">
                                    <div class="w-1/2">
                                        <span id="txtNameWarning" class="text-red-700"></span>
                                        <input type="text" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full  transition py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" id="txtName" placeholder="Your Name" />
                                    </div>
                                    <div class="w-1/2 ">
                                        <span id="txtEmailWarning" class="text-red-700"></span>
                                        <input type="email" id="txtEmail" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Your Email" />
                                    </div>

                                </div>
                                <div>
                                    <span id="txtSubjectWarning" class="text-red-700"></span>
                                    <input type="text" id="txtSubject" onkeyup="FormValTextBox(this.id)" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Subject" />

                                </div>
                                <div>
                                    <span id="txtMessageWarning" class="text-red-700"></span>
                                    <textarea id="txtMessage" onkeyup="FormValTextBox(this.id)" placeholder="Message" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow"></textarea>
                                </div>
                                <div class="flex justify-center ">
                                    <input type="button" id="btnSendMessage" value="Send Message" class="bg-classic-yellow cursor-pointer text-white rounded-full px-5 py-2" />
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
                <!-- Contact Form End-->


            </div>
        </div>
    </section>


    <script>

        $(document).ready(function () {
            //toastr.info('Are you the 6 fingered man?')
            //toastr.success('Success messages');
            //toastr.options.timeOut = 1500; // 1.5s
           // toastr.info('Page Loaded!');

            

        });

        function toasterOptions() {
            toastr.options = {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-center",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "100",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "show",
                "hideMethod": "hide"
            };
        };

        
        

        $("#btnSendMessage").on('click', function () {
            var name = $('#txtName');
            var email = $('#txtEmail');
            var subject = $('#txtSubject');
            var message = $("#txtMessage");

            var Validate = FormValidation(name, email, subject, message);
            if (Validate == true) {
                var Name = name.val().trim();
                var Email = email.val().trim();
                var Subject = subject.val().trim();
                var Message = message.val().trim();


                $.ajax({

                    url: "WebServices/ContactUsWebService.asmx/SendEmail",
                    method: "POST",
                    data: "{Name:" + JSON.stringify(Name) + ", Email:" + JSON.stringify(Email) + ", Subject:" + JSON.stringify(Subject) + ", Message:" + JSON.stringify(Message)+"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (result.includes("Success")) {
                            toasterOptions();
                            toastr.success("Email Send Successfully");
                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });
                ClearFields();
            }


        });

        function ClearFields() {
            $('#txtName').val("");
            $('#txtEmail').val("");
            $('#txtSubject').val("");
            $("#txtMessage").val("");
        }




        function FormValidation(name, email, subject, message) {
            var returnval = true;
            if (name.val() == "") {
                $("#txtNameWarning").text("* Please Enter the Name");
                returnval = false;
            }

            if (email.val() == "") {
                $("#txtEmailWarning").text("* Please Enter the Email");
                returnval = false;
            }

            if (subject.val() == "") {
                $("#txtSubjectWarning").text("* Please Enter the Subject");
                returnval = false;
            }

            if (message.val() == "") {
                $("#txtMessageWarning").text("* Please Enter the Message");
                returnval = false;
            }

            return returnval;
        }
    </script>
</asp:Content>

