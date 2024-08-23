<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Thankyou.aspx.cs" Inherits="HomeDecor.Thankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Thank you</h2>
                </div>
            </div>
        </section>

        <section class="thank-you-section">
            <div class="container">
                <div class="bg-light col-6 m-auto p-4 rounded shadow-sm">
                    <h3 class="text-success">Your Order Has Been Placed Successfully</h3>
                    <p>Thank you for your order! We have received your order and it is being processed. </p>
                    <asp:Button ID="BackToHomeButton" runat="server" Text="Back to Home" CssClass="btn btn-main" OnClick="BackToHomeButton_Click" />
                </div>
            </div>
        </section>
    </main>
</asp:Content>
