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
    [Table("ProductSubCategories",Schema="dbo")]
    public partial class ProductSubCategory
    {
		#region ProductSubCategoryId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductSubCategoryId Annotations

        public int ProductSubCategoryId { get; set; }

		#region ProductSubCategoryName Annotations

        [Required]
        [MaxLength(50)]
		#endregion ProductSubCategoryName Annotations

        public string ProductSubCategoryName { get; set; }

		#region ProductCategoryId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("ProductCategories","dbo","","ProductCategoryId")]
		#endregion ProductCategoryId Annotations

        public int ProductCategoryId { get; set; }

		#region ProductCategory Annotations

        [ForeignKey(nameof(ProductCategoryId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.ProductCategory.ProductSubCategories))]
		#endregion ProductCategory Annotations

        public virtual ProductCategory ProductCategory { get; set; }

		#region Products Annotations

        [InverseProperty("ProductSubCategory")]
		#endregion Products Annotations

        public virtual ICollection<Product> Products { get; set; }


        public ProductSubCategory()
        {
			Products = new HashSet<Product>();
        }
	}
}