using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace RetetarWebForms.Services
{
    /// <inheritdoc />
    public class CryptService : ICryptService
    {
        //The IV must be of length 16
        private byte[] _iv;

        //The key must be of length 32 or 24 or 16
        private byte[] _key;

        public CryptService()
        {
            _key = GetKey();
            _iv = GetIv();
        }

        /// <inheritdoc />
        public string Encrypt(string plainText)
        {
            using (var aes = Aes.Create())
            {
                aes.Key = _key;
                aes.IV = _iv;

                var encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    {
                        using (var sw = new StreamWriter(cs))
                        {
                            sw.Write(plainText);
                        }
                    }

                    var encrypted = ms.ToArray();
                    return Convert.ToBase64String(encrypted);
                }
            }
        }

        /// <inheritdoc />
        public string Decrypt(string encryptedText)
        {
            var encrypted = Convert.FromBase64String(encryptedText);

            using (var aes = Aes.Create())
            {
                aes.Key = _key;
                aes.IV = _iv;

                var decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (var ms = new MemoryStream(encrypted))
                {
                    using (var cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                    {
                        using (var sr = new StreamReader(cs))
                        {
                            return sr.ReadToEnd();
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Generated a key for encrypting and decrypting strings
        /// </summary>
        /// <returns>A byte array of length 32, 24 or 16</returns>
        /// <exception cref="Exception">Throws exception if the byte length of <c>EncryptKey</c> value from web.config is less than 16.</exception>
        private byte[] GetKey()
        {
            var key = Encoding.UTF8.GetBytes(ConfigurationManager.AppSettings["EncryptKey"]);
            if (key.Length >= 32)
            {
                key = key.Take(32).ToArray();
            }
            else if (key.Length >= 24)
            {
                key = key.Take(24).ToArray();
            }
            else if (key.Length >= 16)
            {
                key = key.Take(16).ToArray();
            }
            else
            {
                var keyAndIv = ConfigurationManager.AppSettings["EncryptKey"] + "|" + ConfigurationManager.AppSettings["EncryptIv"];
                key = Encoding.UTF8.GetBytes(keyAndIv).Take(16).ToArray();
                if (key.Length < 16)
                {
                    throw new Exception("The encryption security key must be of byte length 32, 24 or 16");
                }

                key = key.Take(16).ToArray();
            }

            return key;
        }

        /// <summary>
        /// Generated an initialization vector for encrypting and decrypting strings
        /// </summary>
        /// <returns>A byte array of length 16</returns>
        /// <exception cref="Exception">Throws exception if the byte length of <c>EncryptKey</c> value from web.config is less than 16.</exception>
        private byte[] GetIv()
        {
            var iv = Encoding.UTF8.GetBytes(ConfigurationManager.AppSettings["EncryptIv"]);
            return iv.Length >= 16 ? iv.Take(16).ToArray() : new byte[16];
        }
    }
}