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
    [Table("ProductMainCategories",Schema="dbo")]
    public partial class ProductMainCategory
    {
		#region ProductMainCategoryId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProductMainCategoryId Annotations

        public int ProductMainCategoryId { get; set; }

		#region ProductMainCategoryName Annotations

        [Required]
        [MaxLength(50)]
		#endregion ProductMainCategoryName Annotations

        public string ProductMainCategoryName { get; set; }

		#region Sellers Annotations

        [InverseProperty("ProductMainCategory")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }

		#region ProductCategories Annotations

        [InverseProperty("ProductMainCategory")]
		#endregion ProductCategories Annotations

        public virtual ICollection<ProductCategory> ProductCategories { get; set; }


        public ProductMainCategory()
        {
			Sellers = new HashSet<Seller>();
			ProductCategories = new HashSet<ProductCategory>();
        }
	}
}