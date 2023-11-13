using RetetarWebForms.Constants;
using RetetarWebForms.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetetarWebForms.Components {
    public partial class ImageBrowser : UserControl
    {
        public string SelectedImage { get; private set; }

        public string PanelStyle {
            get { return (string)ViewState["PanelStyle"] ?? ""; }
            set { ViewState["PanelStyle"] = value; }
        }

        public string PanelCssClass {
            get { return (string)ViewState["PanelCssClass"] ?? ""; }
            set { ViewState["PanelCssClass"] = value; }
        }

        public event EventHandler OnSelectedImageChanged;
        private List<ImageFileDto> ImageFileNames { get; set; }

        protected void Page_Load(object sender, EventArgs e) {
            
            
            DataBind();

            LoadImages();

            ImageList.DataSource = ImageFileNames;
            ImageList.DataBind();
        }

        private void LoadImages() {
            var directoryPath = Server.MapPath(FilePaths.ImageCategory);
            int x = 0;
            ImageFileNames = Directory
                .GetFiles(directoryPath, "*.*", searchOption: SearchOption.AllDirectories)
                .Where(file => file.ToLower().EndsWith(".jpg") ||
                    file.ToLower().EndsWith(".jpeg") ||
                    file.ToLower().EndsWith(".gif") ||
                    file.ToLower().EndsWith(".png") ||
                    file.ToLower().EndsWith(".bmp"))
                .Select(filePath => new ImageFileDto() {
                    Id = x++,
                    LocalFilePath = new Uri(directoryPath).MakeRelativeUri(new Uri(filePath)).ToString()
                })
                .ToList();
        }

        protected void ImagePreview_OnClick(object sender, ImageClickEventArgs e) {
            SelectedImage = ((ImageButton)sender).ImageUrl;
            DeselectAll();
            AddCssClass((ImageButton)sender, "selected-image");
            OnSelectedImageChanged?.Invoke(this, e);
        }

        private void DeselectAll() {
            foreach (var control in ImageList.Controls.All()) {
                if (!(control is ImageButton imgButton)) continue;
                if (imgButton.CssClass.Contains("selected-image")) {
                    imgButton.CssClass = "";
                }
            }
        }

        private void AddCssClass(ImageButton imgButton, string className) {
            if (imgButton.CssClass.Contains(className)) {
                imgButton.CssClass = "";
            }

            imgButton.CssClass = "selected-image";
        }

        protected void btnSave_Click(object sender, EventArgs e) {
            Page.Validate("imageGroup");
            if (!Page.IsValid) return;

            //upload image
            newImage.SaveAs(Server.MapPath("/") + FilePaths.ImageCategory + newImage.FileName);

            //save new file to session
            Session[SessionVariables.ImageUploaded] = newImage.FileName;

            ReloadImagesUI(true);
            SelectedImage = FilePaths.ImageCategory + newImage.FileName;
            OnSelectedImageChanged?.Invoke(this, e);
        }

        private void ReloadImagesUI(bool keepSelected = false) {
            if (!keepSelected) {
                SelectedImage = "";
            }
            LoadImages();
            ImageList.DataSource = ImageFileNames;
            ImageList.DataBind();
            panelNew.Visible = false;
            panelBrowse.Visible = true;
        }

        protected void btnNew_OnClick(object sender, EventArgs e) {
            panelNew.Visible = true;
            panelBrowse.Visible = false;
        }

        protected void btnCancel_OnClick(object sender, EventArgs e) {
            panelNew.Visible = false;
            panelBrowse.Visible = true;
        }
    }
}