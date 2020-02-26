using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vAdvertisements",Schema="dbo")]
    public partial class vAdvertisement
    {
		#region AdvertisementId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion AdvertisementId Annotations

        public int AdvertisementId { get; set; }


        public int OfferPercentage { get; set; }


        public int DiscountPrice { get; set; }


        public vAdvertisement()
        {
        }
	}
}