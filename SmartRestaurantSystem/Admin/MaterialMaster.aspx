<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MaterialMaster.aspx.cs" Inherits="Admin_MaterialMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <!-- Header -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Material Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Dishes </span></div>
            </div>
        </div>
        <!-- Header End-->


        <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <div class="font-poppins-400 text-xl w-full space-y-12 px-5 py-5 font-bold">

                    <!-- Fields -->

                    <!--Image Preview-->
                    <div class="md:flex md:justify-center xl:items-end xl:justify-start ">
                        <div class="text-center min-w-[15rem]  h-[17rem] rounded-lg overflow-hidden ">
                            <div><span id="imgMaterialWarning" class="formerror text-red-600  text-sm"></span></div>

                            <label for="fuMaterialPhoto" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer  hover:bg-bray-800 bg-gray-700 hover:bg-gray-100 border-gray-600 hover:border-gray-500 hover:bg-gray-600">
                                <img id="imgMaterialPhoto" alt="" onchange="FormValTextBox(this.id)" src="#" style="display: none;" class="h-full w-full" />
                                <div class="ImagePreviewLabel  flex flex-col items-center justify-center absolute pt-5 pb-6">
                                    <svg aria-hidden="true" class="w-10 h-10 mb-3 text-gray-400" fill="none" stroke="currentcolor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m7 16a4 4 0 01-.88-7.903a5 5 0 1115.9 6l16 6a5 5 0 011 9.9m15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                                    <p class="mb-2 text-sm text-gray-500 dark:text-gray-400"><span class="font-semibold">click to upload</span> or drag and drop</p>
                                    <p class="text-xs text-gray-500 dark:text-gray-400">png or jpg  (max. 800x400px)</p>
                                </div>
                            </label>
                        </div>
                    </div>
                    <input id="fuMaterialPhoto" class=" hidden " type="file" />
                    <input id="hdnPhotoPath" type="hidden" />

                    <!--Image Preview End-->


                    <!--Other Fields -->
                    <div class="grid gap-11 grid-cols-1  xl:grid-cols-3 md:grid-cols-2 ">
                        <!-- Material Category Name -->
                            <input id="hdnMaterialID" type="hidden" />

                        <div class="  w-full ">
                            <lable for="ddlMaterialCategory" class="my-auto">Material Category </lable>
                            <span id="ddlMaterialCategoryWarning" class="formerror text-red-600 text-sm"></span>

                            <select id="ddlMaterialCategory" onchange="FormValDropDown(this.id)" class="mx-auto  text-gray-400 bg-transparent py-3 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                                <option>--Select--</option>

                            </select>
                        </div>
                    <!-- Material Category Name End-->

                    <!-- Material Name-->
                    <div class=" w-full ">
                        <lable for="txtMaterialName" class="my-auto w-1/5">Material Name </lable>
                        <span id="txtMaterialNameWarning" class="formerror text-red-600  text-sm"></span>
                        <input id="txtMaterialName" onkeyup="FormValTextBox(this.id)" class="bg-transparent border text-gray-400 w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                    </div>
                    <!-- Material Name End-->

                    <!-- Measured In -->
                    <div class=" w-full ">
                        <lable for="txtMeasuredIn" class="my-auto w-1/5">Measured In </lable>
                            <span id="txtMeasuredInWarning" class="formerror text-red-600  text-sm"></span>
                             <select id="ddlMeasuredIn" onchange="FormValDropDown(this.id)" class="mx-auto text-gray-400  bg-transparent py-3 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                                <option>--Select--</option>
                                <option>Kg</option>
                                <option>g</option>
                                <option>LT</option>
                                <option>ml</option>
                                <option>Dozen</option>
                                <option>Kg/g</option>
                                <option>lt/ml</option>


                                
                            </select>
                    </div>
                    <!-- Measured In End-->

                </div>
                <!--Other Fields End-->




                <!-- Fields End-->

                <!-- Buttons -->
                <div class="flex space-x-10">
                    <div class="">
                        <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer active:bg-black" type="button" value="Save" />
                    </div>
                    <div>
                        <input id="btnClear" class="border bg-transparent border-yellow-900 text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                    </div>
                </div>
                <!-- Buttons End-->


                </div>
            </div>

        </div>

        <!--Table Section-->
        <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <table class="table-fixed" id="tblMaterial">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Material Name</th>
                            <th>Material Category</th>
                            <th>Measured In</th>
                            <th>Material Photo</th>


                            <th class="justify-around">Actions</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Material Name</th>
                            <th>Material Category</th>
                            <th>Measured In</th>
                            <th>Material Photo</th>


                            <th class="justify-around">Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <!--Table Section End-->

    </section>
    <section class="h-[500px]"></section>

    <script>
        // const { swal } = require("./Template/Js/sweetalert2@11");


        $(function () {
            table = $("#tblMaterial").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillMaterialDetails(0);
            ListAllMaterialCategory();
        })

        function MaterialCategoryOnChange(id) {
            FormValDropDown(id)
        }


        function ClearFields() {

            $('#ddlMaterialCategory').val(0);
            $('#txtMaterialName').val("");
            $('#ddlMeasuredIn').val(0);
            $('#hdnMaterialID').val("");
            $('#imgMaterialPhoto').removeAttr('src');
            $('#imgMaterialPhoto').css('display', 'none');

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }


        $("#btnSave").on('click', function () {
            debugger;

            var materialcategoryid = $('#ddlMaterialCategory');
            var materialid = $('#hdnMaterialID');
            var materialname = $('#txtMaterialName');
            var measuredin = $('#ddlMeasuredIn');
            var materialphoto = $('#fuMaterialPhoto');
            var hdnphotopath = $("#hdnPhotoPath");

            var Validate = FormValidation(materialcategoryid, materialname, measuredin, materialphoto, hdnphotopath);
            if (Validate == true) {

                var MaterialID = materialid.val() == "" ? 0 : materialid.val();
                var MaterialCategoryID = materialcategoryid.val();
                var MaterialName = materialname.val().trim();
                var MeasuredIn = measuredin.val().trim();
                var MaterialPhoto = ""
                if (hdnphotopath.val() != "") {
                    MaterialPhoto = hdnphotopath.val();

                } else {
                    if (materialphoto.val() != "") {
                        MaterialPhoto = SaveImage();

                    }
                }

                $.ajax({

                    url: "../WebServices/MaterialMasterWebService.asmx/MaterialMasterManage",
                    method: "POST",
                    data: "{MaterialID:" + JSON.stringify(MaterialID) + ", MaterialName:" + JSON.stringify(MaterialName) + ",MeasuredIn:" + JSON.stringify(MeasuredIn) + " ,MaterialCategoryID:" + JSON.stringify(MaterialCategoryID) + ", MaterialPhoto:"+JSON.stringify(MaterialPhoto)+"}",
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
                FillMaterialDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var materialid = $("#hdnMaterialID");

            if (materialid.val() > 0) {

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

        function FillMaterialDetails(MaterialID) {
            $.ajax({

                url: "../WebServices/MaterialMasterWebService.asmx/MaterialMasterGet",
                method: "POST",
                data: "{MaterialID:" + JSON.stringify(MaterialID) + "}",
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
            debugger;
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var Details = xml.find("DataDetails");
            table.clear();

            if (Details.length > 0) {
                $.each(Details, function () {


                    var strEditDelete = "";

                    strImage = "<img class='rounded-full'  src='../Assets/Images/" + $(this).find("MaterialPhoto").text() + "' style=' height:100px; width:100px; ' >"
                    strEditDelete += " <input class='bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditMaterial(" + $(this).find("MaterialID").text() + ")' type='button' value='Edit' />";
                    strEditDelete += " <input class='bg-red-900 mx-2 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteMaterial(" + $(this).find("MaterialID").text() + ",\"" + $(this).find("MaterialPhoto").text() + "\")' type='button' value='Delete' />";



                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("MaterialName").text(),
                        $(this).find("MaterialCategoryName").text(),
                        $(this).find("MeasuredIn").text(),
                        strImage,
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditMaterial(MaterialID) {
            $.ajax({

                url: "../WebServices/MaterialMasterWebService.asmx/MaterialMasterGet",
                method: "POST",
                data: "{MaterialID:" + JSON.stringify(MaterialID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillMaterialDetails(0);

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnMaterialID]").val(Details.find("MaterialID").text());
            $("[id=ddlMaterialCategory]").val(Details.find("MaterialCategoryID").text());
            $("[id=txtMaterialName]").val(Details.find("MaterialName").text());
            $("[id=txtMeasuredIn]").text(Details.find("MeasuredIn").text());

            $("#hdnPhotoPath").val(Details.find("MaterialPhoto").text());
            $("#imgMaterialPhoto").attr("style", "display:block");
            $("#imgMaterialPhoto").prop("src", "../Assets/Images/" + Details.find("MaterialPhoto").text());
            var prelabel = document.querySelector(".ImagePreviewLabel");
            prelabel.classList.add("hidden");

            $("[id*=txtMaterialName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteMaterial(MaterialD, MaterialPhoto) {

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

                        url: "../WebServices/MaterialMasterWebService.asmx/MaterialMasterDelete",
                        method: "POST",
                        data: "{MaterialID:" + JSON.stringify(MaterialD) + ", MaterialPhoto:"+JSON.stringify(MaterialPhoto)+"}",
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
                    FillMaterialDetails(0);
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



        /* DropDown Filling Functions*/
        function ListAllMaterialCategory() {

            $.ajax({

                url: "../WebServices/MaterialCategoryMasterWebService.asmx/ListAllMaterialCategory",
                method: "POST",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlMaterialCategory");
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

        /* File Upload Funtions*/
        $("#fuMaterialPhoto").on("change", function () {
            debugger;
            myfile = $(this).val();

            if (myfile == '') {
                document.getElementById("imgMaterialPhoto").src = "";
                $("#imgMaterialPhoto").attr("style", "display:none");
            }

            console.log("My File: ", myfile);
            var ext = myfile.split('.').pop();
            console.log("Ext: ", ext);

            var str = myfile.substring(0, 10) + "." + ext;
            console.log("Str: ", str);
            showFileSize(ext);

        });

        function showFileSize(ext) {
            debugger;

            var input, file;
            var fileUpload = $('#fuMaterialPhoto').get(0);
            console.log('File Upload Get: ', fileUpload)

            input = document.getElementById('fuMaterialPhoto');
            file = fileUpload.files[0];

            var size = parseFloat($('#fuMaterialPhoto')[0].files[0].size / 1024).toFixed(2);

            if (size <= 500) {
                var src = URL.createObjectURL(file);
                var preview = document.getElementById("imgMaterialPhoto");
                var prelabel = document.querySelector(".ImagePreviewLabel");
                prelabel.classList.add("hidden");
                preview.src = src;
                preview.style.display = "block";
                $('#imgMaterialWarning').text("")



            } else {
                swal.fire("Size Limit !", "Photo Size must be smaller than 500 kb.", "warning");
                $("#fuMaterialPhoto").val('');

            }

        }

        function SaveImage() {

            var fileUpload = $("#fuMaterialPhoto").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            var filepath = "";

            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            if (files.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "../FileHandler.ashx?Type=MaterialPhoto",
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



        /* Form Validation Functions*/
        function FormValidation(materialcategoryid, materialname, measuredin, materialphoto, hdnphotopath) {
            var returnval = true;
            debugger;
            if (materialcategoryid.val() == 0) {
                $('#ddlMaterialCategoryWarning').text("*Please Select the Material Catgoey Name");
                returnval = false;
            }


            if (materialname.val() == "") {
                $('#txtMaterialNameWarning').text("*Please Enter the Material Name")
                returnval = false;
            }

            if (measuredin.val() == 0) {
                $('#txtMeasuredInWarning').text("*Please Select the MeasuredIn Property")
                returnval = false;
            }

            if (hdnphotopath.val() == '') {
                if (materialphoto.val() == '') {
                    $('#imgMaterialPhotoWarning').text("*Please Select the Material Photo")
                    swal.fire({
                        title: "Material Photo is Not Selected",
                        text: "Please Select the Material Photo",
                        icon: "warning",
                        background: '#27272a',

                    })

                    returnval = false;
                }

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

