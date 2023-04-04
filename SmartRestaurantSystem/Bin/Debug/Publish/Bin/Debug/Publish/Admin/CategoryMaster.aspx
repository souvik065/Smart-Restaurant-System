<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="Admin_CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="h-full">
        <!--Page Heading -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class=" text-5xl">Category Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Category Master</span></div>
            </div>
        </div>
        <!--Page Heading End-->

        <div>
            <div class="flex py-3 hidden text-classic-yellow font-poppins-400 font-bold px-3 shadow-2xl bg-classic-brown w-full">
                <div class="border border-b-2 py-3 px-5"><span>Add</span></div>
                <div class="border py-3 px-5"><span>View</span></div>
            </div>

            <!-- Hidden Fields Start-->
            <input id="hdnCategoryID" type="hidden" />
            <input id="fuCategoryPhoto" class="hidden py-3 px-3 rounded-full" type="file" />
            <input id="hdnPhotoPath" type="hidden" />
            <input id="hdnOldPhotoPath" type="hidden" />

            <!-- Hidden Fields End-->
            <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 ">
                <div class="w-full">
                    <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">


                        <!-- Fields -->
                        <!--Image Preview-->
                        <div class="md:flex md:justify-start  mx-5 justify-center">
                            <div class="text-center min-w-[15rem] max-w-[20rem] h-full rounded-lg overflow-hidden ">
                                <div><span id="imgCategoryPhotoWarning" class="formerror text-red-600  text-sm"></span></div>

                                <label for="fuCategoryPhoto" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer  hover:bg-bray-800 bg-gray-700 hover:bg-gray-100 border-gray-600 hover:border-gray-500 hover:bg-gray-600">
                                    <img id="imgCategoryPhoto" alt="" onchange="FormValTextBox(this.id)" src="#" style="display: none;" class="h-full w-full" />
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

                        <div class="mx-5 w-full">
                            <div>
                                <lable for="" class="my-auto">Category Name</lable><span id="categorynameval" class="formerror text-red-600  text-sm"></span>
                            </div>
                            <input id="txtCategoryName" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border md:w-1/2 border-classic-dimyellow mr-5 w-4/5 py-1 px-2" type="text" />


                        </div>
                        <!-- Fields End-->

                        <!-- Buttons -->
                        <div class="flex space-x-10 font-semibold">
                            <div class="">
                                <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Save" />
                            </div>
                            <div>
                                <input id="btnClear" class="border border-yellow-900  text-yellow-900 bg-transparent py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                            </div>
                        </div>
                        <!-- Buttons End-->



                    </div>
                </div>

            </div>

            <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
                <div class="w-full">
                    <table class="table-fixed" id="tblCategory">
                        <thead>
                            <tr>
                                <th>Sr.No</th>
                                <th>Category Name</th>
                                <th>Category Photo</th>
                                <th class="justify-around">Actions</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Sr.No</th>
                                <th>Category Name</th>
                                <th>Category Photo</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>






        </div>

    </section>

    <section class="h-[500px]"></section>




    <script>

        $(function () {
            table = $("#tblCategory").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillCategoryDetails(0);
        })

        function FormValidation(categoryname, categoryphoto, hdnphotopath) {
            var returnval = true;
            if (categoryname.val() == "") {
                $("#categorynameval").text("* Category Name Should not be Empty ");
                returnval = false;
            }

            if (hdnphotopath.val() == '') {
                if (categoryphoto.val() == '') {
                    $('#imgCategoryPhotoWarning').text("*Please Select the Category Photo")
                    swal.fire({
                        title: "Category Photo is Not Selected",
                        text: "Please Select the Dish Photo",
                        icon: "warning",
                        background: '#27272a',

                    })

                    returnval = false;
                }

            }

            return returnval;
        }

        function ClearFields() {
            var prelabel = document.querySelector(".ImagePreviewLabel");
            prelabel.classList.remove("hidden");
            $('#txtCategoryName').val("");
            $('#hdnCategoryID').val("");

            $('#imgCategoryPhoto').removeAttr('src');
            $('#imgCategoryPhoto').css('display', 'none');

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }


        $("#btnSave").on('click', function () {
            var categoryname = $('#txtCategoryName');
            var categoryid = $('#hdnCategoryID');
            var categoryphoto = $('#fuCategoryPhoto');
            var hdnphotopath = $("#hdnPhotoPath");
            var hdnoldphotopath = $("#hdnOldPhotoPath");
 
            var Validate = FormValidation(categoryname, categoryphoto, hdnphotopath);
            if (Validate == true) {
                var CategoryID = categoryid.val() == "" ? 0 : categoryid.val();
                var HdnOldPhotoPath = hdnoldphotopath.val() == "" ? "Null" : hdnoldphotopath.val();

                var CategoryName = categoryname.val().trim();
                var CategoryPhoto = ""
                if (hdnphotopath.val() != "") {
                    CategoryPhoto = hdnphotopath.val();

                } else {
                    if (categoryphoto.val() != "") {
                        CategoryPhoto = SaveImage();
                    }
                }

                $.ajax({

                    url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterManage",
                    method: "POST",
                    data: "{CategoryID:" + JSON.stringify(CategoryID) + ", CategoryName:" + JSON.stringify(CategoryName) + ", CategoryPhoto:" + JSON.stringify(CategoryPhoto) + ", OldPhotoPath:"+JSON.stringify(HdnOldPhotoPath)+"}",
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
                FillCategoryDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var categoryid = $("#hdnCategoryID");

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

        function FillCategoryDetails(CategoryID) {
            $.ajax({

                url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterGet",
                method: "POST",
                data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
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
                    strImage = "<img class='rounded-full'  src='../Assets/Images/" + $(this).find("CategoryPhoto").text() + "' style=' height:100px; width:100px; ' >"
                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditCategory(" + $(this).find("CategoryID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick=\"DeleteCategory(" + $(this).find("CategoryID").text() + ")\" type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("CategoryName").text(),
                        strImage,
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditCategory(CategoryID) {
            $.ajax({

                url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterGet",
                method: "POST",
                data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillCategoryDetails(0);

        }


        function OnEditSuccess(response) {
            debugger;
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");
            var hdnoldphotopath = $("#hdnOldPhotoPath");
            var categoryid = $('#hdnCategoryID');
            var hdnphotopath = $("#hdnPhotoPath");

            $("[id=hdnCategoryID]").val(Details.find("CategoryID").text());
            $("[id=txtCategoryName]").val(Details.find("CategoryName").text());
            $("#hdnPhotoPath").val(Details.find("DishPhoto").text());
            $("#imgDishPhoto").attr("style", "display:block");
            $("#imgDishPhoto").prop("src", "../Assets/Images/" + Details.find("DishPhoto").text());
            var prelabel = document.querySelector(".ImagePreviewLabel");
            prelabel.classList.add("hidden");

            if (categoryid.val() > 0) {
                hdnoldphotopath.val(hdnphotopath.val());
                hdnphotopath.val(SaveImage());
            }

            $("[id=txtCategoryName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteCategory(CategoryID) {

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

                        url: "../WebServices/CategoryMasterWebService.asmx/CategoryMasterDelete",
                        method: "POST",
                        data: "{CategoryID:" + JSON.stringify(CategoryID) + "}",
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
                    FillCategoryDetails(0);
                    ClearFields();

                    swal.fire({
                        title: "Deleted",
                        icon: "success",
                        text: msg,
                        background: '#27272a',

                    })

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
        $("#fuCategoryPhoto").on("change", function () {
            myfile = $(this).val();

            if (myfile == '') {
                document.getElementById("imgCategoryPhoto").src = "";
                $("#imgCategoryPhoto").attr("style", "display:none");
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
            var fileUpload = $('#fuCategoryPhoto').get(0);
            console.log('File Upload Get: ', fileUpload)

            input = document.getElementById('fuCategoryPhoto');
            file = fileUpload.files[0];

            var size = parseFloat($('#fuCategoryPhoto')[0].files[0].size / 1024).toFixed(2);

            if (size <= 500) {
                var src = URL.createObjectURL(file);
                var preview = document.getElementById("imgCategoryPhoto");
                var prelabel = document.querySelector(".ImagePreviewLabel");
                prelabel.classList.add("hidden");
                preview.src = src;
                preview.style.display = "block";
                $('#imgCategoryPhotoWarning').text("")



            } else {
                swal.fire("Size Limit !", "Photo Size must be smaller than 500 kb.", "warning");
                $("#fuCategoryPhoto").val('');

            }

        }

        function SaveImage() {

            var fileUpload = $("#fuCategoryPhoto").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            var filepath = "";

            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            if (files.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "../FileHandler.ashx?Type=CategoryPhoto",
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



    </script>

</asp:Content>

