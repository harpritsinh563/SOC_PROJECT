using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;


namespace DocumentManagement_Host
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Running1");
            Uri http_user = new Uri("http://localhost:8000/UserService");
            Uri http_document = new Uri("http://localhost:8000/DocumentService");
            ServiceHost user_host = new ServiceHost(typeof(DocumentManagement.UserService), http_user);
            ServiceHost document_host = new ServiceHost(typeof(DocumentManagement.DocumentService), http_document);

            user_host.Open();
            document_host.Open();
            Console.WriteLine("Host Running");
            Console.ReadLine();                
        }
    }
}
