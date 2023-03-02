<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                <div class="border h-10 w-screen">
                </div>
                <!-- Google Maps End-->

                <!-- ContactUs Form -->
                <div class="flex justify-center items-center  h-auto">
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
                                <div class="flex  space-x-5">
                                        <input type="text" class="bg-transparent w-1/2  transition py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" id="txtName" placeholder="Your Name" />
                                        <input type="email" id="txtEmail" class="bg-transparent w-1/2 py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Your Email" />

                                </div>
                                <div>
                                    <input type="text" id="txtSubject" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow focus:ring focus:ring-yellow-700" placeholder="Subject" />

                                </div>
                                <div>
                                    <textarea id="txtMessage" placeholder="Message" class="bg-transparent w-full py-3 px-3 outline-none text-white border border-classic-dimyellow"></textarea>
                                </div>
                                <div class="flex justify-center ">
                                    <input type="button" id="btnSendMessage" value="Send Message" class="bg-classic-yellow text-white rounded-full px-5 py-2"/>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
                <!-- Contact Form End-->


            </div>
        </div>
    </section>
</asp:Content>

