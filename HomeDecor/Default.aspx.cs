using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomeDecor.Models;
using System.Web.ModelBinding;

namespace HomeDecor
{
    public partial class _Default : Page

    {
        HomedecorDBEntities1 db = new HomedecorDBEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }

        }

        private void BindCategories()
        {
            // Get the first 4 categories
            var categories = (from c in db.Categories
                              orderby c.Name
                              select new
                              {
                                  c.Id,
                                  c.Name,
                                  ImageUrl = c.ImgUrl // Set default image URL or use a property if available
                              }).Take(4); // Limit the number of categories to 4

            CategoryDataList.DataSource = categories.ToList();
            CategoryDataList.DataBind();
        }

    }
}