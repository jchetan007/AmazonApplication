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
    [Table("Otps",Schema="dbo")]
    public partial class Otp
    {
		#region OtpId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion OtpId Annotations

        public int OtpId { get; set; }

		#region OtpNumber Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion OtpNumber Annotations

        public int OtpNumber { get; set; }

		#region ValidFrom Annotations

        [Required]
		#endregion ValidFrom Annotations

        public System.DateTimeOffset ValidFrom { get; set; }

		#region ValidTill Annotations

        [Required]
		#endregion ValidTill Annotations

        public System.DateTimeOffset ValidTill { get; set; }

		#region MobileNumber Annotations

        [Required]
        [MaxLength(20)]
		#endregion MobileNumber Annotations

        public string MobileNumber { get; set; }


        public Otp()
        {
        }
	}
}