using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentManagement_WebClient.DocumentServiceReference;

namespace DocumentManagement_WebClient
{
    public partial class AddDocument : System.Web.UI.Page
    {
        DocumentServiceClient proxy;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HandleAdd(object sender, EventArgs e)
        {
            proxy = new DocumentServiceClient("BasicHttpBinding_IDocumentService");
            Document newdoc = new Document();
            string fname = documentFile.FileName;
            string flocation = "DocumentFiles/";
            string pathstring = System.IO.Path.Combine(flocation,fname);
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
        }
    }
}