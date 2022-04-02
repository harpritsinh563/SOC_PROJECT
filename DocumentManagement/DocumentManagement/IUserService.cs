using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using DocumentManagement.Models;

namespace DocumentManagement
{
    [ServiceContract]
    public interface IUserService
    {
        [OperationContract]
        int Signup(User user);

        [OperationContract]
        User Login(string username,string password);

        [OperationContract]
        int Update(User user);
    }
}
