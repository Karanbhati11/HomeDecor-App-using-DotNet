<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HomeDecor.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <main>
        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Login</h2>
                </div>
            </div>
        </section>

        <section class="login-section">
            <div class="container">
                <asp:Panel ID="LoginPanel" runat="server" CssClass="bg-light p-4 rounded shadow-sm login-box">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <h3 class="text-primary">Sign In</h3>
                        </div>

                        <!-- Email Address -->
                        <div class="col-12 mb-3">
                            <label for="txtEmail" class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                            <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" />
                        </div>

                        <!-- Password -->
                        <div class="col-12 mb-3">
                            <label for="txtPassword" class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password" />
                            <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-danger" />
                        </div>

                        <!-- Login Button -->
                        <div class="col-12 mb-3">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-main btn-block" />
                        </div>

                        <!-- Signup Link -->
                        <div class="col-12 mt-3">
                            <asp:HyperLink ID="hlSignup" runat="server" NavigateUrl="~/Signup.aspx" CssClass="text-link">
                                Don't have an account? Signup here.
                            </asp:HyperLink>
                        </div>

                        <!-- Message Label -->
                        <div class="col-12 mt-2">
                            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </section>
    </main>
</asp:Content>
