using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using HomeDecor.Models;

namespace HomeDecor
{
    public partial class Login : System.Web.UI.Page
    {
        HomedecorDBEntities1 db = new HomedecorDBEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                // If the user is already logged in, redirect to the home page
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Hash the input password
            string hashedPassword = HashPassword(password);

            // Check user credentials
            var user = db.Users.SingleOrDefault(u => u.Email == email && u.PasswordHash == hashedPassword);

            if (user != null)
            {
                Session["UserId"] = user.Id;
                Session["Username"] = user.Username;
                Session["UserRole"] = user.Role;

                // Redirect based on user role
                if (user.Role == "admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid email or password.";
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
