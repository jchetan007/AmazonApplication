using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vCartItems",Schema="dbo")]
    public partial class vCartItem
    {
		#region SellerId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion SellerId Annotations

        public int SellerId { get; set; }


        public int CartItemId { get; set; }


        public string ProductName { get; set; }


        public long OriginalProductPrice { get; set; }


        public Nullable<long> DiscountProductPrice { get; set; }


        public int ProductQuantity { get; set; }


        public Nullable<int> TotalPrice { get; set; }


        public int CartValue { get; set; }


        public Nullable<int> CartQuantity { get; set; }


        public int ProductId { get; set; }


        public int CartId { get; set; }


        public vCartItem()
        {
        }
	}
}