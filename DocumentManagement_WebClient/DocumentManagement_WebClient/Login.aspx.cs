﻿using System;
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


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            proxy = new UserService.UserServiceClient("BasicHttpBinding_IUserService");
            UserService.User fetched_user  = proxy.Login(Username.Text,Password.Text);
            status.Text = fetched_user.Username;
            //int login_succesful = client.Login(Username.Text, Password.Text);
            //if (login_succesful == 1)
            //    status.Text = "Logged in Successfully";
            //else
            //    status.Text = "Login Failed.Please Enter Correct Credentials";
        }
    }
}