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
    [Table("Materials",Schema="dbo")]
    public partial class Material
    {
		#region MaterialId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion MaterialId Annotations

        public int MaterialId { get; set; }

		#region MaterialType Annotations

        [Required]
        [MaxLength(20)]
		#endregion MaterialType Annotations

        public string MaterialType { get; set; }

		#region Sellers Annotations

        [InverseProperty("Material")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public Material()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}