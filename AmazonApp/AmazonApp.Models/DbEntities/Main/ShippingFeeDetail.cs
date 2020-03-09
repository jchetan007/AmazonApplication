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
    [Table("ShippingFeeDetails",Schema="dbo")]
    public partial class ShippingFeeDetail
    {
		#region ShippingFeeDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ShippingFeeDetailId Annotations

        public int ShippingFeeDetailId { get; set; }

		#region LocalAmount Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion LocalAmount Annotations

        public int LocalAmount { get; set; }

		#region RegionalAmount Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion RegionalAmount Annotations

        public int RegionalAmount { get; set; }

		#region NationalAmount Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion NationalAmount Annotations

        public int NationalAmount { get; set; }

		#region ApplicationObjectId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ApplicationObjectId Annotations

        public ApplicationObject ApplicationObjectId { get; set; }

		#region OrderDetails Annotations

        [InverseProperty("ShippingFeeDetail")]
		#endregion OrderDetails Annotations

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }


        public ShippingFeeDetail()
        {
			OrderDetails = new HashSet<OrderDetail>();
        }
	}
}