using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentManagement_WebClient.UserService;

namespace DocumentManagement_WebClient
{
    public partial class EditUser : System.Web.UI.Page
    {
        UserServiceClient proxy;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                Username.Text = Session["username"].ToString();
                Name.Text = Session["name"].ToString();
                Email.Text = Session["email"].ToString();
                Contact.Text = Session["contact"].ToString();
                Address.Text = Session["address"].ToString();
                Contact.Text = Session["contact"].ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            proxy = new UserServiceClient("BasicHttpBinding_IUserService");
            UserService.User new_user = new User();
            new_user.Username = Username.Text;
            new_user.Email = Email.Text;
            new_user.Name = Name.Text;
            new_user.Address = Address.Text;
            new_user.ContactNo = Contact.Text;
            new_user.UserId = Convert.ToInt32(Session["userId"]);
            Status.Text = Session["userId"].ToString();
            int update_success = proxy.Update(new_user);
            //Status.Text = signup_success.ToString();    
            if (update_success == 1)
            {
                Session["username"] = new_user.Username;
                Session["email"] = new_user.Email;
                Session["name"] = new_user.Name;
                Session["address"] = new_user.Address;
                Session["contact"] = new_user.ContactNo;
                Session["userId"] = new_user.UserId;
                Response.Redirect("~/Home.aspx?updated=1");
            }
            else
                Status.Text = "Update Failed";



        }

        protected void Contact_TextChanged(object sender, EventArgs e)
        {
            Contact.Text = Contact.Text;
        }

        protected void Name_TextChanged(object sender, EventArgs e)
        {
            Name.Text = Name.Text;
        }

        protected void Address_TextChanged(object sender, EventArgs e)
        {
            Address.Text = Address.Text;
        }

        protected void Email_TextChanged(object sender, EventArgs e)
        {
            Email.Text = Email.Text;
        }

        protected void Username_TextChanged(object sender, EventArgs e)
        {
            Username.Text = Username.Text;
        }
    }
}