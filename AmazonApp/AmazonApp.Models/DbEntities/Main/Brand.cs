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
    [Table("Brands",Schema="dbo")]
    public partial class Brand
    {
		#region BrandId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion BrandId Annotations

        public int BrandId { get; set; }

		#region BrandName Annotations

        [Required]
        [MaxLength(20)]
		#endregion BrandName Annotations

        public string BrandName { get; set; }

		#region Sellers Annotations

        [InverseProperty("Brand")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public Brand()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}