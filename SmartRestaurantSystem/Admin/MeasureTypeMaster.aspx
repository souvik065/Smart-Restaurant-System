<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MeasureTypeMaster.aspx.cs" Inherits="Admin_MeasureTypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="h-full">
        <!-- Page Heading -->
        <div class="w-full my-5 text-classic-yellow font-playfair-display-700 bg-classic-brown py-5 px-5 shadow-2xl space-y-3">
            <div class="">
                <div>
                    <h1 class="text-5xl">Measure Type Master</h1>
                </div>
            </div>
            <div class="font-poppins-400 capitalize text-gray-400 font-bold capitalize">
                <div><span class="capitalize">Master > Measure Type Master</span></div>
            </div>
        </div>
        <!-- Page Heading End -->

        <!-- Hidden Fields Start-->
        <input id="hdnMeasureTypeID" type="hidden" />

        <!-- Hidden Fields End-->

        <!-- Form Content -->
        <div class="w-full my-5 shadow-2xl text-classic-yellow font-playfair-display-500 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <div class="font-poppins-400 text-xl w-full space-y-10 font-bold">

                    <!-- Fields -->                    
                    <div class="grid gap-10 md:grid-cols-3 ">
                        <div class=" w-full ">
                            <lable for="ddlCategory" class="my-auto w-1/3">Category Name</lable><span id="ddlCategoryWarning" class="formerror text-red-600 text-sm"></span>

                            <select id="ddlCategory" onchange="CategoryOnChange(this.id, this.value)" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                <option>--Selesct Category--</option>

                            </select>
                        </div>

                         <div class=" w-full ">
                            <lable for="ddlSubCategory" class="my-auto w-1/3">Category Name</lable><span id="ddlSubCategoryWarning" class="formerror text-red-600 text-sm"></span>

                            <select id="ddlSubCategory" onchange="FormValDropDown(this.id)" class="text-gray-400 font-semibold bg-transparent text-gray-400 px-2 py-2 border w-full border-classic-dimyellow  text-center">
                                <option>--Selesct Category--</option>

                            </select>
                        </div>

                        <div class=" w-full">

                            <lable for="txtMeasureType" class="my-auto">Measure Type </lable><span id="txtMeasureTypeNameWarning" class="formerror text-red-600  text-sm"></span>

                            <input id="txtMeasureType" onkeyup="FormValTextBox(this.id)" class="bg-transparent text-gray-400 font-semibold border w-full border-classic-dimyellow  py-1 px-2" type="text" />
                        </div>
                    </div>
                    <!-- Fields End -->

                    <!-- Action buttons -->
                    <div class="flex space-x-10">
                        <div class="">
                            <input id="btnSave" class="bg-yellow-900 text-white py-3 px-10 hover:bg-yellow-700 cursor-pointer" type="button" value="Save" />
                        </div>
                        <div>
                            <input id="btnClear" class="border border-yellow-900 bg-transparent text-yellow-900 py-3 px-10 hover:bg-amber-600 hover:text-white cursor-pointer" type="button" value="Clear" />
                        </div>
                    </div>
                    <!--Action Buttons End-->





                </div>


            </div>

        </div>
        <div class="w-full my-5  shadow-2xl  text-classic-yellow font-poppins-400 bg-classic-brown py-5 px-5">
            <div class="w-full">
                <table class="table-fixed" id="tblMeasureType">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th>Measure Type</th>
                            <th class="justify-around">Actions</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Sr.No</th>
                            <th>Category Name</th>
                            <th>SubCategory Name</th>
                            <th>Measure Type</th>
                            <th class="justify-around">Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!--Form Content End-->
    </section>
    <section class="h-[500px]"></section>



    <script>


        $(function () {
            table = $("#tblMeasureType").DataTable({
                responsive: true,
                autoWidth: false,
                "deferRender": true
            })
            FillMeasureTypeDetails(0);
            ListAllCategory();
        })

        function CategoryOnChange(id, value) {
            FormValDropDown(id)
            ListAllSubCategory(value)
        }




        function ClearFields() {
            $('#ddlCategory').val(0);
            $('#ddlSubCategory').val("");
            $('#txtMeasureType').val("");
            $('#hdnMeasureTypeID').val("");


            $("[id=btnSave]").val("Save");
            $("[id=btnClear]").val("Clear");

        }





        $("#btnSave").on('click', function () {

            var measuretypeid = $('#hdnMeasureTypeID');
            var categoryid = $('#ddlCategory');
            var subcategoryid = $('#ddlSubCategory');
            var measuretype = $('#txtMeasureType');
           

            var Validate = FormValidation(categoryid, subcategoryid, measuretype);
            if (Validate == true) {

                var MeasureTypeID = measuretypeid.val() == "" ? 0 : measuretypeid.val();
                
                var SubCategoryID = subcategoryid.val();
                var MeasureType = measuretype.val().trim();
                

                $.ajax({

                    url: "../WebServices/MeasureTypeMasterWebService.asmx/MeasureTypeMasterManage",
                    method: "POST",
                    data: "{MeasureTypeID:" + JSON.stringify(MeasureTypeID) + ",SubCategoryID:" + JSON.stringify(SubCategoryID) + ", MeasureType:" + JSON.stringify(MeasureType)+"}",
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
                FillMeasureTypeDetails(0);
                ClearFields();
            }


        });


        $("#btnClear").on('click', function () {
            var subcategoryid = $("#hdnSubCategoryID");

            if (subcategoryid.val() > 0) {

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

        function FillMeasureTypeDetails(MeasureTypeID) {
            $.ajax({

                url: "../WebServices/MeasureTypeMasterWebService.asmx/MeasureTypeMasterGet",
                method: "POST",
                data: "{MeasureTypeID:" + JSON.stringify(MeasureTypeID) + "}",
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
                    strEditDelete += " <input class=\"bg-yellow-900 mx-2 text-center text-white py-3 px-5 hover:bg-yellow-700 cursor-pointer\" onclick=\"EditMeasureType(" + $(this).find("MeasureTypeID").text() + ")\" type='button' value=\"Edit\" />";
                    strEditDelete += " <input class=\"bg-red-900 text-center text-white py-3 px-5 hover:bg-red-600 cursor-pointer\" onclick='DeleteMeasureType(" + $(this).find("MeasureTypeID").text() + ")' type='button' value=\"Delete\" />";


                    table.row.add([
                        $(this).find("RowNumber").text(),
                        $(this).find("CategoryName").text(),
                        $(this).find("SubCategoryName").text(),
                        $(this).find("MeasureType").text(),
                        strEditDelete

                    ]).draw(false);
                })
            }
            else {
                table.clear().draw();
            }

        }



        function EditMeasureType(MeasureTypeID) {
            $.ajax({

                url: "../WebServices/MeasureTypeMasterWebService.asmx/MeasureTypeMasterGet",
                method: "POST",
                data: "{MeasureTypeID:" + JSON.stringify(MeasureTypeID) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnEditSuccess,
                async: false,
                error: function (err) {
                    console.log(err);
                }

            });
            FillMeasureTypeDetails(0);

        }


        function OnEditSuccess(response) {
            var XmlDoc = $.parseXML(response.d);
            var xml = $(XmlDoc);
            var Details = xml.find("DataDetails");

            $("[id=hdnMeasureTypeID]").val(Details.find("MeasureTypeID").text());
            
            $("[id=txtMeasureType]").val(Details.find("MeasureType").text());
            $("#ddlCategory").val(Details.find("CategoryID").text());
            ListAllSubCategory(Details.find("CategoryID").text());
            $("#ddlSubCategory").val(Details.find("SubCategoryID").text());

           
            

            $("[id=btnSave]").val("Update");
            $("[id=btnClear]").val("Cancle");
        }


        function DeleteMeasureType(MeasureTypeID) {

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

                        url: "../WebServices/MeasureTypeMasterWebService.asmx/MeasureTypeMasterDelete",
                        method: "POST",
                        data: "{MeasureTypeID:" + JSON.stringify(MeasureTypeID) + "}",
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
                    FillMeasureTypeDetails(0);
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

        /* DropDown Filling Functions End*/


      


        /* Form Validation Functions*/

        function FormValidation(categoryid, subcategoryid, measuretype) {
            var returnval = true;

            if (categoryid.val() == 0) {
                $('#ddlCategoryWarning').text("*Please Select the Catgoey Name")
                returnval = false;
            }

            if (subcategoryid.val() == 0) {
                $('#ddlSubCategoryWarning').text("*Please Select the Catgoey Name")
                returnval = false;
            }

            if (measuretype.val() == "") {
                $('#txtMeasureTypeWarning').text("*Please Select the Measure Type")
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

