<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="StaffDetails.aspx.cs" Inherits="Admin_StaffDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <!-- Header -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Staff Details</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Staff > Staff Details </span></div>
            </div>
        </div>
        <!-- Header End-->


        <!-- Hidden Fields Start-->
        <input id="hdnStaffID" type="hidden" />
        <input id="hdnPhotoPath" type="hidden" />
        <input id="hdnOldPhotoPath" type="hidden" />

        <!-- Hidden Fields End-->



        <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <div class="font-poppins-400 text-xl w-full space-y-12 px-5 py-5 font-bold" >

                    <!-- Fields -->

                    <!--Image Preview-->
                    <div class="md:flex md:justify-center xl:items-end xl:justify-start ">
                        <div class="text-center min-w-[15rem]  h-[17rem] rounded-lg overflow-hidden ">
                            <div><span id="imgDishPhotoWarning" class="formerror text-red-600  text-sm"></span></div>

                            <label for="fuStaffPhoto" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:bg-bray-800 bg-gray-700 hover:bg-gray-100 border-gray-600 hover:border-gray-500 hover:bg-gray-600">
                                <img id="imgStaffPhoto" alt="" onchange="FormValTextBox(this.id)" src="#" style="display: none;" class="h-full w-full" />
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




                    <!--Other Fields -->
                    <div class="grid gap-11 lg:grid-cols-3 md:grid-cols-2  ">
                        <!-- Staff Type -->
                        <div class="w-full ">
                            <lable for="ddlStaffType" class="my-auto">Staff Type</lable><span id="ddlStaffTypeWarning" class="formerror text-red-600 text-sm"></span>
                            <div class="w-full">


                                <select id="ddlStaffType" onchange="FormValDropDown(this.id)" class="mx-auto  bg-transparent py-3 px-2 border w-full border-classic-dimyellow w-1/2 text-center">
                                    <option>--Selesct Staff Type--</option>

                                </select>
                            </div>
                        </div>
                        <!-- Staff Type End-->

                        <!-- Staff Name-->
                        <div class=" w-full ">
                            <lable for="txtStaffName" class="my-auto w-1/5">Staff Name </lable>
                            <span id="txtStaffNameWarning" class="formerror text-red-600  text-sm"></span>
                            <div class="w-full">
                                <input id="txtStaffName" onkeyup="FormValTextBox(this.id)" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                            </div>
                        </div>
                        <!-- Staff Name End-->


                        <!-- Mobile No-->
                        <div class="  w-full ">
                            <lable for="txtMobileNo" class="my-auto w-1/5">Mobile No </lable>
                            <span id="txtMobileNoWarning" class="formerror text-red-600  text-sm"></span>
                            <div class="w-full">

                                <input id="txtMobileNo" onkeyup="FormValTextBox(this.id)" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" type="text" />
                            </div>
                        </div>
                        <!-- Mobile No End-->

                        <!-- Address  -->
                        <div class=" w-full ">
                            <lable for="txtAddress" class="my-auto w-1/5">Address </lable>
                            <span id="txtAddressWarning" class="formerror text-red-600  text-sm"></span>
                            <div class="w-full">

                                <textarea id="txtAddress" class="bg-transparent border w-full border-classic-dimyellow w-1/2 py-1 px-1" onkeyup="FormValTextBox(this.id)" cols="20" rows="2"></textarea>
                            </div>
                        </div>
                        <!-- Address End-->

                    </div>
                    <!--Other Fields End-->


                    <div>
                        <input id="fuStaffPhoto" class="hidden py-3 px-3 rounded-full
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


                    <!-- Fields End-->

                    <!-- Buttons -->
                    <div class="flex space-x-10">
                        <div class="">
                            <input id="btnSave" class="bg-yellow-900 text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer active:bg-black" type="button" value="Save" />
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
                <table class="table-fixed" id="tblStaff">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Staff Name</th>
                            <th>Staff Type</th>
                            <th>Mobile No</th>
                            <th>Address</th>
                            <th>Staff Photo</th>


                            <th class="justify-around">Actions</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Staff Name</th>
                            <th>Staff Type</th>
                            <th>Mobile No</th>
                            <th>Address</th>
                            <th>Staff Photo</th>


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

        $(function () {
            table = $("#tblStaff").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillStaffDetails(0);
            ListAllStaffType();
        })




        function ClearFields() {

            var prelabel = document.querySelector(".ImagePreviewLabel");
            prelabel.classList.remove("hidden");
            $('#ddlStaffType').val(0);
            $('#txtStaffName').val("");
            $('#txtMobileNo').val("");
            $('#txtAddress').val("");

            $('#hdnStaffID').val("");
            $('#imgStaffPhoto').removeAttr('src');
            $('#imgStaffPhoto').css('display', 'none');

            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }


        $("#btnSave").on('click', function () {

            var stafftypeid = $('#ddlStaffType');
            var staffid = $('#hdnStaffID');
            var staffname = $('#txtStaffName');
            var mobileno = $('#txtMobileNo');
            var address = $('#txtAddress');

            var staffphoto = $('#fuStaffPhoto');
            var hdnphototpath = $("#hdnPhotoPath");
            var hdnoldphotopath = $("#hdnOldPhotoPath");


            var Validate = FormValidation(stafftypeid, staffname, mobileno, address, staffphoto, hdnphototpath);
            if (Validate == true) {

                var StaffID = staffid.val() == "" ? 0 : staffid.val();
                var StaffTypeID = stafftypeid.val();
                var StaffName = staffname.val().trim();
                var MobileNo = mobileno.val().trim();
                var Address = address.val().trim();
                var HdnOldPhotoPath = hdnoldphotopath.val() == "" ? "Null" : hdnoldphotopath.val();
                var StaffPhoto = ""
                if (hdnphototpath.val() != "") {
                    StaffPhoto = hdnphototpath.val();

                } else {
                    if (staffphoto.val() != "") {
                        StaffPhoto = SaveImage();

                    }
                }

                $.ajax({

                    url: "../WebServices/StaffDetailMasterWebService.asmx/StaffDetailMasterManage",
                    method: "POST",
                    data: "{StaffID:" + JSON.stringify(StaffID) + ", StaffTypeID:" + JSON.stringify(StaffTypeID) + ",StaffName:" + JSON.stringify(StaffName) + " ,MobileNo:" + JSON.stringify(MobileNo) + ",Address:" + JSON.stringify(Address) + ",StaffPhoto:" + JSON.stringify(StaffPhoto) + ", OldPhotoPath:" + JSON.stringify(HdnOldPhotoPath) + "}",
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

                            FillStaffDetails(0);

                        }
                    },
                    error: function (err) {
                        console.log(err)
                    }

                });
                FillStaffDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var categoryid = $("#hdnStaffID");

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

        function FillStaffDetails(StaffID) {
            $.ajax({

                url: "../WebServices/StaffDetailMasterWebService.asmx/StaffDetailMasterGet",
                method: "POST",
                data: "{StaffID:" + JSON.stringify(StaffID) + "}",
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

                    strImage = "<img class='rounded-full'  src='../Assets/Images/" + $(this).find("StaffPhoto").text() + "' style=' height:100px; width:100px; ' >"
                    strEditDelete += " <input class='bg-yellow-900 mx-2 2xl:py-3 2xl:px-5 text-center text-white py-1 px-5 hover:bg-yellow-700 cursor-pointer' onclick='EditStaff(" + $(this).find("StaffID").text() + ")' type='button' value='Edit' />";
                    strEditDelete += " <input class='bg-red-900 mx-2 2xl:py-3 2xl:px-5 text-center text-white py-1 px-3 hover:bg-red-600 cursor-pointer' onclick='DeleteStaff(" + $(this).find("StaffID").text() + ",\"" + $(this).find("StaffPhoto").text() + "\")' type='button' value='Delete' />";

                    // strEditDelete += " <input class='bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer' onclick='DeleteSubCategory(" + $(this).find("DishID").text(), $(this).find("DishPhoto").text() + ")' type='button' value='Delete' />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("StaffName").text(),
                        $(this).find("StaffType").text(),
                        $(this).find("MobileNo").text(),
                        $(this).find("Address").text(),
                        strImage,
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditStaff(StaffID) {
            $.ajax({

                url: "../WebServices/StaffDetailMasterWebService.asmx/StaffDetailMasterGet",
                method: "POST",
                data: "{StaffID:" + JSON.stringify(StaffID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnStaffID]").val(Details.find("StaffID").text());
            $("[id=ddlStaffType]").val(Details.find("StaffTypeID").text());
            $("[id=txtStaffName]").val(Details.find("StaffName").text());
            $("[id=txtMobileNo]").val(Details.find("MobileNo").text());
            $("[id=txtAddress]").val(Details.find("Address").text());


            $("#hdnPhotoPath").val(Details.find("StaffPhoto").text());
            $("#imgStaffPhoto").attr("style", "display:block");
            $("#imgStaffPhoto").prop("src", "../Assets/Images/" + Details.find("StaffPhoto").text());
            var prelabel = document.querySelector(".ImagePreviewLabel");
            prelabel.classList.add("hidden");
            $("[id*=txtStaffName]").focus();

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteStaff(StaffID, StaffPhoto) {

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

                        url: "../WebServices/StaffDetailMasterWebService.asmx/StaffDetailMasterDelete",
                        method: "POST",
                        data: "{StaffID:" + JSON.stringify(StaffID) + ", StaffPhoto:" + JSON.stringify(StaffPhoto) + "}",
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
                    FillStaffDetails(0);
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
        $("#fuStaffPhoto").on("change", function () {
            debugger;
            myfile = $(this).val();

            if (myfile == '') {
                document.getElementById("imgStaffPhoto").src = "";
                $("#imgStaffPhoto").attr("style", "display:none");
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
            var fileUpload = $('#fuStaffPhoto').get(0);
            console.log('File Upload Get: ', fileUpload)

            var staffid = $('#hdnStaffID');
            var hdnphotopath = $("#hdnPhotoPath");
            var hdnoldphotopath = $("#hdnOldPhotoPath");

            input = document.getElementById('fuStaffPhoto');
            file = fileUpload.files[0];

            var size = parseFloat($('#fuStaffPhoto')[0].files[0].size / 1024).toFixed(2);

            if (size <= 500) {
                var src = URL.createObjectURL(file);
                var preview = document.getElementById("imgStaffPhoto");
                var prelabel = document.querySelector(".ImagePreviewLabel");
                prelabel.classList.add("hidden");
                preview.src = src;
                preview.style.display = "block";
                $('#imgStaffPhotoWarning').text("")

                if (staffid.val() > 0) {
                    hdnoldphotopath.val(hdnphotopath.val());
                    hdnphotopath.val(SaveImage());
                }


            } else {
                swal.fire("Size Limit !", "Photo Size must be smaller than 500 kb.", "warning");
                $("#fuStaffPhoto").val('');

            }

        }

        function SaveImage() {

            var fileUpload = $("#fuStaffPhoto").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            var filepath = "";

            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            if (files.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "../FileHandler.ashx?Type=StaffPhoto",
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



        function ListAllStaffType() {

            $.ajax({

                url: "../WebServices/StaffTypeMasterWebService.asmx/ListAllStaffType",
                method: "POST",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (res) {
                    var ddlcatgeory = $("#ddlStaffType");
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
        function FormValidation(stafftypeid, staffname, mobileno, address, staffphoto, hdnphototpath) {
            var returnval = true;
            if (stafftypeid.val() == 0) {
                $('#ddlStaffTypeWarning').text("*Please Select the Staff Type");
                returnval = false;
            }

            if (address.val() == "") {
                $('#txtAddressWarning').text("*Please Select the Address")
                returnval = false;
            }

            if (staffname.val() == "") {
                $('#txtStaffNameWarning').text("*Please Enter the StaffName")
                returnval = false;
            }

            if (mobileno.val() == "") {
                $('#txtMobileNoWarning').text("*Please Enter the Mobile No")
                returnval = false;
            }

            if (hdnphototpath.val() == '') {
                if (staffphoto.val() == '') {
                    $('#imgStaffPhotoWarning').text("*Please Select the Staff Photo")
                    swal.fire({
                        title: "Staff Photo is Not Selected",
                        text: "Please Select the Dish Photo",
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

