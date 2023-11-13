using RetetarWebForms.Models;

namespace RetetarWebForms.Services
{
    /// <summary>
    /// A service that provides user management functionalities
    /// </summary>
    public interface IUserService
    {
        /// <summary>
        /// Gets a user by username and password
        /// </summary>
        /// <param name="username">Username value as string</param>
        /// <param name="password">Password value as string</param>
        /// <returns>A <see cref="User"/> object</returns>
        User Get(string username, string password);
        
        /// <summary>
        /// Gets a user by id
        /// </summary>
        /// <param name="id">Id value as integer</param>
        /// <returns>A <see cref="User"/> object</returns>
        User GetById(int id);
        
        /// <summary>
        /// Adds a new user
        /// </summary>
        /// <param name="username">Username value as string</param>
        /// <param name="password">Password value as string</param>
        /// <param name="changePasswordRequired">Optional boolean that sets if user must change it's password</param>
        void Add(string username, string password, bool changePasswordRequired = true);
        
        /// <summary>
        /// Adds a new user
        /// </summary>
        /// <param name="user">A <see cref="User"/> object</param>
        void Add(User user);
        
        /// <summary>
        /// Change users username
        /// </summary>
        /// <param name="id">User id value as integer</param>
        /// <param name="newUsername">New string value for username</param>
        void ChangeUsername(int id, string newUsername);
        
        /// <summary>
        /// Change users password
        /// </summary>
        /// <param name="id">User id value as integer</param>
        /// <param name="newPassword">New string value for password</param>
        void ChangePassword(int id, string newPassword);
        
        /// <summary>
        /// Deletes a user
        /// </summary>
        /// <param name="id">User id value as integer</param>
        void Delete(int id);
        
        /// <summary>
        /// Check if a username is taken
        /// </summary>
        /// <param name="username">Value to be checked</param>
        /// <returns>True if username is taken</returns>
        bool IsUsernameTaken(string username);
        
        /// <summary>
        /// Checks if any user is configured
        /// </summary>
        /// <returns>True if any user is configured</returns>
        bool IsAnyUserConfigured();
    }
}