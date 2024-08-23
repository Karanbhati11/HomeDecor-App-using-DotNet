using HomeDecor.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeDecor
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                DisplayTotalProducts();
                DisplayTotalCategories();
            }
        }

        private void DisplayTotalProducts()
        {
            int totalProducts = db.Products.Count();
            lblTotalProducts.Text = $"{totalProducts}";

        }

        private void DisplayTotalCategories()
        {
            int totalCategories = db.Categories.Count();
            lblTotalCategories.Text = $"{totalCategories}";
        }
    }
}
