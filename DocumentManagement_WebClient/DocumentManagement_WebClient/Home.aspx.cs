using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocumentManagement_WebClient.DocumentServiceReference;
using System.Net;
using System.IO;

namespace DocumentManagement_WebClient
{
    public partial class Home1 : System.Web.UI.Page
    {
        DocumentServiceClient proxy;

        void FetchDocs()
        {
            proxy = new DocumentServiceClient("BasicHttpBinding_IDocumentService");
            DataSet ds = new DataSet();
            ds = proxy.GetDocumentsOfUser(Convert.ToInt32(Session["userId"])); 
            UserDocs.DataSource = ds.Tables[0];
            UserDocs.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["updated"]) == 1)
            {
                User_Action.ForeColor = System.Drawing.Color.Green;
                User_Action.Text = "Successfully updated profile";
            }
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            FetchDocs();
            
        }
        protected void HandleDelete(object sender,EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int docId = Convert.ToInt32(btn.CommandArgument);
            DocumentServiceClient proxy = new DocumentServiceClient("BasicHttpBinding_IDocumentService");
            string deleted_file_name = proxy.RemoveDocument(docId);
            string path = MapPath(deleted_file_name);
            FileInfo file_to_delete = new FileInfo(path);

            if(file_to_delete.Exists)
            {
                file_to_delete.Delete();
            }
            FetchDocs();
        }
        protected void HandleAdd(object sender, EventArgs e)
        {
            proxy = new DocumentServiceClient("BasicHttpBinding_IDocumentService");
            Document newdoc = new Document();
            if (documentFile.HasFile)
            {
                Guid unique_identifier = Guid.NewGuid();
                string fname = document_type.Text + "_" + Session["username"].ToString() + "_"+unique_identifier.ToString();
                string flocation = "DocumentFiles/";
                string pathstring = System.IO.Path.Combine(flocation, fname);
                newdoc.DocumentPath = pathstring;
                newdoc.DocumentType = document_type.SelectedValue.ToString();
                newdoc.UserId = Convert.ToInt32(Session["userId"]);
                Status.Text = pathstring;
                int added = proxy.AddDocument(newdoc);
                if (added == 1)
                {
                    Status.ForeColor = System.Drawing.Color.Green;
                    Status.Text = "Successfully Added";
                    documentFile.SaveAs(MapPath(pathstring));
                }
                else
                {
                    Status.ForeColor = System.Drawing.Color.Red;
                    Status.Text = "Failed to Add Document";
                }
            }
            else
            {
                Status.ForeColor = System.Drawing.Color.Red;
                Status.Text = "Please upload a file";
            }
            FetchDocs();
        }

        protected void OpenFile_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            btn.Attributes.Add("target", "_blank");
            string filelocation = btn.CommandArgument;
            string filepath = Server.MapPath("~/" + filelocation);
            WebClient User = new WebClient();
            Byte[] Filebuffer = User.DownloadData(filepath);
            if(Filebuffer!=null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", Filebuffer.Length.ToString());
                Response.BinaryWrite(Filebuffer);
            }
 
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx?loggedout=1");
        }
    }
}