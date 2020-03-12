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
    [Table("Orders",Schema="dbo")]
    public partial class Order
    {
		#region OrderId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion OrderId Annotations

        public int OrderId { get; set; }

		#region CreatedDate Annotations

        [Required]
		#endregion CreatedDate Annotations

        public System.DateTimeOffset CreatedDate { get; set; }

		#region PaymentId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Payments","dbo","","PaymentId")]
		#endregion PaymentId Annotations

        public int PaymentId { get; set; }

		#region Payment Annotations

        [ForeignKey(nameof(PaymentId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Payment.Orders))]
		#endregion Payment Annotations

        public virtual Payment Payment { get; set; }

		#region OrderDetails Annotations

        [InverseProperty("Order")]
		#endregion OrderDetails Annotations

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }


        public Order()
        {
			OrderDetails = new HashSet<OrderDetail>();
        }
	}
}