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
    [Table("Colors",Schema="dbo")]
    public partial class Color
    {
		#region ColorId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ColorId Annotations

        public int ColorId { get; set; }

		#region ColorName Annotations

        [Required]
        [MaxLength(20)]
		#endregion ColorName Annotations

        public string ColorName { get; set; }

		#region Sellers Annotations

        [InverseProperty("Color")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public Color()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}