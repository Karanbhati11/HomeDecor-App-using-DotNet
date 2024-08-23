using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomeDecor.Models;

namespace HomeDecor
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            var cart = (List<CartItem>)Session["Cart"];
            if (cart != null && cart.Count > 0)
            {
                // Bind data to GridView
                CartGridView.DataSource = cart;
                CartGridView.DataBind();

                // Display total price
                CartTotalLabel.Text = GetCartTotal();

                // Show GridView and summary
                CartGridView.Visible = true;
                CartSummaryDiv.Visible = true;
                ContinueShoppingButton.Visible = false;
                lblEmptyCartMessage.Visible = false;
            }
            else
            {
                // Hide GridView and summary
                CartGridView.Visible = false;
                CartSummaryDiv.Visible = false;

                // Show empty cart message and continue shopping button
                lblEmptyCartMessage.Text = "Your cart is empty.";
                lblEmptyCartMessage.Visible = true;
                ContinueShoppingButton.Visible = true;
            }
        }


        private string GetCartTotal()
        {
            var cart = (List<CartItem>)Session["Cart"];
            if (cart != null)
            {
                decimal total = cart.Sum(item => item.Price * item.Quantity);
                return string.Format("${0:0.00}", total);
            }
            return "$0.00";
        }

        protected void CartCommand(object sender, CommandEventArgs e)
        {
            var cart = (List<CartItem>)Session["Cart"];
            if (cart != null)
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                var item = cart.FirstOrDefault(c => c.ProductId == productId);

                if (item != null)
                {
                    switch (e.CommandName)
                    {
                        case "DecreaseQuantity":
                            if (item.Quantity > 1)
                            {
                                item.Quantity--;
                            }
                            break;

                        case "IncreaseQuantity":
                            item.Quantity++;
                            break;

                        case "RemoveItem":
                            cart.Remove(item);
                            break;
                    }

                    Session["Cart"] = cart;
                    BindCart();  // Re-bind the cart to update the UI
                }
            }
        }

        protected void ContinueShoppingButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            string cartTotal = GetCartTotal();
            Session["CartTotal"] = cartTotal;
            Response.Redirect("Checkout.aspx");
        }

    }

}