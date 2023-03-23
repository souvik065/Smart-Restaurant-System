<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.master" AutoEventWireup="true" CodeFile="PaymentFailure.aspx.cs" Inherits="PaymentFailure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="card" style="text-align: center;">
                <div class="card-body row text-center justify-content-center">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <img src="images/failure.png" style="width: 100%;" />
                        <h2>Payment Failed.</h2>
                        <h2>Please Try Again.</h2>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(function () {
            localStorage.removeItem('rzp_device_id');
        })
    </script>
</asp:Content>

