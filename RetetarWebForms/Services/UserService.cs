using System.Configuration;
using System.Data.SqlClient;
using RetetarWebForms.Models;


namespace RetetarWebForms.Services
{
    /// <inheritdoc />
    public class UserService: IUserService
    {
        public User Get(string username, string password)
        {
            var cryptService = new CryptService();
            
            var con = new SqlConnection(ConnectionString);
            const string query = "SELECT * FROM Users WHERE Username = @username AND Password = @passwordEncrypted";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@passwordEncrypted", cryptService.Encrypt(password));
            con.Open();
            var reader = cmd.ExecuteReader();
            var user = new User();

            if (!reader.Read()) return user;

            user.Id = reader.GetInt32(0);
            user.Username = reader.GetString(1);
            user.Password = reader.GetString(2);
            user.ChangePasswordRequired = reader.GetBoolean(3);
            return user;
        }

        /// <inheritdoc />
        public User GetById(int id)
        {
            var con = new SqlConnection(ConnectionString);
            const string query = "SELECT * FROM Users WHERE Id = @id";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            var reader = cmd.ExecuteReader();
            var user = new User();

            if (!reader.Read()) return user;

            user.Id = reader.GetInt32(0);
            user.Username = reader.GetString(1);
            user.Password = reader.GetString(2);
            user.ChangePasswordRequired = reader.GetBoolean(3);
            return user;
        }

        /// <inheritdoc />
        /// <remarks>The password is automatically encrypted before adding</remarks>
        public void Add(string username, string password, bool changePasswordRequired = true)
        {
            ICryptService cryptService = new CryptService();
            
            var con = new SqlConnection(ConnectionString);
            const string query = "INSERT INTO Users (Username, Password, ChangePasswordRequired) VALUES (@username, @passwordEncrypted, @changePasswordRequired)";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@passwordEncrypted", cryptService.Encrypt(password));
            cmd.Parameters.AddWithValue("@changePasswordRequired", changePasswordRequired);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        /// <inheritdoc />
        /// <remarks>The password is automatically encrypted before adding</remarks>
        public void Add(User user)
        {
            Add(user.Username, user.Password, user.ChangePasswordRequired);
        }

        /// <inheritdoc />
        public void ChangeUsername(int id, string newUsername)
        {
            var con = new SqlConnection(ConnectionString);
            const string query = "UPDATE Users SET Username = @username WHERE Id = @id";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@username", newUsername);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        /// <inheritdoc />
        /// <remarks>The password is automatically encrypted before adding</remarks>
        public void ChangePassword(int id, string newPassword)
        {
            ICryptService cryptService = new CryptService();
            
            var con = new SqlConnection(ConnectionString);
            const string query = "UPDATE Users SET Password = @password, ChangePasswordRequired = @changePasswordRequired WHERE Id = @id";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@password", cryptService.Encrypt(newPassword));
            cmd.Parameters.AddWithValue("@changePasswordRequired", false);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        /// <inheritdoc />
        public void Delete(int id)
        {
            var con = new SqlConnection(ConnectionString);
            const string query = "DELETE FROM Users WHERE Id = @id";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        /// <inheritdoc />
        public bool IsUsernameTaken(string username)
        {
            var con = new SqlConnection(ConnectionString);
            const string query = "SELECT COUNT(*) FROM Users WHERE Username = @username";
            var cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            var reader = cmd.ExecuteReader();
            return reader.Read() && reader.GetInt32(0) > 0;
        }

        /// <inheritdoc />
        public bool IsAnyUserConfigured()
        {
            var con = new SqlConnection(ConnectionString);
            const string query = "SELECT COUNT(*) FROM Users";
            var cmd = new SqlCommand(query, con);
            con.Open();
            var reader = cmd.ExecuteReader();
            return reader.Read() && reader.GetInt32(0) > 0;
        }

        private static string ConnectionString => ConfigurationManager.ConnectionStrings["retetarConnectionString"].ConnectionString;
    }
}