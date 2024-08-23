<%@ Page Title="Manage Categories" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminCategories.aspx.cs" Inherits="HomeDecor.AdminCategories" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-dashboard-pages">
        <section class="page-banner">
            <div class="container">
                <div class="width-100">
                    <h2 class="page-title">Manage Categories</h2>
                </div>
            </div>
        </section>

        <section>
            <div class="container">

                
                <div class="add-category mb-4">
                    <asp:Button ID="AddCategoryButton" runat="server" Text="Add New Category" CssClass="btn btn-main" OnClick="AddCategoryButton_Click" />
                </div>


                <!-- Error message label -->
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="mb-2" />

                <asp:GridView ID="CategoriesGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    AllowPaging="True" PageSize="10" OnPageIndexChanging="CategoriesGridView_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Category ID" />
                        <asp:BoundField DataField="Name" HeaderText="Category Name" />
                        <asp:BoundField DataField="ImgUrl" HeaderText="Image URL" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="EditCategoryButton" runat="server" Text="Edit" CssClass="btn-main btn-sm" CommandArgument='<%# Eval("Id") %>' OnClick="EditCategoryButton_Click" />
                                <asp:Button ID="DeleteCategoryButton" runat="server" Text="Delete" CssClass="btn-secondary btn-sm" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteCategoryButton_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- Add Category Modal -->
                <asp:Panel ID="AddCategoryPanel" runat="server" CssClass="modal-content" Style="display:none;">
                    <h2>Add New Category</h2>
                    <asp:Label ID="lblAddCategoryError" runat="server" ForeColor="Red" CssClass="mb-2" />
                    <asp:TextBox ID="txtCategoryName" runat="server" Placeholder="Category Name" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtCategoryImgUrl" runat="server" Placeholder="Image URL" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtCategoryDescription" runat="server" Placeholder="Description" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" />
                    <div class="modal-actions mt-3">
                        <asp:Button ID="btnSaveCategory" runat="server" Text="Save" CssClass="btn btn-main" OnClick="SaveCategory_Click" />
                        <asp:Button ID="btnCloseAddCategoryModal" runat="server" Text="Close" CssClass="btn btn-secondary" />
                    </div>
                </asp:Panel>

                <ajaxToolkit:ModalPopupExtender ID="AddCategoryModal" runat="server" TargetControlID="AddCategoryButton"
                    PopupControlID="AddCategoryPanel" BackgroundCssClass="modal-background" CancelControlID="btnCloseAddCategoryModal" />

                <!-- Edit Category Modal -->
                <asp:Panel ID="EditCategoryPanel" runat="server" CssClass="modal-content" Style="display:none;">
                    <h2>Edit Category</h2>
                    <asp:Label ID="lblEditCategoryError" runat="server" ForeColor="Red" CssClass="mb-2" />
                    <asp:TextBox ID="txtEditCategoryName" runat="server" Placeholder="Category Name" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditCategoryImgUrl" runat="server" Placeholder="Image URL" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtEditCategoryDescription" runat="server" Placeholder="Description" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" />
                    <div class="modal-actions mt-3">
                        <asp:Button ID="btnUpdateCategory" runat="server" Text="Update" CssClass="btn btn-main" OnClick="UpdateCategory_Click" />
                        <asp:Button ID="btnCloseEditCategoryModal" runat="server" Text="Close" CssClass="btn btn-secondary" />
                    </div>
                </asp:Panel>

                <ajaxToolkit:ModalPopupExtender ID="EditCategoryModal" runat="server" TargetControlID="DummyEditTarget"
                    PopupControlID="EditCategoryPanel" BackgroundCssClass="modal-background" CancelControlID="btnCloseEditCategoryModal" />

                <!-- Hidden button to trigger Edit modal -->
                <asp:Button ID="DummyEditTarget" runat="server" Style="display:none;" />
            </div>
        </section>
    </div>
</asp:Content>
