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

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region PromoCodeId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("PromoCodes","dbo","","PromoCodeId")]
		#endregion PromoCodeId Annotations

        public int PromoCodeId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.Orders))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region PromoCode Annotations

        [ForeignKey(nameof(PromoCodeId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.PromoCode.Orders))]
		#endregion PromoCode Annotations

        public virtual PromoCode PromoCode { get; set; }

		#region OrderDetails Annotations

        [InverseProperty("Order")]
		#endregion OrderDetails Annotations

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

		#region Payments Annotations

        [InverseProperty("Order")]
		#endregion Payments Annotations

        public virtual ICollection<Payment> Payments { get; set; }


        public Order()
        {
			OrderDetails = new HashSet<OrderDetail>();
			Payments = new HashSet<Payment>();
        }
	}
}