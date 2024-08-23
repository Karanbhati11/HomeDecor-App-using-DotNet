using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomeDecor.Models;

namespace HomeDecor
{
    public partial class Products : System.Web.UI.Page
    {

        HomedecorDBEntities1 db = new HomedecorDBEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int categoryId;
                if (int.TryParse(Request.QueryString["categoryId"], out categoryId) && categoryId > 0)
                {
                    BindProducts(categoryId);
                }
                else
                {
                    BindProducts(); // Call overloaded method to display all products
                }
            }
        }

        private void BindProducts(int? categoryId = null)
        {
            var products = from p in db.Products
                           select new
                           {
                               p.Id,
                               p.Name,
                               p.Price,
                               p.CategoryId,
                               ImageUrl = p.ImageUrl // Use actual image URL from the database
                           };

            if (categoryId.HasValue)
            {
                products = products.Where(p => p.CategoryId == categoryId.Value);
            }

            ProductDataList.DataSource = products.OrderBy(p => p.Name).ToList();
            ProductDataList.DataBind();
        }

        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                int quantity = Convert.ToInt32(Request.Form["quantity_" + productId]);

                AddToCart(productId, quantity);

                Response.Redirect("Cart.aspx");
            }
        }

        private void AddToCart(int productId, int quantity)
        {
            var cart = (List<CartItem>)Session["Cart"];
            if (cart == null)
            {
                cart = new List<CartItem>();
                Session["Cart"] = cart;
            }

            var product = db.Products.Find(productId);
            if (product != null)
            {
                var existingItem = cart.FirstOrDefault(c => c.ProductId == productId);
                if (existingItem != null)
                {
                    existingItem.Quantity += quantity;
                }
                else
                {
                    cart.Add(new CartItem
                    {
                        ProductId = productId,
                        Name = product.Name,
                        Price = product.Price,
                        Quantity = quantity,
                        ImageUrl = product.ImageUrl
                    });
                }
            }
        }
    }

}