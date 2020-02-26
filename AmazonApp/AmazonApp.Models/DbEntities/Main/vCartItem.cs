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

        public string ProductName { get; set; }


        public long ProductPrice { get; set; }

		#region ProductQuantity Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductQuantity Annotations

        public int ProductQuantity { get; set; }


        public int CartValue { get; set; }


        public vCartItem()
        {
        }
	}
}