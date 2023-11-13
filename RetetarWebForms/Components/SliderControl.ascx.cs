using System;
using System.Web.UI.WebControls;

namespace RetetarWebForms.Components
{
    public partial class SliderControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDataBound(object sender, System.Web.UI.WebControls.ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                // Check if this is the first record
                if (e.Item.DisplayIndex == 0)
                {
                    // Set IsActive to true for the first record
                    SlideControl slide = e.Item.FindControl("slide") as SlideControl;
                    slide.IsActive = true;
                }
            }
        }
    }
}