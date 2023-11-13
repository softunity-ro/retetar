using System;
using System.Configuration;
using System.Net.Mail;
using System.Web.WebPages;

namespace RetetarWebForms
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void SubmitBtn_ServerClick(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Recaptcha.Response))
            {
                lblMessage.InnerText = "Captcha invalid!";
            }
            else
            {
                var result = Recaptcha.Verify();

                if (result.Success)
                {
                    if (Page.IsValid)
                    {
                        try
                        {
                            string mailMessage =
                                $@"Salut, <br/>Acesta este email-ul din pagina de contact a site-ului [retetar] <br/>Informatiile completate sunt: <br/>";
                            mailMessage += $"Numele: {nume.Value} <br/>";
                            mailMessage += $"Telefon: {telefon.Value} <br/>";
                            mailMessage += $"Mesaj: {mesaj.Value} <br/>";

                            MailMessage mail = new MailMessage();
                            mail.To.Add(ConfigurationManager.AppSettings["MailTo"]);
                            mail.CC.Add(email.Value);
                            mail.From = new MailAddress(ConfigurationManager.AppSettings["MailFrom"]);
                            mail.Subject = "[retetar] - formular de contact";
                            mail.IsBodyHtml = true;
                            mail.Body = mailMessage;

                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = ConfigurationManager.AppSettings["Smtp"];
                            smtp.Port = ConfigurationManager.AppSettings["SmtpPort"].As<int>();
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new System.Net.NetworkCredential(
                                ConfigurationManager.AppSettings["SmtpUser"],
                                ConfigurationManager.AppSettings["SmtpPass"]);
                            smtp.EnableSsl = true;
                            smtp.Timeout = 30000;


                            await smtp.SendMailAsync(mail);

                            formular.Visible = false;
                            status.IsSuccess = true;
                            formStatus.Visible = true;
                        }
                        catch (Exception)
                        {
                            // Should log the error somewhere
                            formular.Visible = false;
                            status.IsSuccess = false;
                            formStatus.Visible = true;
                        }
                    }
                }
                else
                {
                    lblMessage.InnerText = "Eroare: ";

                    foreach (var err in result.ErrorCodes)
                    {
                        lblMessage.InnerText += err;
                    }
                }
            }
        }
    }
}