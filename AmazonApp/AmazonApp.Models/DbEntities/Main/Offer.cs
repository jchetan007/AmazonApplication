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
    [Table("Offers",Schema="dbo")]
    public partial class Offer
    {
		#region OfferId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion OfferId Annotations

        public int OfferId { get; set; }

		#region ProductId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Products","dbo","","ProductId")]
		#endregion ProductId Annotations

        public int ProductId { get; set; }

		#region OfferPercentage Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion OfferPercentage Annotations

        public int OfferPercentage { get; set; }

		#region DiscountId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Discounts","dbo","","DiscountId")]
		#endregion DiscountId Annotations

        public int DiscountId { get; set; }

		#region Discount Annotations

        [ForeignKey(nameof(DiscountId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Discount.Offers))]
		#endregion Discount Annotations

        public virtual Discount Discount { get; set; }

		#region Product Annotations

        [ForeignKey(nameof(ProductId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Product.Offers))]
		#endregion Product Annotations

        public virtual Product Product { get; set; }

		#region Advertisements Annotations

        [InverseProperty("Offer")]
		#endregion Advertisements Annotations

        public virtual ICollection<Advertisement> Advertisements { get; set; }


        public Offer()
        {
			Advertisements = new HashSet<Advertisement>();
        }
	}
}