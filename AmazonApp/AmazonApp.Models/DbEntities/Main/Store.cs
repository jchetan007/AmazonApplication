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
    [Table("Stores",Schema="dbo")]
    public partial class Store
    {
		#region StoreId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion StoreId Annotations

        public int StoreId { get; set; }

		#region StoreName Annotations

        [Required]
        [MaxLength(50)]
		#endregion StoreName Annotations

        public string StoreName { get; set; }

		#region TaxDetails Annotations

        [Required]
        [MaxLength(50)]
		#endregion TaxDetails Annotations

        public string TaxDetails { get; set; }

		#region Gst Annotations

        [Required]
        [MaxLength(50)]
		#endregion Gst Annotations

        public string Gst { get; set; }


        public byte[] Signature { get; set; }

		#region CreatedDate Annotations

        [Required]
		#endregion CreatedDate Annotations

        public System.DateTimeOffset CreatedDate { get; set; }

		#region ProductCategories Annotations

        [InverseProperty("Store")]
		#endregion ProductCategories Annotations

        public virtual ICollection<ProductCategory> ProductCategories { get; set; }


        public Store()
        {
			ProductCategories = new HashSet<ProductCategory>();
        }
	}
}