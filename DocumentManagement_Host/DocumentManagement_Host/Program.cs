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
            Uri http = new Uri("http://localhost:8000/UserService");
            ServiceHost user_host = new ServiceHost(typeof(DocumentManagement.UserService),http);
            user_host.Open();
            Console.WriteLine("Host Running");
            Console.ReadLine();                
        }
    }
}
