<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HomeDecor.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Your Cart</h2>
                </div>
            </div>
        </section>

        <section class="cart-section">
            <div class="container">
                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Product">
                            <ItemTemplate>
                                <img src='<%# Eval("ImageUrl") %>' class="img-fluid" alt="Product Image" style="max-width: 100px; max-height: 100px; object-fit: cover;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="${0:0.00}" />
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <div class="cart-qty d-flex align-items-center">
                                    <asp:Button ID="DecreaseQuantityButton" runat="server" Text="-" CommandArgument='<%# Eval("ProductId") %>' CommandName="DecreaseQuantity" OnCommand="CartCommand" CssClass="btn btn-secondary btn-sm" />
                                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control mx-2" Width="50px" />
                                    <asp:Button ID="IncreaseQuantityButton" runat="server" Text="+" CommandArgument='<%# Eval("ProductId") %>' CommandName="IncreaseQuantity" OnCommand="CartCommand" CssClass="btn btn-secondary btn-sm" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="${0:0.00}" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="RemoveButton" runat="server" Text="Remove" CommandArgument='<%# Eval("ProductId") %>' CommandName="RemoveItem" OnCommand="CartCommand" CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                </asp:GridView>

                <!-- Empty Cart Message and Continue Shopping Button -->
                <div id="EmptyCartDiv" runat="server" class="text-center">
                    <asp:Label ID="lblEmptyCartMessage" runat="server" CssClass="empty-cart-msg" Visible="false"></asp:Label>
                    <asp:Button ID="ContinueShoppingButton" runat="server" Text="Continue Shopping" OnClick="ContinueShoppingButton_Click" CssClass="btn btn-secondary" Visible="false" />
                </div>

                <!-- Cart Summary Section -->
                <div id="CartSummaryDiv" runat="server" class="cart-summary mt-4">
                    <h3>Total: <asp:Label ID="CartTotalLabel" runat="server" Text="0.00"></asp:Label></h3>
                    <asp:Button ID="CheckoutButton" runat="server" Text="Checkout" OnClick="CheckoutButton_Click" CssClass="btn btn-main" />
                </div>

            </div>
        </section>
    </main>

</asp:Content>
