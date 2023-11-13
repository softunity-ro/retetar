using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using RetetarWebForms.Constants;
using RetetarWebForms.Models;
using RetetarWebForms.Services;

namespace RetetarWebForms
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            try
            {
                //check if any user exists and if not add a default admin user
                var userService = new UserService();
                if (!userService.IsAnyUserConfigured())
                {
                    var user = new User()
                    {
                        Username = ConfigurationManager.AppSettings["AdminUsername"],
                        Password = ConfigurationManager.AppSettings["AdminPassword"],
                        ChangePasswordRequired = true
                    };
                    userService.Add(user);
                }

                //check if directory for recipe images exist and if not create it
                var directoryPath = Server.MapPath(FilePaths.ImageCategory);
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }
            }
            catch (Exception)
            {
                // ignored
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
        }

        protected void Application_Error(object sender, EventArgs e)
        {
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {
        }
    }
}