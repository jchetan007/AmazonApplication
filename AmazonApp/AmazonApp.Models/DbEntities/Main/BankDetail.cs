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
    [Table("BankDetails",Schema="dbo")]
    public partial class BankDetail
    {
		#region BankDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion BankDetailId Annotations

        public int BankDetailId { get; set; }

		#region AccountHolderName Annotations

        [Required]
        [MaxLength(50)]
		#endregion AccountHolderName Annotations

        public string AccountHolderName { get; set; }

		#region AccountType Annotations

        [Required]
        [MaxLength(50)]
		#endregion AccountType Annotations

        public string AccountType { get; set; }

		#region AccountNumber Annotations

        [Required]
        [MaxLength(20)]
		#endregion AccountNumber Annotations

        public string AccountNumber { get; set; }


        public Nullable<double> Balance { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.BankDetails))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region Sellers Annotations

        [InverseProperty("BankDetail")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public BankDetail()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}