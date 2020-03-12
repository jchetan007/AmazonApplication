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
    [Table("PromoCodes",Schema="dbo")]
    public partial class PromoCode
    {
		#region PromoCodeId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PromoCodeId Annotations

        public int PromoCodeId { get; set; }

		#region PromoCodeName Annotations

        [Required]
        [MaxLength(50)]
		#endregion PromoCodeName Annotations

        public string PromoCodeName { get; set; }

		#region Amount Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion Amount Annotations

        public int Amount { get; set; }

		#region ValidFrom Annotations

        [Required]
		#endregion ValidFrom Annotations

        public System.DateTimeOffset ValidFrom { get; set; }

		#region ValidTill Annotations

        [Required]
		#endregion ValidTill Annotations

        public System.DateTimeOffset ValidTill { get; set; }

		#region Payments Annotations

        [InverseProperty("PromoCode")]
		#endregion Payments Annotations

        public virtual ICollection<Payment> Payments { get; set; }


        public PromoCode()
        {
			Payments = new HashSet<Payment>();
        }
	}
}