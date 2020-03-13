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
    [Table("OrderDetails",Schema="dbo")]
    public partial class OrderDetail
    {
		#region OrderDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion OrderDetailId Annotations

        public int OrderDetailId { get; set; }

		#region ExpectedDate Annotations

        [Required]
		#endregion ExpectedDate Annotations

        public System.DateTimeOffset ExpectedDate { get; set; }

		#region ShippingFeeDetailId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("ShippingFeeDetails","dbo","","ShippingFeeDetailId")]
		#endregion ShippingFeeDetailId Annotations

        public int ShippingFeeDetailId { get; set; }

		#region OrderId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Orders","dbo","","OrderId")]
		#endregion OrderId Annotations

        public int OrderId { get; set; }

		#region Order Annotations

        [ForeignKey(nameof(OrderId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Order.OrderDetails))]
		#endregion Order Annotations

        public virtual Order Order { get; set; }

		#region ShippingFeeDetail Annotations

        [ForeignKey(nameof(ShippingFeeDetailId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.ShippingFeeDetail.OrderDetails))]
		#endregion ShippingFeeDetail Annotations

        public virtual ShippingFeeDetail ShippingFeeDetail { get; set; }


        public OrderDetail()
        {
        }
	}
}