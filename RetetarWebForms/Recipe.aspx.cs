using System;
using System.Data;
using System.Web.UI.WebControls;

namespace RetetarWebForms
{
    public partial class Recipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RecipeDS_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            try
            {
                var result = e.ReturnValue as DataTable;
                if (result != null)
                {
                    SimilaRecipesDS.SelectParameters["categoryId"].DefaultValue = result.Rows[0]["CategoryId"].ToString();
                    SimilaRecipesDS.SelectParameters["id"].DefaultValue = result.Rows[0]["Id"].ToString();
                }
            }
            catch (Exception)
            {
            }

        }
    }
}