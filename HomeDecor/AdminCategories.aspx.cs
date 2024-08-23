using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomeDecor.Models;

namespace HomeDecor
{
    public partial class AdminCategories : System.Web.UI.Page
    {
        HomedecorDBEntities1 db = new HomedecorDBEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {

            // Check if the user is logged in
            if (Session["UserId"] == null)
            {
                // If not logged in, redirect to the login page
                Response.Redirect("~/Login.aspx");
                return;
            }

            // Check if the logged-in user is an admin
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "admin")
            {
                // If not an admin, redirect to the home page
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            var categories = db.Categories.ToList();
            CategoriesGridView.DataSource = categories;
            CategoriesGridView.DataBind();
        }

        protected void CategoriesGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CategoriesGridView.PageIndex = e.NewPageIndex;
            LoadCategories();
        }

        protected void AddCategoryButton_Click(object sender, EventArgs e)
        {
            ClearAddCategoryModal(); // Clear any previous data and error messages
            AddCategoryModal.Show(); // Show the Add Category modal
        }

        protected void EditCategoryButton_Click(object sender, EventArgs e)
        {
            ClearEditCategoryModal(); // Clear any previous error messages

            Button btn = (Button)sender;
            int categoryId;
            if (int.TryParse(btn.CommandArgument, out categoryId))
            {
                var category = db.Categories.SingleOrDefault(c => c.Id == categoryId);
                if (category != null)
                {
                    // Pre-fill the modal fields with the category data
                    txtEditCategoryName.Text = category.Name;
                    txtEditCategoryImgUrl.Text = category.ImgUrl;
                    txtEditCategoryDescription.Text = category.Description;

                    // Store the CategoryId in ViewState for updating
                    ViewState["CategoryId"] = categoryId;

                    // Show the Edit Category modal
                    EditCategoryModal.Show();
                }
                else
                {
                    lblEditCategoryError.Text = "Category not found.";
                }
            }
            else
            {
                lblEditCategoryError.Text = "Invalid category ID.";
            }
        }

        protected void SaveCategory_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtCategoryName.Text))
                {
                    lblAddCategoryError.Text = "Category name cannot be empty.";
                    lblAddCategoryError.ForeColor = System.Drawing.Color.Red;
                    AddCategoryModal.Show(); // Keep the modal open if there's an error
                    return;
                }

                Category newCategory = new Category
                {
                    Name = txtCategoryName.Text,
                    ImgUrl = txtCategoryImgUrl.Text,
                    Description = txtCategoryDescription.Text
                };

                db.Categories.Add(newCategory);
                db.SaveChanges();

                LoadCategories();
                ClearAddCategoryModal();
                AddCategoryModal.Hide(); // Hide the modal after saving
            }
            catch (Exception ex)
            {
                lblAddCategoryError.Text = "An error occurred while saving the category. Please try again.";
                lblAddCategoryError.ForeColor = System.Drawing.Color.Red;
                AddCategoryModal.Show(); // Keep the modal open if there's an exception
            }
        }

        protected void UpdateCategory_Click(object sender, EventArgs e)
        {
            try
            {
                int categoryId = (int)ViewState["CategoryId"];
                var category = db.Categories.SingleOrDefault(c => c.Id == categoryId);

                if (category != null)
                {
                    if (string.IsNullOrWhiteSpace(txtEditCategoryName.Text))
                    {
                        lblEditCategoryError.Text = "Category name cannot be empty.";
                        lblEditCategoryError.ForeColor = System.Drawing.Color.Red;
                        EditCategoryModal.Show(); // Keep the modal open if there's an error
                        return;
                    }

                    // Clear any previous error messages
                    lblEditCategoryError.Text = string.Empty;

                    category.Name = txtEditCategoryName.Text;
                    category.ImgUrl = txtEditCategoryImgUrl.Text;
                    category.Description = txtEditCategoryDescription.Text;

                    db.SaveChanges();
                    LoadCategories();
                    ClearEditCategoryModal();
                    EditCategoryModal.Hide(); // Hide the modal after updating
                }
            }
            catch (Exception ex)
            {
                lblEditCategoryError.Text = "An error occurred while updating the category. Please try again.";
                lblEditCategoryError.ForeColor = System.Drawing.Color.Red;
                EditCategoryModal.Show(); // Keep the modal open if there's an exception
            }
        }

        protected void DeleteCategoryButton_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                int categoryId;
                if (int.TryParse(btn.CommandArgument, out categoryId))
                {
                    var category = db.Categories.SingleOrDefault(c => c.Id == categoryId);
                    if (category != null)
                    {
                        db.Categories.Remove(category);
                        db.SaveChanges();
                        LoadCategories();
                    }
                    else
                    {
                        lblErrorMessage.Text = "Category not found.";
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Invalid category ID.";
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while deleting the category. Please try again.";
            }
        }

        private void ClearAddCategoryModal()
        {
            txtCategoryName.Text = "";
            txtCategoryImgUrl.Text = "";
            txtCategoryDescription.Text = "";
            lblAddCategoryError.Text = ""; // Clear error message
        }

        private void ClearEditCategoryModal()
        {
            lblEditCategoryError.Text = ""; // Clear error message
        }

        protected void btnCloseAddCategoryModal_Click(object sender, EventArgs e)
        {
            ClearAddCategoryModal();
        }

        protected void btnCloseEditCategoryModal_Click(object sender, EventArgs e)
        {
            ClearEditCategoryModal();
        }
    }
}
