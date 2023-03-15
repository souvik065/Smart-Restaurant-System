<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DishMaster.aspx.cs" Inherits="Admin_DishMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section>
        <!-- Header -->
        <div class="w-full my-5  text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Dishe Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Dishes </span></div>
            </div>
        </div>
        <!-- Header End-->

        <!-- MultiStep Progrees Bar -->
        <section class=" card justify-around flex space-x-10  w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="progress-bar flex font-bold w-full justify-around 2xl:mx-52 xl: ">

                <!-- Step-1 Dish Name & Category -->
                <div class="step  text-center space-y-4 ">
                    <p>Dish Details</p>
                    <div class="bullet flex space-x-2  justify-center">
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
                    <p>Ingrediency</p>
                    <div class="bullet flex space-x-2 justify-center">
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


                <!-- Step-2     End-->

                <!-- Step-3    -->
                <div class="step text-center space-y-4">
                    <p>Dish Photo</p>
                    <div class="bullet flex space-x-2 justify-center">
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

                <div class="step text-center space-y-4">
                    <p>Finished</p>
                    <div class="bullet flex space-x-2 justify-center">
                        <span id="finished" class="border  py-1 px-1 rounded-full">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                            </svg></span>

                    </div>

                </div>

            </div>
        </section>
        <!-- MultiStep Progrees Bar End-->

        <!-- Hidden Fields Start-->
        <input id="hdnDishID" type="hidden" />
        <input id="fuDishPhoto" class="hidden py-3 px-3 rounded-full" type="file" />
        <input id="hdnPhotoPath" type="hidden" />
        <input id="hdnOldPhotoPath" type="hidden" />

        <!-- Hidden Fields End-->


        <!-- Multi-Step-Form  Start-->
        <section data-multi-step-form id="test1" class="font-poppins-400 text-xl font-bold">

            <!-- Step 1  Dish Category & Name Start-->
            <div data-step class="card step hidden w-full my-5 text-classic-yellow bg-classic-brown py-5 px-5 shadow-2xl space-y-10">
                <div></div>
                <h3 class="font-playfair-display-700 text-3xl text-gray-400 ">Dish Details</h3>
                <!-- Fields -->
                <div class="grid gap-11 2xl:grid-cols-3  xl:grid-cols-2  ">

                    <!-- Category Name -->
                    <div class="  w-full ">

                        <lable for="dllCategory" class="my-auto ">Category Name </lable>
                        <span id="ddlCategoryWarning" class="formerror text-red-600 text-sm"></span>

                        <select id="ddlCategory" onchange="CategoryOnChange(this.id,this.value)" class="mx-auto  bg-transparent py-3 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                            <option>--Selesct--</option>

                        </select>

                    </div>
                    <!-- Category Name End-->

                    <!-- Sub-Category Name -->
                    <div class=" w-full ">

                        <lable for="dllSubCategory" class="my-auto ">Sub-Category Name </lable>
                        <span id="ddlSubCategoryWarning" class="formerror text-red-600 text-sm"></span>
                        <select id="ddlSubCategory" onchange="SubCategoryOnChange(this.id, this.value)" class="  bg-transparent py-3 px-2 border w-full border-classic-dimyellow  text-center">
                            <option>--Select--</option>

                        </select>
                    </div>
                    <!-- Sub-Category Name End-->

                    <!-- Dish Name -->
                    <div class=" w-full ">
                        <lable for="txtDishName" class="my-auto w-1/5">Dish Name </lable>
                        <span id="txtDishNameWarning" class="formerror text-red-600  text-sm"></span>
                        <input id="txtDishName" onkeyup="FormValTextBox(this.id)" class="bg-transparent border w-full text-gray-400 font-bold border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                    </div>
                    <!-- Dish Name End-->

                </div>

                <h3 class="font-playfair-display-700 text-3xl text-gray-400 ">Pricing & Additional Info</h3>
                <div class="grid  sm:w-3/5 gap-5 " id="pricing">
                    <div class="sm:flex lg:text-center my-auto w-full ">
                        <lable for="txtRegular" class="my-auto w-1/5">Regular </lable>
                        <div class=" ">
                            <div>
                                <span id="txtRegularNameWarning" class="formerror text-red-600  text-sm"></span>
                                <div class="flex">
                                    <input id="txtRegular" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-bold border border-classic-dimyellow  w-full  w-1/2 py-1 px-1" placeholder="Regular: ₹199" type="text" />
                                    <span class=" relative right-5">₹</span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fields End-->

                <!-- Action buttons -->
                <div class="flex space-x-10">
                    <div class="">
                        <input id="btnStep1Next" data-next class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Next" />
                    </div>



                    <div>
                        <input id="btnStep1Clear" onclick="ClearField()" class="border bg-transparent border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                    </div>
                </div>
                <!--Action Buttons End-->

            </div>
            <!-- Step 1 Dish Category & Name End-->

            <!-- Step 2 Ingredients Start-->
            <div data-step class="card hidden step w-full my-5 text-classic-yellow  bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
                <h3 class="font-playfair-display-700 text-3xl text-gray-400">Choose Your Ingredients</h3>
                <!-- Ingredients Div Star-->
                <div id="MaterialCategories" class="overflow-y-auto max-h-96 shadow-inner inset-1">
                </div>
                <!-- Ingredients Div End-->

                <!-- Action buttons -->
                <div class="flex space-x-10">

                    <div class="">
                        <input id="btnStep2Previous" data-previous class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Previous" />
                    </div>
                    <div class="">
                        <input id="btnStep2Next" data-next class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Next" />
                    </div>


                    <div>
                        <input id="btnStep2Clear" onclick="ClearField()" class="border bg-transparent border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                    </div>
                </div>
                <!--Action Buttons End-->

            </div>
            <!-- Step 2 Ingredients End-->

            <!-- Step 3 Dish Photo Start-->
            <div data-step class="card hidden step w-full my-5 text-classic-yellow  bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
                <h3 class="font-playfair-display-700 text-3xl text-gray-400">Upload Dish Photo</h3>
                <div class="flex justify-center w-full ">

                    <!--Image Preview-->
                    <div class="md:flex md:justify-center  ">
                        <div class="text-center min-w-[15rem] max-w-[20rem] h-full rounded-lg overflow-hidden ">
                            <div><span id="imgDishPhotoWarning" class="formerror text-red-600  text-sm"></span></div>

                            <label for="fuDishPhoto" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer  hover:bg-bray-800 bg-gray-700 hover:bg-gray-100 border-gray-600 hover:border-gray-500 hover:bg-gray-600">
                                <img id="imgDishPhoto" alt="" onchange="FormValTextBox(this.id)" src="#" style="display: none;" class="h-full w-full" />
                                <div class="ImagePreviewLabel  flex flex-col items-center justify-center absolute pt-5 pb-6">
                                    <svg aria-hidden="true" class="w-10 h-10 mb-3 text-gray-400" fill="none" stroke="currentcolor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 16a4 4 0 01-.88-7.903a5 5 0 1115.9 6l16 6a5 5 0 011 9.9m15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                                    <p class="mb-2 text-sm text-gray-500 dark:text-gray-400"><span class="font-semibold">click to upload</span> or drag and drop</p>
                                    <p class="text-xs text-gray-500 dark:text-gray-400">png or jpg  (max. 800x400px)</p>
                                </div>
                            </label>
                        </div>
                    </div>
                    <!--Image Preview End-->
                </div>

                <!-- Action buttons -->
                <div class="flex space-x-10">

                    <div class="">
                        <input id="btnStep3Previous" data-previous class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Previous" />
                    </div>
                    <div class="">
                        <input id="btnSubmit" data-next class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Submit" />
                    </div>

                    <div>
                        <input id="btnCancel" class="border hidden bg-transparent border-yellow-700 text-yellow-700 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Cancel" />
                    </div>

                    <div>
                        <input id="btnStep3Clear" class="border bg-transparent border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                    </div>
                </div>
                <!--Action Buttons End-->

            </div>
            <!-- Step 3 Dish Photo End-->

            <div data-step class="flex card hidden justify-center items-center text-center w-full my-5 text-classic-yellow  bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
                <div class="space-y-10 py-5">
                    <h1 class="text-5xl text-green-600">Success</h1>

                    <input type="button" onclick="AddDish()" value="+ Add Dish" class="border border-yellow-900 bg-transparent text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" />
                </div>
            </div>


        </section>
        <!-- Multi-Step-Form  End-->

        <!--Table Section-->
        <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <table class="table-fixed" id="tblData">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th>Ingrediance</th>
                            <th>Dish Name</th>
                            <th>Dish Photo</th>


                            <th class="justify-between">Actions</th>
                        </tr>
                    </thead>



                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th>Ingrediance</th>
                            <th>Dish Name</th>
                            <th>Dish Photo</th>


                            <th class="justify-between">Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <!--Table Section End-->

    </section>

    <section class="h-[500px]"></section>
    <link href="Template/css/MultiStepForm.css" rel="stylesheet" />
    <script src="Template/Js/MultiStepForm.js"></script>
    <script>


        // Variables
        var ingredients = [];
        var ingredientsname = [];
        var measuretype = [];
        var idishid = "";
        var test1 = "";

        $(function () {
            table = $("#tblData").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillDishDetails(0);
            ListAllCategory();
            ListAllMaterialCategory();
            FillIngredientsDetails(50);

            console.log(ingredientsname);


        })

        function CategoryOnChange(id, value) {
            FormValDropDown(id)
            ListAllSubCategory(value)
        }

        function SubCategoryOnChange(id, value) {
            FormValDropDown(id)
            ListAllMeasureTypeBySubCategory(value)
        }


        function AddDish() {
            currentStep = 0;
            showCurrentStep();
            FillProgressLine();
        }


        $("#btnSubmit").on('click', function () {


            var categoryid = $('#ddlCategory');
            var subcategoryid = $('#ddlSubCategory');
            var dishid = $('#hdnDishID');
            var dishname = $('#txtDishName');
            var dishphoto = $('#fuDishPhoto');
            var hdnphotopath = $("#hdnPhotoPath");
            var hdnoldphotopath = $("#hdnOldPhotoPath");



            var Validate = FormValidation(categoryid, subcategoryid, dishname, dishphoto, hdnphotopath);
            if (Validate == true) {

                var DishID = dishid.val() == "" ? 0 : dishid.val();
                var CategoryID = categoryid.val();
                var SubCategoryID = subcategoryid.val();
                var DishName = dishname.val().trim();
                var DishPhoto = ""
                var HdnOldPhotoPath = hdnoldphotopath.val() == "" ? "Null" : hdnoldphotopath.val();

                if (hdnphotopath.val() != "") {
                    DishPhoto = hdnphotopath.val();

                } else {
                    if (dishphoto.val() != "") {
                        DishPhoto = SaveImage();

                    }
                }

                $.ajax({

                    url: "../WebServices/DishMasterWebService.asmx/DishMasterManage",
                    method: "POST",
                    data: "{DishID:" + JSON.stringify(DishID) + ", SubCategoryID:" + JSON.stringify(SubCategoryID) + ",CategoryID:" + JSON.stringify(CategoryID) + ",DishName:" + JSON.stringify(DishName) + ",DishPhoto:" + JSON.stringify(DishPhoto) + ", OldPhotoPath:"+JSON.stringify(HdnOldPhotoPath)+"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (!result.includes("error")) {
                            if (DishID > 0) {
                                DeleteIngredients(DishID);
                                InsertIngredients(DishID);
                                UpdatePrice(DishID);
                                swal.fire({
                                    icon: "success",
                                    text: result,
                                    background: '#27272a',
                                })
                            } else {
                                InsertIngredients(result);
                                InsertPrice(result);

                                swal.fire({
                                    icon: "success",
                                    text: "Dish Inserted Successfully",
                                    background: '#27272a',
                                })

                            }
                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });

                FillDishDetails(0);
                ResetPage();

                currentStep += 1;
                showCurrentStep();
            }


        });




        


        function FillDishDetails(DishID) {
            $.ajax({

                url: "../WebServices/DishMasterWebService.asmx/DishMasterGet",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }

        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            table.clear();

            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";
                    var ings = "";
                    var ing1 = "";
                    FillIngredientsDetails($(this).find("DishID").text());
                    ingredientsname.map(ing => {
                        ing1 += ing + ",";
                    })
                    ings = ing1.replace(/,*$/, '');

                    strImage = "<img class='rounded-full'  src='../Assets/Images/" + $(this).find("DishPhoto").text() + "' style=' height:100px; width:100px; ' >"
                    strEditDelete += " <input class='bg-yellow-900 mx-2 xl:py-3 xl:px-5 text-center text-white py-1 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditDish(" + $(this).find("DishID").text() + ")' type='button' value='Edit' />";
                    strEditDelete += " <input class='bg-red-900 mx-2 xl:py-3 xl:px-5 text-center text-white py-1 px-3 hover:bg-red-600 cursor-pointer' onclick='DeleteDish(" + $(this).find("DishID").text() + ",\"" + $(this).find("DishPhoto").text() + "\")' type='button' value='Delete' />";

                    // strEditDelete += " <input class='bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteSubCategory(" + $(this).find("DishID").text(), $(this).find("DishPhoto").text() + ")' type='button' value='Delete' />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("CategoryName").text(),
                        $(this).find("SubCategoryName").text(),
                        ings,
                        $(this).find("DishName").text(),
                        strImage,
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }

        function EditDish(DishID) {
            $.ajax({

                url: "../WebServices/DishMasterWebService.asmx/DishMasterGet",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillDishDetails(0);

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnDishID]").val(Details.find("DishID").text());
            $("[id=ddlCategory]").val(Details.find("CategoryID").text());
            ListAllSubCategory(Details.find("CategoryID").text());
            $("[id=ddlSubCategory]").val(Details.find("SubCategoryID").text());
            $("[id=txtIngredience]").val(Details.find("Ingredience").text());
            $("[id=txtDishName]").val(Details.find("DishName").text());

            $("#hdnPhotoPath").val(Details.find("DishPhoto").text());
            $("#imgDishPhoto").attr("style", "display:block");
            $("#imgDishPhoto").prop("src", "../Assets/Images/" + Details.find("DishPhoto").text());
            var prelabel = document.querySelector(".ImagePreviewLabel");
            prelabel.classList.add("hidden");

            /*-- Filling Ingredients Details of a Particular Dish --Start*/ 
            EditIngredients(Details.find("DishID").text())
            var checkboxes = [...document.querySelectorAll(".MaterialCheckbox")];
            checkboxes.map(checkbox => {
                checkbox.checked = false;
            });
            checkboxes.map(checkbox => {

                let index = ingredients.indexOf(checkbox.value);
                if (index === -1) {

                } else {
                    checkbox.checked = true;
                }

            });
            /*-- Filling Ingredients Details of a Particular Dish --End*/

            /*-- Filling Price Details of a Particular Dish --Start*/
            ListAllMeasureTypeBySubCategory(Details.find("SubCategoryID").text());
            ListAllPriceByMeasureTypeOfADish(Details.find("DishID").text());

            /*-- Filling Price Details of a Particular Dish --End*/

            currentStep = 0;
            showCurrentStep();

            document.getElementById("btnCancel").classList.remove("hidden");

            $("[id*=txtDishName]").focus();

            $("[id=btnSubmit]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }

        function DeleteDish(DishID, DishPhoto) {

            swal.fire({
                icon: "warning",
                text: "Are you sure.",
                background: '#27272a',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true



            }).then((result) => {
                if (result.isConfirmed) {
                    var msg = "";
                    $.ajax({

                        url: "../WebServices/DishMasterWebService.asmx/DishMasterDelete",
                        method: "POST",
                        data: "{DishID:" + JSON.stringify(DishID) + ", DishPhoto:" + JSON.stringify(DishPhoto) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (result.includes("Success")) {
                                DeletePrice(DishID);
                                msg = result;
                                swal.fire({
                                    title: "Deleted",
                                    icon: "success",
                                    text: result,
                                    background: '#27272a',

                                })
                                DeleteIngredients(DishID);

                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });
                    FillDishDetails(0);




                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    swal.fire({
                        title: "Cancelled",
                        text: "Your Record is Safe :)",
                        icon: "info",
                        background: '#27272a',

                    })

                }
            })

        }


        /* Clear Functions Start */
        function ClearField() {
            if ($('#btnStep1Clear').click) {

                $('#ddlCategory').val(0);
                $('#ddlSubCategory').val(0);
                $('#txtDishName').val("");

            }

            if ($('#btnStep2Clear').click) {
                var checkboxes = [...document.querySelectorAll(".MaterialCheckbox")];
                checkboxes.map(box => {
                    box.checked = false;
                })
                ingredients = [];
            }

            if ($('#btnStep3Clear').click) {



            }

        }

        function ResetPage() {
            var prelabel = document.querySelector(".ImagePreviewLabel");
            var preview = document.getElementById("imgDishPhoto");
            preview.src = "";
            prelabel.classList.remove("hidden");
            $('#ddlCategory').val(0);
            $('#ddlSubCategory').val(0);
            $('#txtDishName').val("");
            $('#hdnDishID').val("");
            $('#fuDishPhoto').val("");
            $('#imgDishPhoto').removeAttr('src');
            $('#imgDishPhoto').css('display', 'none');
            ingredients = [];
            $("[id=btnSubmit]").val("Submit");
            $("[id=btnClear]").val("Clear");

            var checkboxes = [...document.querySelectorAll(".MaterialCheckbox")];
            checkboxes.map(checkbox => {
                checkbox.checked = false;
            });

        }

        function Cancle() {

            $("#btnCancle").on('click', function () {
                var dishid = $("#hdnDishID");

                if (dishid.val() > 0) {



                    ClearFields();

                    Swal.fire({
                        title: 'Cancled',
                        text: 'Record Updation Terminted',
                        color: "white",
                        background: '#27272a',
                        icon: 'info'

                    })

                } else {
                    ClearFields();
                }

            });

        }

        /* Clear Functions End*/



        /* Ingredients Master Methods Start*/

        function InsertIngredients(DishID) {

            ingredients.map(ing => {


                $.ajax({

                    url: "../WebServices/IngredientsMasterWebService.asmx/IngredientsMasterInsert",
                    method: "POST",
                    data: "{MaterialID:" + JSON.stringify(ing) + ",DishID:" + JSON.stringify(DishID) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (!result.includes("error")) {

                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });

            });


        }

        function DeleteIngredients(DishID) {
            debugger;
            $.ajax({

                url: "../WebServices/IngredientsMasterWebService.asmx/IngredientsMasterDelete",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var result = res.d;
                    if (result.includes("error")) {
                        console.log(result);
                    } else if (result.includes("Success")) {
                        msg = result;


                    }
                },
                error: function (err) {
                    console.log(err)
                }

            });

        }

        function FillIngredientsDetails(DishID) {
            $.ajax({

                url: "../WebServices/IngredientsMasterWebService.asmx/IngredientsMasterGet",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnIngredientsMasterGetSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }

        function OnIngredientsMasterGetSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");

            ingredientsname = [];

            if (Details.length > 0) {
                $.each(Details, function () {

                    ingredientsname.push($(this).find("MaterialName").text())
                })

            }
            else {

            }
            console.log("Ingredients Name: ", ingredientsname);
        }

        function EditIngredients(DishID) {
            $.ajax({

                url: "../WebServices/IngredientsMasterWebService.asmx/IngredientsMasterGet",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnIngredientsMasterEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }

        function OnIngredientsMasterEditSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            table.clear();
            ingredients = [];
            if (Details.length > 0) {
                $.each(Details, function () {

                    ingredients.push($(this).find("MaterialID").text())
                })
                console.log("Ingredients: ", ingredients);

            }
            else {

            }

        }
        /* Ingredients Master Methods End*/


        /* MeasureType Master Methods Start*/
        function ListAllMeasureTypeBySubCategory(SubCategoryID) {

            $.ajax({

                url: "../WebServices/MeasureTypeMasterWebService.asmx/ListAllMeasureTypeBySubCategory",
                method: "POST",
                data: "{SubCategoryID:" + JSON.stringify(SubCategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnListAllMeasureTypeBySubCategorySuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

        }

        function OnListAllMeasureTypeBySubCategorySuccess(response) {
            debugger;
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");


            var divTag = "";
            measuretype = [];
            if (Details.length > 0) {
                $.each(Details, function () {
                    debugger;

                    measuretype.push($(this).find("MeasureTypeID").text());

                    divTag += `<div class="sm:flex lg:text-center my-auto w-full ">
                               <lable for="`+ $(this).find("MeasureTypeID").text() + `" class="my-auto w-1/5">` + $(this).find("MeasureType").text() + `</lable>
                               <div class=" ">
                                    <div>
                                        <span id="`+ $(this).find("MeasureTypeID").text() + `Warning" class="formerror text-red-600  text-sm"></span>
                                        <div class="flex">
                                        <input id="`+ $(this).find("MeasureTypeID").text() + `" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-bold border border-classic-dimyellow  w-full  w-1/2 py-1 px-1" placeholder="₹199" type="text" />
                                        <span class=" relative right-5">₹</span>
                                        </div>
                                    </div>
                                </div>
                                </div>`;


                })

            }
            $("#pricing").html(divTag);
            console.log("MeasureType: ", measuretype);

        }
        /* MeasureType Master Methods End*/


        /* Price Master Methods Start*/
        function InsertPrice(DishID) {

            measuretype.map(measuretype => {

                var Price = $("#" + measuretype + "").val().trim();
                if (Price != "") {

                    $.ajax({

                        url: "../WebServices/PriceMasterWebService.asmx/PriceMasterInsert",
                        method: "POST",
                        data: "{DishID:" + JSON.stringify(DishID) + ",MeasureTypeID:" + JSON.stringify(measuretype) + ",Price:" + JSON.stringify(Price) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (res) {
                            var result = res.d;
                            if (result.includes("error")) {
                                console.log(result);
                            } else if (!result.includes("error")) {

                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });

                }

            });





        }

        function UpdatePrice(DishID) {
            measuretype.map(measuretype => {
                var Price = $("#" + measuretype + "").val().trim();

                $.ajax({

                    url: "../WebServices/PriceMasterWebService.asmx/PriceMasterUpdate",
                    method: "POST",
                    data: "{DishID:" + JSON.stringify(DishID) + ",MeasureTypeID:" + JSON.stringify(measuretype) + ",Price:" + JSON.stringify(Price) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (!result.includes("error")) {

                        }
                    },
                    async: false,
                    error: function (err) {
                        console.log(err);
                    }

                });

            });
        }

        function DeletePrice(DishID) {
            
                $.ajax({

                    url: "../WebServices/PriceMasterWebService.asmx/PriceMasterDelete",
                    method: "POST",
                    data: "{DishID:" + JSON.stringify(DishID) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (!result.includes("error")) {

                        }
                    },
                    async: false,
                    error: function (err) {
                        console.log(err);
                    }

                });

            
        }


        function ListAllPriceByMeasureTypeOfADish(DishID) {

            $.ajax({

                url: "../WebServices/PriceMasterWebService.asmx/ListAllPriceByMeasureTypeOfADish",
                method: "POST",
                data: "{DishID:" + JSON.stringify(DishID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnListAllPriceByMeasureTypeOfADishSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

        }

        function OnListAllPriceByMeasureTypeOfADishSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");


            if (Details.length > 0) {
                $.each(Details, function () {
                    debugger;
                    $("#" + $(this).find("MeasureTypeID").text() + "").val($(this).find("Price").text());

                });

            }
            
        }

        /* Price Master Methods End*/



        /* File Upload Funtions*/
        $("#fuDishPhoto").on("change", function () {
            myfile = $(this).val();

            if (myfile == '') {
                document.getElementById("imgDishPhoto").src = "";
                $("#imgDishPhoto").attr("style", "display:none");
            }

            console.log("My File: ", myfile);
            var ext = myfile.split('.').pop();
            console.log("Ext: ", ext);

            var str = myfile.substring(0, 10) + "." + ext;
            console.log("Str: ", str);
            showFileSize(ext);

        });

        function showFileSize(ext) {

            var input, file;
            var fileUpload = $('#fuDishPhoto').get(0);
            console.log('File Upload Get: ', fileUpload)

            input = document.getElementById('fuDishPhoto');
            file = fileUpload.files[0];

            var size = parseFloat($('#fuDishPhoto')[0].files[0].size / 1024).toFixed(2);

            if (size <= 500) {
                var src = URL.createObjectURL(file);
                var preview = document.getElementById("imgDishPhoto");
                var prelabel = document.querySelector(".ImagePreviewLabel");
                prelabel.classList.add("hidden");
                preview.src = src;
                preview.style.display = "block";
                $('#imgDishPhotoWarning').text("")




            } else {
                swal.fire("Size Limit !", "Photo Size must be smaller than 500 kb.", "warning");
                $("#fuDishPhoto").val('');

            }

        }

        function SaveImage() {

            var fileUpload = $("#fuDishPhoto").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            var filepath = "";

            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            if (files.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "../FileHandler.ashx?Type=DishPhoto",
                    data: data,
                    async: false,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        filepath = result;

                    },
                    error: function (err) {
                        var e = err.d;
                        console.log(e);

                    }
                });
            }
            return filepath;

        }
        /* File Upload Funtions End*/



        /* DropDown Filling Functions*/
        function ListAllCategory() {

            $.ajax({

                url: "../WebServices/CategoryMasterWebService.asmx/ListAllCategory",
                method: "POST",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlCategory");
                    ddlcatgeory.empty();
                    //ddlcatgeory.append($("<option></option>").val('0').text('-- Select Category --'));
                    $.each(res.d, function () {
                        ddlcatgeory.append($("<option></option>").val(this['Value']).text(this['Text']));
                    })
                },
                error: function (err) {
                    console.log(err)
                }

            });


        }

        function ListAllSubCategory(CategoryID) {

            $.ajax({

                url: "../WebServices/SubCategoryMasterWebService.asmx/ListAllSubCategory",
                method: "POST",
                data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlSubCategory");
                    ddlcatgeory.empty();
                    //ddlcatgeory.append($("<option></option>").val('0').text('-- Select Category --'));
                    $.each(res.d, function () {
                        ddlcatgeory.append($("<option></option>").val(this['Value']).text(this['Text']));
                    })
                },
                error: function (err) {
                    console.log(err)
                }

            });


        }

        function ListAllMaterial(CategoryID) {


            $.ajax({
                url: "../WebServices/MaterialMasterWebService.asmx/ListAllMaterialByCategory",
                method: "POST",
                data: "{MaterialCategoryID:" + JSON.stringify(CategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnListAllMaterialSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });



        }

        function OnListAllMaterialSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";
            var MaterialCategoryID;
            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += `<div class="h-[9rem] overflow-hidden bg-classic-dark-brown  min-w-[5rem] max-w-[9rem] px-3 rounded " >
                                <div class=" ">
                                    <input id="Checkbox`+ $(this).find("MaterialName").text() + `"  class="MaterialCheckbox" type="checkbox" name="Material" value="` + $(this).find("MaterialID").text() + `" />
                                    <label for="Checkbox`+ $(this).find("MaterialName").text() + `" class="cursor-pointer w-full h-full text-center ">
                                        <div class="rounded h-24 overflow-hidden">
                                            <img class="w-full max-h-max " src="../Assets/Images/`+ $(this).find("MaterialPhoto").text() + `" />
                                        </div>
                                        <div class="font-semibold text-gray-400 text-sm my-auto h-full">`+ $(this).find("MaterialName").text() + `</div>
                                    </label>
                               </div>
                              </div>
                                `;
                    MaterialCategoryID = $(this).find("MaterialCategoryID").text();
                })
            }

            $("#" + MaterialCategoryID).html(divTag);
        }

        function ListAllMaterialCategory() {
            $.ajax({
                url: "../WebServices/MaterialCategoryMasterWebService.asmx/MaterialCategoryMasterGet",
                method: "POST",
                data: "{MaterialCategoryID:0}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnListAllMaterialCategorySuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
        }

        function OnListAllMaterialCategorySuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Details = xml.find("DataDetails");

            var divTag = "";

            if (Details.length > 0) {
                $.each(Details, function () {

                    divTag += ` <div  class=" space-x-10  overflow-x-auto py-2 px-2 border-t border-t border-classic-dimyellow" >
                                    <div class="">
                                      <h4 class="font-playfair-display-500 font-bold">`+ $(this).find("MaterialCategoryName").text() + `</h4>
                                    </div>
                                    <div data-material-category class="flex py-2 space-x-10"  id="` + $(this).find("MaterialCategoryID").text() + `" >

                                    </div>
                                </div>`;
                })


            }
            else {

            }
            $("#MaterialCategories").html(divTag);

            $.each(Details, function () {
                ListAllMaterial($(this).find("MaterialCategoryID").text());

            })
        }
        /* DropDown Filling Functions End*/


        /* Form Validation Functions*/
        function FormValidation(categoryid, subcategoryid, dishname, dishphoto, hdnphotopath) {
            var returnval = true;
            if (categoryid.val() == 0) {
                $('#ddlCategoryWarning').text("*Please Select the Catgoey Name");
                returnval = false;
            }

            if (subcategoryid.val() == 0) {
                $('#ddlSubCategoryWarning').text("*Please Select the SubCatgoey Name")
                console.log(subcategoryid.val());
                returnval = false;
            }


            if (dishname.val() == "") {
                $('#txtDishNameWarning').text("*Please Enter the Dish Name")
                returnval = false;
            }

            if (hdnphotopath.val() == '') {
                if (dishphoto.val() == '') {
                    $('#imgDishPhotoWarning').text("*Please Select the Dish Photo")
                    swal.fire({
                        title: "Dish Photo is Not Selected",
                        text: "Please Select the Dish Photo",
                        icon: "warning",
                        background: '#27272a',

                    })

                    returnval = false;
                }

            }



            return returnval;

        }

        function Step1Validation(categoryid, subcategoryid, dishname) {
            var returnval = true;
            if (categoryid.val() == 0) {
                $('#ddlCategoryWarning').text("*Please Select the Catgoey Name");
                returnval = false;
            }

            if (subcategoryid.val() == 0) {
                $('#ddlSubCategoryWarning').text("*Please Select the SubCatgoey Name")
                console.log(subcategoryid.val());
                returnval = false;
            }

            if (dishname.val() == "") {
                $('#txtDishNameWarning').text("*Please Enter the Dish Name")
                returnval = false;
            }

            return returnval;

        }

        function Step2Validation(ingredients) {
            var returnval = true;
            if (ingredients.length <= 0) {
                swal.fire({
                    title: "Ingredients is Not Selected",
                    text: "Please Select the Ingredients",
                    icon: "Altert",
                    background: '#27272a',

                })
                returnval = false;
            }

            return returnval;
        }
        /* Form Validation Functions End*/


        /* MultiStep Form Script Start*/
        multiStepForm.addEventListener("click", e => {

            if (e.target.matches("[data-next]")) {


                if (currentStep == 1) {
                    var validate = Step2Validation(ingredients);
                    if (validate == true) {
                        currentStep += 1;
                    }
                }

                if (currentStep == 0) {
                    var categoryid = $('#ddlCategory');
                    var subcategoryid = $('#ddlSubCategory');
                    var dishname = $('#txtDishName');
                    var validate = Step1Validation(categoryid, subcategoryid, dishname)
                    if (validate == true) {
                        currentStep += 1

                    }
                }





            } else if (e.target.matches("[data-previous]")) {
                currentStep -= 1
            }

            // Storing Ingredience to an Array Variable 
            var checkboxes = [...document.querySelectorAll(".MaterialCheckbox")];
            for (var checkbox of checkboxes) {
                checkbox.addEventListener("click", function () {
                    if (this.checked == true) {
                        if (!ingredients.includes(this.value)) {
                            ingredients.push(this.value);

                        }

                    } else {
                        if (ingredients.includes(this.value)) {

                            ingredients.splice(ingredients.indexOf(this.value), 1)
                        }
                    }
                });
                console.log(ingredients)
            }

            showCurrentStep()
        });
        /* MultiStep Form Script End*/



    </script>
</asp:Content>

