using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using HomeDecor.Models;

namespace HomeDecor
{
    public partial class Signup : System.Web.UI.Page
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

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            // Check if email already exists
            var existingUser = db.Users.SingleOrDefault(u => u.Email == email);
            if (existingUser != null)
            {
                lblMessage.Text = "Email already exists!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Hash the password
            string hashedPassword = HashPassword(password);

            // Create new user
            User newUser = new User
            {
                Username = username,
                Email = email,
                PasswordHash = hashedPassword,
                Role = "user" // Default role
            };

            db.Users.Add(newUser);

            try
            {
                db.SaveChanges();
                lblMessage.Text = "Signup successful! You can now login.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException ex)
            {
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Diagnostics.Debug.WriteLine($"Property: {validationError.PropertyName} Error: {validationError.ErrorMessage}");
                    }
                }
                lblMessage.Text = "There was an error during signup. Please try again.";
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
