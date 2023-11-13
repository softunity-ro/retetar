using System;
using System.Web.UI;
using RetetarWebForms.Services;

namespace RetetarWebForms
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterButton_OnClick(object sender, EventArgs e)
        {
            var user = new Models.User
            {
                Username = UserName.Text,
                Password = Password.Text,
                ChangePasswordRequired = true
            };

            //Return to page and show that this user is invalid
            errorText.InnerText = "Numele de utilizator și parola trebuie să aibă cel puțin 5 caractere";
            if (!user.IsValid()) return;
            
            var userService = new UserService();
            if (userService.IsUsernameTaken(user.Username))
            {
                //redirect to page and show a message that this username is taken
                errorText.InnerText = "Numele de utilizator este deja luat!";
            }
            else
            {
                userService.Add(user.Username, user.Password, user.ChangePasswordRequired);
                
                //transfer/redirect to login page
                Server.Transfer("~/User/Login.aspx");
            }
            
        }
    }
}