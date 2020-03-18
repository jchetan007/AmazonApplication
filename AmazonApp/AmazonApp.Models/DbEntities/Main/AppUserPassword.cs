using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace AmazonApp.Models.Main
{
    public partial class AppUser
    {
        [NotMapped]
        public string userPassword { get; set; }
        [NotMapped]
        public string token { get; set; }

    }
}
