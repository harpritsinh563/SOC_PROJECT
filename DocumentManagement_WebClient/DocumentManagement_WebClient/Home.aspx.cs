using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocumentManagement_WebClient.DocumentServiceReference;
using System.Net;

namespace DocumentManagement_WebClient
{
    public partial class Home1 : System.Web.UI.Page
    {
        DocumentServiceClient proxy;

        void FetchDocs()
        {
            proxy = new DocumentServiceClient("BasicHttpBinding_IDocumentService");
            DataSet ds = new DataSet();
            ds = proxy.GetDocumentsOfUser(1);   // User Id hardcoded for now later on fetch it from session
            UserDocs.DataSource = ds.Tables[0];
            UserDocs.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            FetchDocs();
           
        }
        protected void HandleAdd(object sender, EventArgs e)
        {
            proxy = new DocumentServiceClient("BasicHttpBinding_IDocumentService");
            Document newdoc = new Document();
            string fname = documentFile.FileName;
            string flocation = "DocumentFiles/";
            string pathstring = System.IO.Path.Combine(flocation, fname);
            newdoc.DocumentPath = pathstring;
            newdoc.DocumentType = document_type.SelectedValue.ToString();

            newdoc.UserId = 1;  // Hardcoded for testing for now later fetch it from session
            int added = proxy.AddDocument(newdoc);
            if (added == 1)
            {
                Status.Text = "Successfully Added";
                documentFile.SaveAs(MapPath(pathstring));
            }
            else
                Status.Text = "Failed to Add Document";
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
    }
}