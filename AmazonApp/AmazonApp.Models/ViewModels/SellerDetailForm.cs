using System;
using System.Collections.Generic;
using System.Text;

namespace AmazonApp.Models.ViewModels
{
    public class SellerDetailForm
    {
        
        public int AppUserId { get; set; }

        public string CompanyName { get; set; }

        public string Address { get; set; }

        public string PanNumber { get; set; }

        public string Area { get; set; }

        public string Landmark { get; set; }

        public string City { get; set; }

        public string State { get; set; }
        public string AddressType { get; set; }

        public string AccountHolderName { get; set; }

        public string AccountType { get; set; }

        public string AccountNumber { get; set; }
    }
}
