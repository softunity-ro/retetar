namespace RetetarWebForms
{
    public static class UserExtensions
    {
        public static bool IsValid(this Models.User user)
        {
            if (user == null || string.IsNullOrWhiteSpace(user.Username) || string.IsNullOrWhiteSpace(user.Password))
            {
                return false;
            }

            return user.Username.Trim().Length > 4 && user.Password.Trim().Length > 4;
        }
    }
}