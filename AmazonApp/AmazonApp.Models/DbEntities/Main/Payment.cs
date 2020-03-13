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
    [Table("Payments",Schema="dbo")]
    public partial class Payment
    {
		#region PaymentId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PaymentId Annotations

        public int PaymentId { get; set; }

		#region Amount Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion Amount Annotations

        public int Amount { get; set; }

		#region PaymentDate Annotations

        [Required]
		#endregion PaymentDate Annotations

        public System.DateTimeOffset PaymentDate { get; set; }

		#region PromoCodeId Annotations

        [RelationshipTableAttribue("PromoCodes","dbo","","PromoCodeId")]
		#endregion PromoCodeId Annotations

        public Nullable<int> PromoCodeId { get; set; }

		#region AppUserId Annotations

        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public Nullable<int> AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.Payments))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region PromoCode Annotations

        [ForeignKey(nameof(PromoCodeId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.PromoCode.Payments))]
		#endregion PromoCode Annotations

        public virtual PromoCode PromoCode { get; set; }

		#region Invoices Annotations

        [InverseProperty("Payment")]
		#endregion Invoices Annotations

        public virtual ICollection<Invoice> Invoices { get; set; }


        public Payment()
        {
			Invoices = new HashSet<Invoice>();
        }
	}
}