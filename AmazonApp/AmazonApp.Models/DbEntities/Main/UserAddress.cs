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
    [Table("UserAddresses",Schema="dbo")]
    public partial class UserAddress
    {
		#region UserAddressId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserAddressId Annotations

        public int UserAddressId { get; set; }

		#region HouseNumber Annotations

        [MaxLength(50)]
		#endregion HouseNumber Annotations

        public string HouseNumber { get; set; }

		#region Area Annotations

        [MaxLength(50)]
		#endregion Area Annotations

        public string Area { get; set; }

		#region Landmark Annotations

        [MaxLength(50)]
		#endregion Landmark Annotations

        public string Landmark { get; set; }

		#region City Annotations

        [Required]
        [MaxLength(50)]
		#endregion City Annotations

        public string City { get; set; }

		#region State Annotations

        [Required]
        [MaxLength(20)]
		#endregion State Annotations

        public string State { get; set; }

		#region AddressType Annotations

        [Required]
        [MaxLength(50)]
		#endregion AddressType Annotations

        public string AddressType { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.UserAddresses))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }


        public UserAddress()
        {
        }
	}
}