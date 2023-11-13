using System;

namespace RetetarWebForms.Components
{
    public partial class SlideControl : System.Web.UI.UserControl
    {
        public string RecipeId { get; set; }
        public string ImageSource { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}