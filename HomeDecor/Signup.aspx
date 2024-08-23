<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="HomeDecor.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Signup</h2>
                </div>
            </div>
        </section>

        <section class="signup-section">
            <div class="container">
                <asp:Panel ID="SignupPanel" runat="server" CssClass="bg-light p-4 rounded shadow-sm login-box">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <h3 class="text-primary">Create an Account</h3>
                        </div>

                        <!-- Username -->
                        <div class="col-12 mb-3">
                            <label for="txtUsername" class="form-label">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username" />
                            <asp:RequiredFieldValidator ID="UsernameRequiredValidator" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="text-danger" />
                        </div>

                        <!-- Email Address -->
                        <div class="col-12 mb-3">
                            <label for="txtEmail" class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                            <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." CssClass="text-danger" ValidationExpression="\w+([-+.’]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </div>

                        <!-- Password -->
                        <div class="col-12 mb-3">
                            <label for="txtPassword" class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password" />
                            <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-danger" />
                        </div>

                        <!-- Confirm Password -->
                        <div class="col-12 mb-3">
                            <label for="txtConfirmPassword" class="form-label">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Confirm Password" />
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequiredValidator" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required." CssClass="text-danger" />
                            <asp:CompareValidator ID="PasswordCompareValidator" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match." CssClass="text-danger" />
                        </div>

                        <!-- Signup Button -->
                        <div class="col-12 mb-3">
                            <asp:Button ID="btnSignup" runat="server" Text="Signup" OnClick="btnSignup_Click" CssClass="btn btn-main btn-block" />
                        </div>

                        <!-- Login Link -->
                        <div class="col-12 mt-3">
                            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="text-link">
                                Already have an account? Login here.
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
