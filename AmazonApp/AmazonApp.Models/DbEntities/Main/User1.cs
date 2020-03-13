using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.Models.Enums.Main;
using AmazonApp.BoundedContext.SqlContext;

namespace AmazonApp.Models.Main
{
    public partial class AppUser1
    {
        public int AppUserId { get; set; }
        public string AppUserName { get; set; }
        public string MobileNumber { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public System.DateTimeOffset CreatedDate { get; set; }
        public int RoleId { get; set; }
       
        
       
    }
}
