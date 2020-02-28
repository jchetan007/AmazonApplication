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

		#region ProductCategoryId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductCategoryId Annotations

        public int ProductCategoryId { get; set; }


        public vProductCategoryLookup()
        {
        }
	}
}