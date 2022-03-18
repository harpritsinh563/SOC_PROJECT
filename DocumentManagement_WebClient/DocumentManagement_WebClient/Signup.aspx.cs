using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentManagement_WebClient.UserService;

namespace DocumentManagement_WebClient
{
    public partial class Signup : System.Web.UI.Page
    {
        UserServiceClient proxy;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            proxy= new UserServiceClient("BasicHttpBinding_IUserService");
            UserService.User new_user = new User();
            new_user.Username = Username.Text;
            new_user.Email = Email.Text;
            new_user.Password = Password.Text;
            int signup_success = proxy.Signup(new_user);
            if (signup_success == 1)
                Status.Text = "Signup Successful";
            else
                Status.Text = "Signup Failed";

            

        }
    }
}