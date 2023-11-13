using System;
using System.Web.UI.WebControls;

namespace RetetarWebForms.Components
{
    public partial class CategoryManagerControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            btnNew.Visible = false;
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            //validate
            Page.Validate("newCategoryVal");
            if (!Page.IsValid) return;

            //Insert data in database
            try
            {
                CategorySource.Insert();
            }
            catch (Exception exception)
            {
                if (exception.Message.Contains("duplicate key") || (exception.InnerException != null &&
                                                                    exception.InnerException.Message.Contains(
                                                                        "duplicate key")))
                {
                    lblError.Text = "Aceasta categorie exista deja!";
                    return;
                }
            }


            //Reset fields
            txtCategorie.Text = "";
            txtImagine.Text = "";
            lblError.Text = "";

            Panel1.Visible = false;
            btnNew.Visible = true;
        }

        protected void CategorySource_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters[0] = txtCategorie.Text;
            e.InputParameters[1] = txtImagine.Text;
        }

        protected void Anuleaza_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            btnNew.Visible = true;
        }

        protected void btnNewImageBrowse_OnClick(object sender, EventArgs e)
        {
            newSelectImage.Visible = true;

            ((Main)Page.Master).BodyTag.Style.Add("overflow", "hidden");
            newImageBrowserPanel.Visible = true;
        }

        protected void newSelectImage_OnOnSelectedImageChanged(object sender, EventArgs e)
        {
            txtImagine.Text = newSelectImage.SelectedImage;
            newSelectImage.Visible = false;
            newImageBrowserPanel.Visible = false;
            ((Main)Page.Master).BodyTag.Style.Add("overflow", "auto");
        }

        protected void closeNewBtn_Click(object sender, EventArgs e)
        {
            ((Main)Page.Master).BodyTag.Style.Add("overflow", "auto");

            var panel = ((LinkButton)sender).Parent.FindControl("newImageBrowserPanel");
            panel.Visible = false;
        }

        protected void editSelectImage_OnOnSelectedImageChanged(object sender, EventArgs e)
        {
            var imageBrowser = (ImageBrowser)sender;
            var txt = (TextBox)imageBrowser.Parent.FindControl("ImageUrlTextBox");
            txt.Text = imageBrowser.SelectedImage;
            var imgPreview = (Image)imageBrowser.Parent.FindControl("editImagePreview");
            imgPreview.ImageUrl = txt.Text;
            imageBrowser.Visible = false;

            ((Main)Page.Master).BodyTag.Style.Add("overflow", "auto");
            var panel = imageBrowser.Parent.FindControl("editImageBrowserPanel");
            panel.Visible = false;
        }

        protected void btnEditImageBrowse_OnClick(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            var imageBrowser = (ImageBrowser)btn.Parent.FindControl("editSelectImage");
            imageBrowser.Visible = true;

            ((Main)Page.Master).BodyTag.Style.Add("overflow", "hidden");
            var panel = btn.Parent.FindControl("editImageBrowserPanel");
            panel.Visible = true;
        }

        protected void closeEditBtn_Click(object sender, EventArgs e)
        {
            ((Main)Page.Master).BodyTag.Style.Add("overflow", "auto");

            var panel = ((LinkButton)sender).Parent.FindControl("editImageBrowserPanel");
            panel.Visible = false;
        }

        protected void CategoryList_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            var lbl = (Label)CategoryList.EditItem.FindControl("lblEditError");
            lbl.Text = "";
            if (e.Exception != null && e.Exception.Message.Contains("duplicate key") || (e.Exception?.InnerException != null && e.Exception.InnerException.Message.Contains("duplicate key")))
            {
                lbl.Text = "Aceasta categorie exista deja!<br>";
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }
    }
}