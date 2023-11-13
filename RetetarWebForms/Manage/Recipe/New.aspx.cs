using RetetarWebForms.Components;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace RetetarWebForms.Manage.Recipe
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imageBtn_Click(object sender, EventArgs e)
        {
            var panel = ((LinkButton)sender).Parent.FindControl("imageBrowserPanel");
            panel.Visible = true;
            ((Main)Master).BodyTag.Style.Add("overflow", "hidden");
        }

        protected void imageBrowser_OnSelectedImageChanged(object sender, EventArgs e)
        {
            var ib = (ImageBrowser)sender;
            var txt = (TextBox)ib.Parent.FindControl("ImagePathTextBox");
            txt.Text = ib.SelectedImage;
            var panel = (Panel)ib.Parent.FindControl("imageBrowserPanel");
            panel.Visible = false;
            ((Main)Master).BodyTag.Style.Add("overflow", "visible");
        }

        protected void RecipeList_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void closeBtn_Click(object sender, EventArgs e)
        {
            ((Main)Master).BodyTag.Style.Add("overflow", "auto");

            var panel = ((LinkButton)sender).Parent.FindControl("imageBrowserPanel");
            panel.Visible = false;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var content = (TextBox)((WebControl)source).FindControl("Content");
            var value = System.Web.HttpUtility.HtmlDecode(content.Text);
            const string pattern = @"((<.*?>){1,})";
            var valReplace = Regex.Replace(value, pattern, "");
            if (valReplace.Length >= 100)
            {
                args.IsValid = true;
                return;
            }

            args.IsValid = false;
        }
    }
}