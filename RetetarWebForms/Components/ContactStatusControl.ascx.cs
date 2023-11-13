using System;
using System.Web.UI;

namespace RetetarWebForms.Components
{
    public partial class ContactStatusControl : UserControl
    {
        public bool IsSuccess { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}