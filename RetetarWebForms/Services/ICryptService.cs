namespace RetetarWebForms.Services
{
    /// <summary>
    /// It is a service that encrypts and decrypts strings
    /// </summary>
    /// <remarks>
    /// This is just an example of how to encrypt and decrypt strings
    /// </remarks>
    public interface ICryptService
    {
        /// <summary>
        /// Function that encrypts a string
        /// </summary>
        /// <param name="plainText">Value to be encrypted</param>
        /// <returns>Value encrypted as string</returns>
        string Encrypt(string plainText);

        /// <summary>
        /// Function that decrypts a string
        /// </summary>
        /// <param name="encryptedText">Value to be decrypted</param>
        /// <returns>Value decrypted as string</returns>
        string Decrypt(string encryptedText);
    }
}