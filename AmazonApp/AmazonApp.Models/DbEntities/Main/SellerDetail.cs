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
    [Table("SellerDetails",Schema="dbo")]
    public partial class SellerDetail
    {
		#region SellerDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion SellerDetailId Annotations

        public int SellerDetailId { get; set; }

		#region CompanyName Annotations

        [Required]
        [MaxLength(50)]
		#endregion CompanyName Annotations

        public string CompanyName { get; set; }

		#region Address Annotations

        [Required]
        [MaxLength(50)]
		#endregion Address Annotations

        public string Address { get; set; }

		#region PanNumber Annotations

        [Required]
        [MaxLength(10)]
		#endregion PanNumber Annotations

        public string PanNumber { get; set; }


        public Nullable<int> ShippingFeeDetailId { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region Sellers Annotations

        [InverseProperty("SellerDetail")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public SellerDetail()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}