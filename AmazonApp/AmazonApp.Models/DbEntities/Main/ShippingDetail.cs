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
    [Table("ShippingDetails",Schema="dbo")]
    public partial class ShippingDetail
    {
		#region ShippingDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ShippingDetailId Annotations

        public int ShippingDetailId { get; set; }

		#region CompanyName Annotations

        [Required]
        [MaxLength(50)]
		#endregion CompanyName Annotations

        public string CompanyName { get; set; }

		#region ShippingDate Annotations

        [Required]
		#endregion ShippingDate Annotations

        public System.DateTimeOffset ShippingDate { get; set; }

		#region SellerId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Sellers","dbo","","SellerId")]
		#endregion SellerId Annotations

        public int SellerId { get; set; }

		#region Seller Annotations

        [ForeignKey(nameof(SellerId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Seller.ShippingDetails))]
		#endregion Seller Annotations

        public virtual Seller Seller { get; set; }


        public ShippingDetail()
        {
        }
	}
}