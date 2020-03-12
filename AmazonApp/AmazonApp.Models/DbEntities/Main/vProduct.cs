using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vProducts",Schema="dbo")]
    public partial class vProduct
    {
		#region ProductId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductId Annotations

        public int ProductId { get; set; }


        public string ProductName { get; set; }


        public long OriginalProductPrice { get; set; }


        public long DiscountProductPrice { get; set; }


        public int AppUserId { get; set; }


        public int ProductSubCategoryId { get; set; }


        public vProduct()
        {
        }
	}
}