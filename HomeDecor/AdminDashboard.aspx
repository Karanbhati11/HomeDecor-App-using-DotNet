<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HomeDecor.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-dashboard">
        <div class="admin-title"><h1 >Dashboard</h1></div>
        <div class="dashboard-content">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="dashboard-card m-4">
                            <h2 class="card-header">
                                Total Products
                   
                            </h2>
                            <div class="dashboard-number">
                                <asp:Label ID="lblTotalProducts" runat="server" CssClass="mb-2" />

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="dashboard-card m-4">
                            <h2 class="card-header">
                                Total Categories
                   
                            </h2>
                            <div class="dashboard-number">
                                <asp:Label ID="lblTotalCategories" runat="server" CssClass="mb-2" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
