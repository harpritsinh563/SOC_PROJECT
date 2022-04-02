using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentManagement_WebClient.UserService;

namespace DocumentManagement_WebClient
{
    public partial class Login : System.Web.UI.Page
    {
        UserService.UserServiceClient proxy;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["loggedout"]) == 1)
            {
                User_Action.ForeColor = System.Drawing.Color.Green;
                User_Action.Text = "Successfully logged out";
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            proxy = new UserService.UserServiceClient("BasicHttpBinding_IUserService");
            UserService.User fetched_user  = proxy.Login(Username.Text,Password.Text);
            if (fetched_user.Username == "-")
                status.Text = "Login Failed.Please Enter Correct Credentials";
            else
            {
                Session["username"] = fetched_user.Username;
                Session["email"] = fetched_user.Email;
                Session["name"] = fetched_user.Name; 
                Session["address"] = fetched_user.Address;
                Session["contact"] = fetched_user.ContactNo;
                Session["userId"]= fetched_user.UserId;
                Response.Redirect("~/home.aspx");
            }
            //int login_succesful = client.Login(Username.Text, Password.Text);
            //if (login_succesful == 1)
            //    status.Text = "Logged in Successfully";
            //else
            //    status.Text = "Login Failed.Please Enter Correct Credentials";
        }
    }
}