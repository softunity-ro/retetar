using RetetarWebForms.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetetarWebForms
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var userId = Request.QueryString["id"];
                if (string.IsNullOrWhiteSpace(userId))
                {
                    //show invalid user id error
                    errorText.InnerText = "Id utilizator invalid!";
                    return;
                }
                var userService = new UserService();
                var user = userService.GetById(Convert.ToInt32(userId));
                if (!user.IsValid())
                {
                    //show invalid user error
                    errorText.InnerText = "Utilizator invalid!";
                }

                UserId.Value = user.Id.ToString();
                UserLabel.Text = user.Username;
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            var userService = new UserService();
            var user = userService.GetById(Convert.ToInt32(UserId.Value));
            if (NewPassword.Text == NewPasswordPair.Text && user.IsValid())
            {
                userService.ChangePassword(user.Id, NewPasswordPair.Text);
                Response.Redirect("List.aspx");
            }
        }
    }
}