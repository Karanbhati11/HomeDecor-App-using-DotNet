using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomeDecor.Models;

namespace HomeDecor
{
    public partial class AdminProducts : System.Web.UI.Page
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
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            var products = db.Products.ToList();
            ProductsGridView.DataSource = products;
            ProductsGridView.DataBind();
        }

        protected void ProductsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ProductsGridView.PageIndex = e.NewPageIndex;
            LoadProducts(); // Re-load the data with the new page index
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            AddProductModal.Show(); // Show the Add Product modal
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId;
            if (int.TryParse(btn.CommandArgument, out productId))
            {
                var product = db.Products.SingleOrDefault(p => p.Id == productId);
                if (product != null)
                {
                    // Pre-fill the modal fields with the product data
                    txtEditProductName.Text = product.Name;
                    txtEditPrice.Text = product.Price.ToString("0.00"); // Ensure formatting
                    txtEditStockQuantity.Text = product.StockQuantity.ToString();
                    txtEditImageUrl.Text = product.ImageUrl;
                    txtEditCategoryId.Text = product.CategoryId.ToString();
                    txtEditDescription.Text = product.Description;

                    // Store the ProductID in ViewState for updating
                    ViewState["ProductID"] = productId;

                    // Show the Edit Product modal
                    EditProductModal.Show();
                }
                else
                {
                    lblEditProductError.Text = "Product not found.";
                }
            }
            else
            {
                lblEditProductError.Text = "Invalid product ID.";
            }
        }

        protected void SaveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtProductName.Text))
                {
                    lblAddProductError.Text = "Product name cannot be empty.";
                    lblAddProductError.ForeColor = System.Drawing.Color.Red;
                    AddProductModal.Show(); // Keep the modal open if there's an error
                    return;
                }

                decimal price;
                int stockQuantity;
                int categoryId;

                if (decimal.TryParse(txtPrice.Text, out price) &&
                    int.TryParse(txtStockQuantity.Text, out stockQuantity) &&
                    int.TryParse(txtCategoryId.Text, out categoryId))
                {
                    Product newProduct = new Product
                    {
                        Name = txtProductName.Text,
                        Price = price,
                        StockQuantity = stockQuantity,
                        ImageUrl = txtImageUrl.Text,
                        CategoryId = categoryId,
                        Description = txtDescription.Text
                    };

                    db.Products.Add(newProduct);
                    db.SaveChanges();

                    LoadProducts();
                    ClearAddProductModal();
                    AddProductModal.Hide(); // Hide the modal after saving
                }
                else
                {
                    lblAddProductError.Text = "Please enter valid values for price, stock quantity, and category ID.";
                    lblAddProductError.ForeColor = System.Drawing.Color.Red;
                    AddProductModal.Show(); // Keep the modal open if there's an error
                }
            }
            catch (Exception ex)
            {
                lblAddProductError.Text = "An error occurred while saving the product. Please try again.";
                lblAddProductError.ForeColor = System.Drawing.Color.Red;
                AddProductModal.Show(); // Keep the modal open if there's an exception
            }
        }


        protected void UpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtEditProductName.Text))
                {
                    lblEditProductError.Text = "Product name cannot be empty.";
                    lblEditProductError.ForeColor = System.Drawing.Color.Red;
                    EditProductModal.Show(); // Keep the modal open if there's an error
                    return;
                }

                int productId = (int)ViewState["ProductID"];
                var product = db.Products.SingleOrDefault(p => p.Id == productId);

                if (product != null)
                {
                    decimal price;
                    int stockQuantity;
                    int categoryId;

                    if (decimal.TryParse(txtEditPrice.Text, out price) &&
                        int.TryParse(txtEditStockQuantity.Text, out stockQuantity) &&
                        int.TryParse(txtEditCategoryId.Text, out categoryId))
                    {
                        // Clear any previous error messages
                        lblEditProductError.Text = string.Empty;

                        product.Name = txtEditProductName.Text;
                        product.Price = price;
                        product.StockQuantity = stockQuantity;
                        product.ImageUrl = txtEditImageUrl.Text;
                        product.CategoryId = categoryId;
                        product.Description = txtEditDescription.Text;

                        db.SaveChanges();
                        LoadProducts();
                        EditProductModal.Hide(); // Hide the modal after updating
                    }
                    else
                    {
                        lblEditProductError.Text = "Please enter valid values for price, stock quantity, and category ID.";
                        lblEditProductError.ForeColor = System.Drawing.Color.Red;
                        EditProductModal.Show(); // Keep the modal open if there's an error
                    }
                }
            }
            catch (Exception ex)
            {
                lblEditProductError.Text = "An error occurred while updating the product. Please try again.";
                lblEditProductError.ForeColor = System.Drawing.Color.Red;
                EditProductModal.Show(); // Keep the modal open if there's an exception
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                int productId;
                if (int.TryParse(btn.CommandArgument, out productId))
                {
                    var product = db.Products.SingleOrDefault(p => p.Id == productId);
                    if (product != null)
                    {
                        db.Products.Remove(product);
                        db.SaveChanges();
                        LoadProducts();
                    }
                    else
                    {
                        lblErrorMessage.Text = "Product not found.";
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Invalid product ID.";
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while deleting the product. Please try again.";
            }
        }

        private void ClearAddProductModal()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtStockQuantity.Text = "";
            txtImageUrl.Text = "";
            txtCategoryId.Text = "";
            txtDescription.Text = "";
            lblAddProductError.Text = ""; // Clear error message when closing the modal
        }
    }
}
