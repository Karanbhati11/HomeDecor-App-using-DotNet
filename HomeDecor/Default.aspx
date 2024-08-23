<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HomeDecor._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="home-page">
        <section class="hero-section p-0">
            <div class="classic-slider">
                <div class="home">
                    <asp:Image ID="logo" runat="server" CssClass="img-fluid" ImageUrl="~/Images/homedecor_herobanner.jpg" AlternateText="Hero Banner" />
                </div>
                <div class="hero-text text-center">
                    <h1>Cozy Picks For 
                       
                        <br>
                        Your Home</h1>
                    <div class="banner-button mt-4">
                        <a class="btn-main" runat="server" href="~/Products">Shop more</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="category-section">
            <div class="container">
                <div class="text-center title mb-4">
                    <h3 class="title-heading">Top Picks For You</h3>
                    <p>
                        Find a bright ideal to suit your taste with our great selection of suspension, floor and table lights.
                    </p>
                </div>
                <asp:DataList ID="CategoryDataList" runat="server" RepeatDirection="Horizontal"
                    CssClass="row"
                    DataKeyField="Id">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <div class="category-box">
                                <div class="category-img">
                                    <asp:Image ID="CategoryImage" runat="server" CssClass="img-fluid"
                                        ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Name") %>' />
                                </div>
                                <div class="category-content">
                                    <h5><%# Eval("Name") %></h5>
                                    <a href='<%# "Products.aspx?categoryId=" + Eval("Id") %>' tabindex="0">View All
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </section>

        <section class="offer-banner">
            <div class="container">
                <div class="banner-wrap">
                    <div class="offer-img">
                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid" ImageUrl="~/Images/heroimage.jpg" AlternateText="Hero Banner" />
                    </div>
                    <div class="offer-text">
                        <h3>Get 10% Off & Free Delivery</h3>
                        <p>Get it now and enjoy</p>
                        <div class="banner-button">
                            <a class="btn-main" runat="server" href="~/Products">Shop more</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
