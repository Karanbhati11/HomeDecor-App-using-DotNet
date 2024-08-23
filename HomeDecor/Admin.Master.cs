using System;
using System.Web;

namespace HomeDecor
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    // If the user is not logged in, redirect to the login page
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    // Optionally, you can set the username to a label or control here
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear the session and redirect to the login page
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}
