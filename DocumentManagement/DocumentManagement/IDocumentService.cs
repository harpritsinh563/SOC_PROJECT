using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using DocumentManagement.Models;
using System.Data;

namespace DocumentManagement
{
    [ServiceContract]
    public interface IDocumentService
    {
        [OperationContract]
        int AddDocument(Document doc);

        [OperationContract]
        string RemoveDocument(int docId);

        [OperationContract]
        Document GetDocument(int docId);

        //[OperationContract]
        //Document EditDocument(Document doc);

        [OperationContract]
        DataSet GetDocumentsOfUser(int userId);


    }
}
