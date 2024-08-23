using System;
using System.Web;

namespace HomeDecor
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblWelcomeUser.Text = $"Welcome, <i>{Session["Username"]}</i>";
                lblWelcomeUser.Visible = true;
                loginNav.Visible = false;
                logoutNav.Visible = true;

                lblWelcomeUserMobile.Text = $"Welcome, <i>{Session["Username"]}</i>";
                lblWelcomeUserMobile.Visible = true;
            }
            else
            {
                lblWelcomeUser.Visible = false;
                loginNav.Visible = true;
                logoutNav.Visible = false;

                lblWelcomeUserMobile.Visible = false;
            }
        }


        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear the session and redirect to the login page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}
