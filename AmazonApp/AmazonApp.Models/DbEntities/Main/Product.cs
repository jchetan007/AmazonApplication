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
    [Table("Products",Schema="dbo")]
    public partial class Product
    {
		#region ProductId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductId Annotations

        public int ProductId { get; set; }

		#region ProductSubCategoryId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("ProductSubCategories","dbo","","ProductSubCategoryId")]
		#endregion ProductSubCategoryId Annotations

        public int ProductSubCategoryId { get; set; }

		#region SellerId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Sellers","dbo","","SellerId")]
		#endregion SellerId Annotations

        public int SellerId { get; set; }

		#region ProductSubCategory Annotations

        [ForeignKey(nameof(ProductSubCategoryId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.ProductSubCategory.Products))]
		#endregion ProductSubCategory Annotations

        public virtual ProductSubCategory ProductSubCategory { get; set; }

		#region Seller Annotations

        [ForeignKey(nameof(SellerId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Seller.Products))]
		#endregion Seller Annotations

        public virtual Seller Seller { get; set; }

		#region CartItems Annotations

        [InverseProperty("Product")]
		#endregion CartItems Annotations

        public virtual ICollection<CartItem> CartItems { get; set; }

		#region Offers Annotations

        [InverseProperty("Product")]
		#endregion Offers Annotations

        public virtual ICollection<Offer> Offers { get; set; }

		#region FeedBacks Annotations

        [InverseProperty("Product")]
		#endregion FeedBacks Annotations

        public virtual ICollection<FeedBack> FeedBacks { get; set; }


        public Product()
        {
			CartItems = new HashSet<CartItem>();
			Offers = new HashSet<Offer>();
			FeedBacks = new HashSet<FeedBack>();
        }
	}
}