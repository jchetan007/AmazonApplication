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
    [Table("Advertisements",Schema="dbo")]
    public partial class Advertisement
    {
		#region AdvertisementId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion AdvertisementId Annotations

        public int AdvertisementId { get; set; }


        public byte[] Image { get; set; }

		#region OfferId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Offers","dbo","","OfferId")]
		#endregion OfferId Annotations

        public int OfferId { get; set; }

		#region ApplicationObjectId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ApplicationObjectId Annotations

        public ApplicationObject ApplicationObjectId { get; set; }

		#region Offer Annotations

        [ForeignKey(nameof(OfferId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Offer.Advertisements))]
		#endregion Offer Annotations

        public virtual Offer Offer { get; set; }


        public Advertisement()
        {
        }
	}
}