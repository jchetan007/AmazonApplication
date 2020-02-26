using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vLanguages",Schema="dbo")]
    public partial class vLanguage
    {

        public string ProductName { get; set; }


        public string LanguageName { get; set; }


        public vLanguage()
        {
        }
	}
}