using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vDiscounts",Schema="dbo")]
    public partial class vDiscount
    {
		#region DiscountPrice Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion DiscountPrice Annotations

        public int DiscountPrice { get; set; }


        public int ProductCategoryId { get; set; }


        public long ProductPrice { get; set; }


        public vDiscount()
        {
        }
	}
}