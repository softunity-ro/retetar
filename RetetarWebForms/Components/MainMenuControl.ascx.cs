using System;
using System.Web.Security;
using System.Web.UI;

namespace RetetarWebForms.Components
{
    public partial class MainMenuControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.RedirectPermanent("/User/Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}