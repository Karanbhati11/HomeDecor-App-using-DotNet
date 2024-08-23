using HomeDecor.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeDecor
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStates();
                DisplayTotalAmount();
            }
        }
        private void LoadStates()
        {
            using (var context = new HomedecorDBEntities1())
            {
                var states = context.States.ToList();
                StateDropDownList.DataSource = states;
                StateDropDownList.DataTextField = "Name";
                StateDropDownList.DataValueField = "Id";
                StateDropDownList.DataBind();
                StateDropDownList.Items.Insert(0, new ListItem("Select State", ""));
            }
        }

        private void DisplayTotalAmount()
        {
            var cartTotal = Session["CartTotal"] as string;
            // Debugging: Log or display cartTotal to verify it is correct
            if (!string.IsNullOrEmpty(cartTotal))
            {
                TotalAmountLabel.Text = cartTotal;
            }
            else
            {
                TotalAmountLabel.Text = "$0.00";
            }
        }

        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Clear the cart
                Session["Cart"] = null;
                Response.Redirect("ThankYou.aspx");
            }
        }

        protected void CancelOrderButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }

    
}