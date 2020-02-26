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
    [Table("Discounts",Schema="dbo")]
    public partial class Discount
    {
		#region DiscountId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion DiscountId Annotations

        public int DiscountId { get; set; }

		#region SellerId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Sellers","dbo","","SellerId")]
		#endregion SellerId Annotations

        public int SellerId { get; set; }

		#region ProductId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ProductId Annotations

        public int ProductId { get; set; }

		#region ValidityFrom Annotations

        [Required]
		#endregion ValidityFrom Annotations

        public System.DateTimeOffset ValidityFrom { get; set; }

		#region ValidityTill Annotations

        [Required]
		#endregion ValidityTill Annotations

        public System.DateTimeOffset ValidityTill { get; set; }

		#region DiscountPrice Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion DiscountPrice Annotations

        public int DiscountPrice { get; set; }

		#region ProductCategoryId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("ProductCategories","dbo","","ProductCategoryId")]
		#endregion ProductCategoryId Annotations

        public int ProductCategoryId { get; set; }

		#region ProductCategory Annotations

        [ForeignKey(nameof(ProductCategoryId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.ProductCategory.Discounts))]
		#endregion ProductCategory Annotations

        public virtual ProductCategory ProductCategory { get; set; }

		#region Seller Annotations

        [ForeignKey(nameof(SellerId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Seller.Discounts))]
		#endregion Seller Annotations

        public virtual Seller Seller { get; set; }

		#region Offers Annotations

        [InverseProperty("Discount")]
		#endregion Offers Annotations

        public virtual ICollection<Offer> Offers { get; set; }


        public Discount()
        {
			Offers = new HashSet<Offer>();
        }
	}
}