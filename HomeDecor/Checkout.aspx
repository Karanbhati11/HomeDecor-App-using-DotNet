<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="HomeDecor.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Checkout</h2>
                </div>
            </div>
        </section>

        <section class="checkout-section">
            <div class="container">
                <asp:Panel ID="CheckoutPanel" runat="server" CssClass="bg-light p-4 rounded shadow-sm">
                    <div class="row">

                        <div class="col-12 mb-3">
                            <h3 class="text-primary">Contact information</h3>
                        </div>
                        <!-- Email Address -->
                        <div class="col-12 mb-3">
                            <label for="EmailTextBox" class="form-label">Email Address</label>
                            <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Email Address is required." CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Invalid email format." CssClass="text-danger" ValidationExpression="\w+([-+.’]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </div>

                        <!-- First Name -->
                        <div class="col-12 mb-3">
                            <label for="FirstNameTextBox" class="form-label">First Name</label>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" runat="server" ControlToValidate="FirstNameTextBox" ErrorMessage="First Name is required." CssClass="text-danger" />
                        </div>

                        <!-- Last Name -->
                        <div class="col-12 mb-3">
                            <label for="LastNameTextBox" class="form-label">Last Name</label>
                            <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="LastNameRequiredValidator" runat="server" ControlToValidate="LastNameTextBox" ErrorMessage="Last Name is required." CssClass="text-danger" />
                        </div>

                        <!-- Phone Number -->
                        <div class="col-12 mb-3">
                            <label for="PhoneTextBox" class="form-label">Phone Number</label>
                            <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="PhoneRequiredValidator" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Phone Number is required." CssClass="text-danger" />
                        </div>

                        <!-- Billing Address -->
                        <div class="col-12 mb-3">
                            <h3 class="text-primary">Billing Address</h3>
                        </div>

                        <!-- Address -->
                        <div class="col-12 mb-3">
                            <label for="AddressTextBox" class="form-label">Address</label>
                            <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="AddressRequiredValidator" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="Address is required." CssClass="text-danger" />
                        </div>

                        <!-- City -->
                        <div class="col-12 mb-3">
                            <label for="CityTextBox" class="form-label">City</label>
                            <asp:TextBox ID="CityTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="CityRequiredValidator" runat="server" ControlToValidate="CityTextBox" ErrorMessage="City is required." CssClass="text-danger" />
                        </div>

                        <!-- State -->
                        <div class="col-12 mb-3">
                            <label for="StateDropDownList" class="form-label">State</label>
                            <asp:DropDownList ID="StateDropDownList" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select State" Value="" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="StateRequiredValidator" runat="server" ControlToValidate="StateDropDownList" InitialValue="" ErrorMessage="State is required." CssClass="text-danger" />
                        </div>

                        <!-- Zip Code -->
                        <div class="col-12 mb-3">
                            <label for="ZipCodeTextBox" class="form-label">Zip Code</label>
                            <asp:TextBox ID="ZipCodeTextBox" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="ZipCodeRequiredValidator" runat="server" ControlToValidate="ZipCodeTextBox" ErrorMessage="Zip Code is required." CssClass="text-danger" />
                        </div>

                        <!-- Total Amount -->
                        <div class="col-12 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Order Total</h5>
                                    <asp:Label ID="TotalAmountLabel" runat="server" CssClass="h4" Text="$0.00"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="col-12 mt-4 d-flex">
                            <asp:Button ID="PlaceOrderButton" runat="server" Text="Place Order" OnClick="PlaceOrderButton_Click" CssClass="btn btn-main" />
                            <asp:Button ID="CancelOrderButton" runat="server" Text="Cancel Order" OnClick="CancelOrderButton_Click" CssClass="btn btn-secondary" CausesValidation="false" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </section>
    </main>

</asp:Content>
