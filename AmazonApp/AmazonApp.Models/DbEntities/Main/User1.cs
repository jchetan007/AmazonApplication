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
    public partial class AppUser
    {
        [NotMapped]
        public string UserPassword { get; set; }
    }
}
