using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeLinkMVC.Models
{
    public class UserModel
    {
        public Guid Id { get; set; }
        public String FName { get; set; }
        public String LName { get; set; }
        public String Email { get; set; }
        public String Address { get; set; }
        public String City { get; set; }

        public String State { get; set; }
        public int ZIP { get; set; }
        

    }
}
