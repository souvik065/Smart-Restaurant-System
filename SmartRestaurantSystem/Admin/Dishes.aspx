<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Dishes.aspx.vb" Inherits="Dishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Dishe Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Dishes </span></div>
            </div>
        </div>


        <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <div class="font-poppins-400 text-xl w-full space-y-10 px-5 py-5 font-bold">

                    <!-- Fields -->
                    <div class="grid gap-10 md:grid-cols-2  ">
                        <div class="flex space-x-5 w-full ">
                            <input id="hdnDish" type="hidden" />
                            <lable for="dllCategory" class="my-auto">Category Name </lable>
                            <select id="ddlCategory" onchange="ListAllSubCategory(this.value)" class="mx-auto bg-transparent py-2 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                                <option>--Selesct Category--</option>

                            </select>
                        </div>
                        <div class="flex space-x-5 w-full ">

                            <lable for="dllSubCategory" class="my-auto">Sub-Category Name </lable>
                            <select id="ddlSubCategory" class="  bg-transparent py-2 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                                <option>--Selesct Sub-Category--</option>

                            </select>
                        </div>
                        <div class="flex space-x-5 w-full ">

                            <lable for="txtIngredience" class="my-auto w-1/5">Ingredience </lable>
                            <input id="txtIngredience" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                        </div>
                        <div class="flex space-x-5 w-full text-center">

                            <lable for="txtDishName" class="my-auto w-1/5">Dish Name </lable>
                            <input id="txtDishName" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                        </div>
                    </div>
                        <div class="flex space-x-5 w-full ">

                            <lable for="fuDishPhoto" class="my-auto">Dish Photo </lable>
                            <div>
                            <input id="fuDishPhoto" class=" py-3 px-3 rounded-full
                                                        bg-gradient-to-br from-neutral-600 to-stone-700
                                                        file:rounded-full
                                                        file:border-none
                                                        file:text-white
                                                        file:px-6 file:py-3
                                                        file:cursor-pointer
                                                        file:shadow-lg file:shadow-yellow-900/50
                                                        cursor-pointer shadow-lg shadow-yellow-700/50
                                                        file:bg-yellow-800"
                                                        type="file" />
                                </div>
                            <img id="imgDishPhoto" alt="" src="#" width="100" height="60" style="display:block;" />
                            <input id="hdnPhotoPath" type="hidden" />
                        </div>

                    <!-- Fields End-->

                    <!-- Buttons -->
                    <div class="flex space-x-10">
                        <div class="">
                            <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer active:bg-black" type="button" value="Save" />
                        </div>
                        <div>
                            <input id="btnClear" class="border border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                        </div>
                    </div>
                    <!-- Buttons End-->


                </div>
            </div>

        </div>

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

                            <th class="justify-around">Actions</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                           <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th>Ingrediance</th>
                            <th>Dish Name</th>

                            <th class="justify-around">Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

    </section>
    <section class="h-[500px]"></section>

    <script>
// const { swal } = require("./Template/Js/sweetalert2@11");


        $(function () {
            table = $("#tblData").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillDishDetails(0);
            ListAllCategory();
        })






        function ClearFields() {
            $('#ddlCategory').val(0);
            $('#ddlSubCategory').val(0);
            $('#txtIngredience').val("");
            $('#txtDishName').val("");
            $('#hdnDishesID').val("");
            $('#imgDishPhoto').removeAttr('src');
            $('#imgDishPhoto').css('display', 'none');

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }


        $("#btnSave").on('click', function () {
            debugger;
            var categoryid = $('#dllCategory');
            var subcategoryid = $('#dllSubCategory');
            var dishid = $('#hdnDishID');
            var dishname = $('#txtDishName');
            var ingredience = $('#txtIngredience');


            var Validate = FormValidation(categoryid, subcategoryid, ingredience, dishname);
            if (Validate == true) {

                var DishID = dishid.val() == "" ? 0 : dishid.val();
                var CategoryID = categoryid.val();
                var SubCategoryID = subcategoryid.val();
                var Ingredience = ingredience.val().trim();
                var DishName = dishname.val().trim();

                $.ajax({

                    url: "WebServices/DishMasterWebService.asmx/DishMasterManage",
                    method: "POST",
                    data: "{SubCategoryID:" + JSON.stringify(SubCategoryID) + ",CategoryID:" + JSON.stringify(CategoryID) + " ,Ingredience:" + JSON.stringify(Ingredience) + ",DishName:"+JSON.stringify(DishName)+",DishPhoto:"+JSON.stringify()+"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = res.d;
                        if (result.includes("error")) {
                            console.log(result);
                        } else if (result.includes("Success")) {
                            swal.fire({
                                icon: "success",
                                text: result,
                                background: '#27272a',
                            })
                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });
                FillDishDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var categoryid = $("#hdnDishID");

            if (categoryid.val() > 0) {

                $("[id=btnSave]").val("Save");
                $("[id=btnClear]").val("Clear");

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

        function FillDishDetails(DishID) {
            $.ajax({

                url: "WebServices/DishMasterWebService.asmx/DishMasterGet",
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

                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditSubCategory(" + $(this).find("DishID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteSubCategory(" + $(this).find("DishID").text() + ")\" type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("CategoryName").text(),
                        $(this).find("SubCategoryName").text(),
                        $(this).find("Ingredience").text(),
                        $(this).find("SubCategoryName").text(),

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

                url: "WebServices/DishMasterWebService.asmx/DishMasterGet",
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
            debugger;
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnDishID]").val(Details.find("DishID").text());
            $("[id=ddlCategory]").val(Details.find("CategoryID").text());
            $("[id=ddlSubCategory]").val(Details.find("SubCategoryID").text());
            $("[id=txtIngredience]").val(Details.find("Ingredience").text());
            $("[id=txtDishName]").val(Details.find("DishName").text());


            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteDish(DishID) {

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

                        url: "WebServices/DishMasterWebService.asmx/DishMasterDelete",
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
                                swal.fire({
                                    title: "Deleted",
                                    icon: "success",
                                    text: result,
                                    background: '#27272a',

                                })

                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }

                    });
                    FillDishDetails(0);
                    ClearFields();



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


        /* File Upload Funtions*/

        $("#fuDishPhoto").on("change", function () {
            debugger;
            myfile = $(this).val();

            if (myfile == '') {
                document.getElementById("imgDishPhoto").src = "";
                $("#imgDishPhoto").attr("style", "display:none");
            }

            console.log("My File: ",myfile);
            var ext = myfile.split('.').pop();
            console.log("Ext: ", ext);

            var str = myfile.substring(0, 10) + "." + ext;
            console.log("Str: ", str);
            showFileSize(ext);

        });

        function showFileSize(ext)
        {
            debugger;

            var input, file;
            var fileUpload = $('#fuDishPhoto').get(0);
            console.log('File Upload Get: ',fileUpload)

            input = document.getElementById('fuDishPhoto');
            file = fileUpload.files[0];

            var size = parseFloat($('#fuDishPhoto')[0].files[0].size / 1024).toFixed(2);

            if (size <= 500) {
                var src = URL.createObjectURL(file);
                var preview = document.getElementById("imgDishPhoto");
                preview.src = src;
                preview.style.display = "block";

            } else {
                swal("Size Limit !", "Photo Size must be smaller than 500 kb.", "warning");
                $("#fuDishPhoto").val('');

            }

        }

        function SaveImage() {

            var fileUpload = $("#fuDishPhoto").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            var filepath = "";

            for (var i = 0; i < files.length; i++)
            {
                data.append(files[i].name, files[i]);
            }

            if (files.length > 0)
            {
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

                url: "WebServices/CategoryMasterWebService.asmx/ListAllCategory",
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

                url: "WebServices/SubCategoryMasterWebService.asmx/ListAllSubCategory",
                method: "POST",
                data: "{CategoryID:"+JSON.stringify(CategoryID)+"}",
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

        /* DropDown Filling Functions End*/


        /* Form Validation Functions*/

        function FormValidation(categoryid, subcategoryid, ingredience, dishname) {
            var returnval = true;
            debugger;
            if (categoryid.val() == 0) {
                $('#ddlCategoryWarning').text("*Please Select the Catgoey Name");
                returnval = false;
            }

            if (subcategoryid.val() == 0) {
                $('#ddlCategoryWarning').text("*Please Select the SubCatgoey Name")
                returnval = false;
            }

            if (ingredience.val() == "") {
                $('#txtIngredienceWarning').text("*Please Enter the Ingredience")
                returnval = false;
            }

            if (dishname.val() == "") {
                $('#txtDishNameWarning').text("*Please Enter the Dish Name")
                returnval = false;
            }

            return returnval;

        }

        function FormValTextBox(id) {
            if ($("#" + id).val() != "") {
                $("#" + id + "Warning").text("");
            }


        }

        function FormValDropDown(id) {
            if ($("#" + id).val() != 0) {
                $("#" + id + "Warning").text("");
            }


        }

        /* Form Validation Functions End*/


    </script>
</asp:Content>

