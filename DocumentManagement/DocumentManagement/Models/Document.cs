using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using System.Runtime.Serialization;




namespace DocumentManagement.Models
{
    [DataContract]
    public class Document
    {

        private int documentId;
        private int userId;
        private string documentType;
        private string documentPath;
        
        [DataMember]
        public int DocumentId
        {
            get { return documentId; }
            set { documentId = value; }
        }
        [DataMember]
        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        [DataMember]
        public string DocumentType
        {
            get { return documentType; }
            set { documentType = value; }
        }
        [DataMember]
        public string DocumentPath
        {
            get { return documentPath; }
            set { documentPath = value; }
        }

    }
}
