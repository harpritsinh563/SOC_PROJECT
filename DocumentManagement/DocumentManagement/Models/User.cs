using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace DocumentManagement.Models
{
    [DataContract]
    public class User
    {
        private int userId;
        private string username="-";
        private string password;
        private string email;
        private string name;
        private string contactNo;
        private string address;

        [DataMember]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        [DataMember]
        public string ContactNo
        {
            get { return contactNo; }
            set { contactNo = value; }
        }
        [DataMember]
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        [DataMember]
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        [DataMember]
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        [DataMember]
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        [DataMember]
        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
    }
}
