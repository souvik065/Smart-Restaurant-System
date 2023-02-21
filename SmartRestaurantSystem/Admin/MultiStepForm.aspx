<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="MultiStepForm.aspx.vb" Inherits="MultiStepForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class=" card justify-around flex space-x-10  w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
        <div class="progress-bar flex font-bold w-full justify-around mx-52 ">
            
            <div class="step text-center space-y-4">
                <p>Dish Name</p>
                <div class="bullet flex space-x-2 ">
                    <span  class="border progress-done py-1 px-3 rounded-full">1</span>
                    <span class="relative hidden left-1 text-orange-600 top-[0.5rem] ">

                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>

                    </span>
                </div>

            </div>
            <span class="progress-line h-1 w-1/5 bg-yellow-900 my-auto"></span>
            <div class="step text-center space-y-4">
                <p>Ingredience</p>
                <div class="flex space-x-2 ">
                    <span class="border py-1 px-3 rounded-full">2</span>
                    <span class="relative hidden text-orange-600 left-1 top-[0.5rem] ">

                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>

                    </span>
                </div>
            </div>
            <span class="h-1 w-1/5 bg-yellow-900 my-auto"></span>

            <div class="step text-center space-y-4">
                <p>Dish Photo</p>
                <div class="flex space-x-2 ">
                    <span class="border py-1 px-3 rounded-full">3</span>
                    <span class="relative hidden text-orange-600 left-1 top-[0.5rem] ">

                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>

                    </span>
                </div>
            </div>
        </div>
    </section>
    <section data-multi-step>

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
    <link href="Template/css/MultiStepForm.css" rel="stylesheet" />
    <script src="Template/Js/MultiStepForm.js"></script>
</asp:Content>

