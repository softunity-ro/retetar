using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RetetarWebForms
{
    public partial class Main : System.Web.UI.MasterPage
    {
        public HtmlGenericControl BodyTag
        {
            get => MasterPageBodyTag;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            an.InnerText = DateTime.Now.Year.ToString();
        }
    }
}