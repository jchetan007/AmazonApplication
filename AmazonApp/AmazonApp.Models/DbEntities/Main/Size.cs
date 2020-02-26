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
    [Table("Sizes",Schema="dbo")]
    public partial class Size
    {
		#region SizeId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion SizeId Annotations

        public int SizeId { get; set; }

		#region SizeType Annotations

        [Required]
        [MaxLength(20)]
		#endregion SizeType Annotations

        public string SizeType { get; set; }

		#region Sellers Annotations

        [InverseProperty("Size")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public Size()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}