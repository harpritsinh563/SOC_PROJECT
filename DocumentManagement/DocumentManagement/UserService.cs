using DocumentManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DocumentManagement
{
    public class UserService : IUserService
    {
        SqlConnection conn;
        SqlCommand cmd;

        void initDb()
        {
            conn = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SOC;Integrated Security=True");
            cmd = new SqlCommand();
            cmd.Connection = conn;
        }

        public User Login(string username,string password)
        {
            initDb();
            cmd.CommandText = "SELECT * FROM [User] WHERE username=@Username AND password=@Password";
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);
            User logged_in_user = new User();
            //logged_in_user.Username = "-";
            // Error handling left

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                logged_in_user.UserId = dr.GetInt32(0);
                logged_in_user.Username = dr.GetString(1);
                logged_in_user.Password = dr.GetString(2);
                logged_in_user.Email = dr.GetString(3);
                logged_in_user.Address = dr.GetString(4);
                logged_in_user.Name = dr.GetString(5);
                logged_in_user.ContactNo = dr.GetString(6);

            }
            dr.Close();
            conn.Close();
            return logged_in_user;
        }
        public int Signup(User user)
        {
            initDb();
            cmd.CommandText = "INSERT INTO [User] values(@Username,@Password,@Email,@Name,@Address,@ContactNo)";
            cmd.Parameters.AddWithValue("@Username", user.Username);
            cmd.Parameters.AddWithValue("@Password", user.Password);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@Name", user.Name);
            cmd.Parameters.AddWithValue("@Address", user.Address);
            cmd.Parameters.AddWithValue("@ContactNo", user.ContactNo);
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch(System.Data.SqlClient.SqlException e)
            {
                conn.Close();
                return 0;
            }
            conn.Close();
            return 1;                
        }

        public int Update(User user)
        {
            initDb();
            cmd.CommandText = "UPDATE [User] SET username = @Username,email = @Email, name = @Name,address = @Address,contactNo = @ContactNo  WHERE userId = @userId";
            cmd.Parameters.AddWithValue("@Username", user.Username);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@Name", user.Name);
            cmd.Parameters.AddWithValue("@Address", user.Address);
            cmd.Parameters.AddWithValue("@ContactNo", user.ContactNo);
            cmd.Parameters.AddWithValue("@userId", user.UserId);
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                conn.Close();
                return 0;
            }
            conn.Close();
            return 1;
        }
    }
}
