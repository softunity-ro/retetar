# Retetar

This is a project developed by Man Andrei-Catalin as a result of participating at the `Software Developer: C# and Microsoft .NET` course offered by `Azimut Vision`.

Can be previewed at [https://retetar.softunity.ro](https://retetar.softunity.ro)

## Getting Started

### Requirements

- Microsoft Visual Studio
- .Net Framework v4.8
- Microsoft SQL Server
- reCAPTCHA account and configure site with the type: `v2 Checkbox`, you can sign up at https://www.google.com/recaptcha
- SMTP server, SSL enabled with an account used for logging in. If you want to use gMail server to obtain the required requirements for the application configuration, you can try the steps on the following website https://www.gmass.co/blog/gmail-smtp/ **(note that this is not tested)**

### Application configuration

1. Create a database with all the required tables by running the `db/create_database.sql` SQL script file.
2. Configure the `Web.config` file accordingly:
   - For the database connection please fill the key named `retetarConnectionString` so that it corresponds to your server and database configured at the previous step. For more connection strings options you may use https://www.connectionstrings.com/sql-server/ website
   - For the contact page to work, you need to fill the values under `appSettings` for the following keys:
     - `RecaptchaSiteKey` => the site key from reCAPTCHA Admin Console configured for your website
     - `RecaptchaSecretKey` => the secret key from reCAPTCHA Admin Console configured for your website
     - `MailFrom` => the email address from which the email will be sent
     - `MailTo` => the email address of whom will receive the email (the person filling the form will always be added as a Cc)
     - `Smtp` => the SMTP server address (the SMTP server must support SSL)
     - `SmtpPort` => the SMT port for which the server is listening
     - `SmtpUser` => The SMTP server username
     - `SmtpPass`=> The SMTP server password
   - For the initial site account the values of the following keys `AdminUsername` and `AdminPassword` will be used. The values must be of at least 5 characters long. The new account will be created only if no user exists in the database, and this is checked at application startup.
   - The user password for the site accounts will be encrypted, and for this to work you must provide:
     - `EncryptKey` => a string used as security key. The key value as a UTF-8 byte array needs to be of length 32, 24 or 16. The system will choose the highest available and if not will try to combine the key with the `EncryptIv` key value to get a minimum byte length of 16 bytes and if the constraint is still not satisfied, an error will be thrown
     - `EncryptIv` => a string that will be used for the initialization vector. The value as a UTF-8 byte array length must be of 16, and if it is longer only the first 16 will be used. If the constraint is not satisfied, an empty byte array will be used (`new byte[16]`)
