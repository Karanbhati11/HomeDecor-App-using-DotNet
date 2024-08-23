<%@ Page Title="Manage Products" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="HomeDecor.AdminProducts" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-dashboard-pages">
        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Manage Products</h2>
                </div>
            </div>
        </section>

        <section class="product-section">
            <div class="container">

                <div class="add-product mb-3">
                    <asp:Button ID="AddProductButton" runat="server" Text="Add New Product" CssClass="btn btn-main" OnClick="AddProductButton_Click" />
                </div>

                <!-- Error message label -->
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="mb-2" />

                <asp:GridView ID="ProductsGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    AllowPaging="True" PageSize="10" OnPageIndexChanging="ProductsGridView_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Product Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity" />
                        <asp:BoundField DataField="ImageUrl" HeaderText="Image URL" />
                        <asp:BoundField DataField="CategoryId" HeaderText="Category ID" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="EditProductButton" runat="server" Text="Edit" CssClass="btn-main btn-sm" CommandArgument='<%# Eval("Id") %>' OnClick="EditButton_Click" />
                                <asp:Button ID="DeleteProductButton" runat="server" Text="Delete" CssClass="btn-secondary btn-sm" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteButton_Click" CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>



                <!-- Add Product Modal -->
                <asp:Panel ID="AddProductPanel" runat="server" CssClass="modal-content" Style="display: none;">
                    <h2>Add New Product</h2>
                    <asp:Label ID="lblAddProductError" runat="server" ForeColor="Red" CssClass="mb-2" />
                    <asp:TextBox ID="txtProductName" runat="server" Placeholder="Product Name" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtStockQuantity" runat="server" Placeholder="Stock Quantity" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtImageUrl" runat="server" Placeholder="Image URL" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtCategoryId" runat="server" Placeholder="Category ID" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" />
                    <div class="modal-actions mt-3">
                        <asp:Button ID="btnSaveProduct" runat="server" Text="Save" CssClass="btn btn-main" OnClick="SaveProduct_Click" />
                        <asp:Button ID="btnCloseAddProductModal" runat="server" Text="Close" CssClass="btn btn-secondary" />
                    </div>
                </asp:Panel>

                <ajaxToolkit:ModalPopupExtender ID="AddProductModal" runat="server" TargetControlID="AddProductButton"
                    PopupControlID="AddProductPanel" BackgroundCssClass="modal-background" CancelControlID="btnCloseAddProductModal" />

                <!-- Edit Product Modal -->
                <asp:Panel ID="EditProductPanel" runat="server" CssClass="modal-content" Style="display: none;">
                    <h2>Edit Product</h2>
                    <asp:Label ID="lblEditProductError" runat="server" ForeColor="Red" CssClass="mb-2" />
                    <asp:TextBox ID="txtEditProductName" runat="server" Placeholder="Product Name" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditPrice" runat="server" Placeholder="Price" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditStockQuantity" runat="server" Placeholder="Stock Quantity" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditImageUrl" runat="server" Placeholder="Image URL" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditCategoryId" runat="server" Placeholder="Category ID" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditDescription" runat="server" Placeholder="Description" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" />
                    <div class="modal-actions mt-3">
                        <asp:Button ID="btnUpdateProduct" runat="server" Text="Update" CssClass="btn btn-main" OnClick="UpdateProduct_Click" />
                        <asp:Button ID="btnCloseEditProductModal" runat="server" Text="Close" CssClass="btn btn-secondary" />
                    </div>
                </asp:Panel>

                <ajaxToolkit:ModalPopupExtender ID="EditProductModal" runat="server" TargetControlID="DummyEditTarget"
                    PopupControlID="EditProductPanel" BackgroundCssClass="modal-background" CancelControlID="btnCloseEditProductModal" />

                <!-- Hidden button to trigger Edit modal -->
                <asp:Button ID="DummyEditTarget" runat="server" Style="display: none;" />
            </div>
        </section>
    </div>
</asp:Content>
