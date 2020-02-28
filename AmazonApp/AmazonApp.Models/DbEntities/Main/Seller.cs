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
    [Table("Sellers",Schema="dbo")]
    public partial class Seller
    {
		#region SellerId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion SellerId Annotations

        public int SellerId { get; set; }

		#region ProductName Annotations

        [Required]
        [MaxLength(50)]
		#endregion ProductName Annotations

        public string ProductName { get; set; }

		#region OriginalProductPrice Annotations

        [Required]
		#endregion OriginalProductPrice Annotations

        public long OriginalProductPrice { get; set; }

		#region SellerDetailId Annotations

        [Range(1, int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("SellerDetails","dbo","","SellerDetailId")]
		#endregion SellerDetailId Annotations

        public int SellerDetailId { get; set; }

		#region ApplicationObjectId Annotations

        [Range(1, int.MaxValue)]
        [Required]
		#endregion ApplicationObjectId Annotations

        public ApplicationObject ApplicationObjectId { get; set; }

		#region BrandId Annotations

        [RelationshipTableAttribue("Brands","dbo","","BrandId")]
		#endregion BrandId Annotations

        public Nullable<int> BrandId { get; set; }

		#region SizeId Annotations

        [RelationshipTableAttribue("Sizes","dbo","","SizeId")]
		#endregion SizeId Annotations

        public Nullable<int> SizeId { get; set; }

		#region MaterialId Annotations

        [RelationshipTableAttribue("Materials","dbo","","MaterialId")]
		#endregion MaterialId Annotations

        public Nullable<int> MaterialId { get; set; }

		#region ColorId Annotations

        [RelationshipTableAttribue("Colors","dbo","","ColorId")]
		#endregion ColorId Annotations

        public Nullable<int> ColorId { get; set; }

		#region LanguageId Annotations

        [RelationshipTableAttribue("Languages","dbo","","LanguageId")]
		#endregion LanguageId Annotations

        public Nullable<int> LanguageId { get; set; }


        public int RoleId { get; set; }

		#region BankDetailId Annotations

        [RelationshipTableAttribue("BankDetails","dbo","","BankDetailId")]
		#endregion BankDetailId Annotations

        public Nullable<int> BankDetailId { get; set; }


        public Nullable<long> DiscountProductPrice { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(RoleId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.Sellers))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region BankDetail Annotations

        [ForeignKey(nameof(BankDetailId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.BankDetail.Sellers))]
		#endregion BankDetail Annotations

        public virtual BankDetail BankDetail { get; set; }

		#region Brand Annotations

        [ForeignKey(nameof(BrandId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Brand.Sellers))]
		#endregion Brand Annotations

        public virtual Brand Brand { get; set; }

		#region Color Annotations

        [ForeignKey(nameof(ColorId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Color.Sellers))]
		#endregion Color Annotations

        public virtual Color Color { get; set; }

		#region Language Annotations

        [ForeignKey(nameof(LanguageId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Language.Sellers))]
		#endregion Language Annotations

        public virtual Language Language { get; set; }

		#region Material Annotations

        [ForeignKey(nameof(MaterialId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Material.Sellers))]
		#endregion Material Annotations

        public virtual Material Material { get; set; }

		#region Role Annotations

        [ForeignKey(nameof(RoleId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Role.Sellers))]
		#endregion Role Annotations

        public virtual Role Role { get; set; }

		#region SellerDetail Annotations

        [ForeignKey(nameof(SellerDetailId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.SellerDetail.Sellers))]
		#endregion SellerDetail Annotations

        public virtual SellerDetail SellerDetail { get; set; }

		#region Size Annotations

        [ForeignKey(nameof(SizeId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Size.Sellers))]
		#endregion Size Annotations

        public virtual Size Size { get; set; }

		#region ShippingDetails Annotations

        [InverseProperty("Seller")]
		#endregion ShippingDetails Annotations

        public virtual ICollection<ShippingDetail> ShippingDetails { get; set; }

		#region Transactions Annotations

        [InverseProperty("Seller")]
		#endregion Transactions Annotations

        public virtual ICollection<Transaction> Transactions { get; set; }

		#region Discounts Annotations

        [InverseProperty("Seller")]
		#endregion Discounts Annotations

        public virtual ICollection<Discount> Discounts { get; set; }

		#region Products Annotations

        [InverseProperty("Seller")]
		#endregion Products Annotations

        public virtual ICollection<Product> Products { get; set; }


        public Seller()
        {
			ShippingDetails = new HashSet<ShippingDetail>();
			Transactions = new HashSet<Transaction>();
			Discounts = new HashSet<Discount>();
			Products = new HashSet<Product>();
        }
	}
}