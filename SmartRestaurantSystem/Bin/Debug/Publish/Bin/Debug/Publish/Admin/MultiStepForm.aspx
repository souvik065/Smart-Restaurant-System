<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="MultiStepForm.aspx.vb" Inherits="MultiStepForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Multi-Step-Progress-Bar -->
    <section class=" card justify-around flex space-x-10  w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="progress-bar flex font-bold w-full justify-around mx-52 ">

            <!-- Step-1 Dish Name & Category -->
            <div class="step text-center space-y-4">
                <p>Dish Name</p>
                <div class="bullet flex space-x-2 ">
                    <span id="step1" class="border  py-1 px-3 rounded-full">1</span>
                    <span class="relative hidden left-1 text-orange-600 top-[0.5rem] ">

                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>

                    </span>
                </div>

            </div>
            <!-- -- Step 1 Progress Line -- -->
            <span id="step1ProgressLine" class=" h-1 w-1/5 bg-yellow-900 my-auto"></span>
            <!-- -- Step 1 Progress Line End -- -->
            <!-- Step-1 Dish Name & Category End-->



            <!-- Step-2   -->
            <div class="step text-center space-y-4">
                <p>Dish Name</p>
                <div class="bullet flex space-x-2 ">
                    <span id="step2" class="border  py-1 px-3 rounded-full">2</span>
                    <span class="relative hidden left-1 text-orange-600 top-[0.5rem] ">

                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>

                    </span>
                </div>

            </div>
            <!-- -- Step 2 Progress Line -- -->
            <span id="step2ProgressLine" class=" h-1 w-1/5 bg-yellow-900 my-auto"></span>
            <!-- -- Step 2 Progress Line End -- -->
            <!-- Step-2 End-->


            <!-- Step-3    -->
            <div class="step text-center space-y-4">
                <p>Dish Name</p>
                <div class="bullet flex space-x-2 ">
                    <span id="step3" class="border  py-1 px-3 rounded-full">3</span>
                    <span class="relative hidden left-1 text-orange-600 top-[0.5rem] ">

                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>

                    </span>
                </div>

            </div>

            <!-- -- Step 3 Progress Line -- -->
            <span id="step3ProgressLine" class=" h-1 w-1/5 bg-yellow-900 my-auto"></span>
            <!-- -- Step 3 Progress Line End -- -->


            <!-- Step-3   &  End-->

        </div>
    </section>
    <!-- Multi-Step-Progress-Bar -->


    <!-- Multi-Step-Form Start-->
    <section data-multi-step>
        <!-- Step 1  Dish Ctageory & Name Start-->
        <div data-step class="card  hidden w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <h3 class="">This is Step 1</h3>
            <div class="flex space-x-5 w-full">

                <lable for="txtSubCategoryName" class="my-auto">Sub-Category Name</lable>
                <div class="w-1/2">
                    <div><span id="txtSubCategoryNameWarning" class="formerror text-red-600  text-sm"></span></div>
                    <input id="txtSubCategoryName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400  border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                </div>
            </div>

            <!-- Action buttons -->
            <div class="flex space-x-10">
                <div class="">
                    <input id="btnNext" data-next class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Next" />
                </div>

                <div>
                    <input id="btnClear" class="border border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                </div>
            </div>
            <!--Action Buttons End-->

        </div>
        <!-- Step 1   Dish Ctageory & Name End-->

        <!-- Step 2 Ingredients Start-->
        <div data-step class="card hidden w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <h3 class="">This is Step 2</h3>
            <div class="flex space-x-5 w-full">

                <lable for="txtSubCategoryName" class="my-auto">Sub-Category Name</lable>
                <div class="w-1/2">
                    <div><span id="txtSubCategoryNameWarning" class="formerror text-red-600  text-sm"></span></div>
                    <input id="txtSubCategoryName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400  border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                </div>
            </div>

            <!-- Action buttons -->
            <div class="flex space-x-10">
                <div class="">
                    <input id="btnNext" data-next class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Next" />
                </div>
                <div class="">
                    <input id="btnPrevious" data-previous class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Previous" />
                </div>
                <div>
                    <input id="btnClear" class="border border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                </div>
            </div>
            <!--Action Buttons End-->

        </div>
        <!-- Step 2 Ingredients End-->

        <!-- Step 3 Dish Photo Start-->
        <div data-step class="card hidden w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <h3 class="">This is Step 3</h3>
            <div class="flex space-x-5 w-full">

                <lable for="txtSubCategoryName" class="my-auto">Sub-Category Name</lable>
                <div class="w-1/2">
                    <div><span id="txtSubCategoryNameWarning" class="formerror text-red-600  text-sm"></span></div>
                    <input id="txtSubCategoryName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400  border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                </div>
            </div>

            <!-- Action buttons -->
            <div class="flex space-x-10">

                <div class="">
                    <input id="btnPrevious" data-previous class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Previous" />
                </div>
                <div class="">
                    <input id="btnSubmit" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Submit" />
                </div>
                <div>
                    <input id="btnClear" class="border border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                </div>
            </div>
            <!--Action Buttons End-->

        </div>


    </section>
    <!-- Multi-Step-Form Start End-->

    <link href="Template/css/MultiStepForm.css" rel="stylesheet" />
    <script src="Template/Js/MultiStepForm.js"></script>
</asp:Content>

