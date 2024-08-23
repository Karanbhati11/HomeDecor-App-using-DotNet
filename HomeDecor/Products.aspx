<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HomeDecor.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <main>

        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Our Best Selling</h2>
                </div>
            </div>
        </section>

        <section class="product-section">
            <div class="container">
                <asp:DataList ID="ProductDataList" runat="server" RepeatDirection="Horizontal" CssClass="row">
                    <ItemTemplate>
                        <div class="col-md-12 mb-4 ">
                            <div class="product-box">
                                <div class="product-img">
                                    <asp:Image ID="ProductImage" runat="server" CssClass="img-fluid"
                                        ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Name") %>' />
                                </div>
                                <div class="product-content">
                                    <h5><%# Eval("Name") %></h5>
                                    <p>Price: <%# string.Format("${0}", Eval("Price")) %></p>
                                    <div class="quantity-add">
                                        <input type="number" id="quantity_<%# Eval("Id") %>" name="quantity_<%# Eval("Id") %>" value="1" min="1" class="form-control" />
                                        <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("Id") %>' CommandName="AddToCart" OnCommand="AddToCart_Command" CssClass="btn-secondary" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </section>
    </main>

</asp:Content>
