using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using RetetarWebForms.Services;

namespace RetetarWebForms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginControl_Authenticate(object sender, AuthenticateEventArgs e)
        {
            var userService = new UserService();
            var user = userService.Get(LoginControl.UserName, LoginControl.Password);

            if (!user.IsValid()) return;
            if (user.ChangePasswordRequired)
            {
                FormsAuthentication.SetAuthCookie(LoginControl.UserName, LoginControl.RememberMeSet);
                //redirect user to change password page
                Response.Redirect($"/Manage/User/ChangePassword.aspx?id={user.Id}");
            }

            FormsAuthentication.RedirectFromLoginPage(LoginControl.UserName, LoginControl.RememberMeSet);
        }
    }
}