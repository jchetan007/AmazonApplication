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
    [Table("ProductCategories",Schema="dbo")]
    public partial class ProductCategory
    {
		#region ProductCategoryId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductCategoryId Annotations

        public int ProductCategoryId { get; set; }

		#region ProductCategoryName Annotations

        [Required]
        [MaxLength(50)]
		#endregion ProductCategoryName Annotations

        public string ProductCategoryName { get; set; }

		#region StoreId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Stores","dbo","","StoreId")]
		#endregion StoreId Annotations

        public int StoreId { get; set; }

		#region ProductMainCategoryId Annotations

        [RelationshipTableAttribue("ProductMainCategories","dbo","","ProductMainCategoryId")]
		#endregion ProductMainCategoryId Annotations

        public Nullable<int> ProductMainCategoryId { get; set; }

		#region ProductMainCategory Annotations

        [ForeignKey(nameof(ProductMainCategoryId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.ProductMainCategory.ProductCategories))]
		#endregion ProductMainCategory Annotations

        public virtual ProductMainCategory ProductMainCategory { get; set; }

		#region Store Annotations

        [ForeignKey(nameof(StoreId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Store.ProductCategories))]
		#endregion Store Annotations

        public virtual Store Store { get; set; }

		#region ProductSubCategories Annotations

        [InverseProperty("ProductCategory")]
		#endregion ProductSubCategories Annotations

        public virtual ICollection<ProductSubCategory> ProductSubCategories { get; set; }

		#region Discounts Annotations

        [InverseProperty("ProductCategory")]
		#endregion Discounts Annotations

        public virtual ICollection<Discount> Discounts { get; set; }


        public ProductCategory()
        {
			ProductSubCategories = new HashSet<ProductSubCategory>();
			Discounts = new HashSet<Discount>();
        }
	}
}