using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vProductCategoryLookups",Schema="dbo")]
    public partial class vProductCategoryLookup
    {

        public string ProductCategoryName { get; set; }


        public vProductCategoryLookup()
        {
        }
	}
}