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
    [Table("Transactions",Schema="dbo")]
    public partial class Transaction
    {
		#region TransactionId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion TransactionId Annotations

        public int TransactionId { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region SellerId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Sellers","dbo","","SellerId")]
		#endregion SellerId Annotations

        public int SellerId { get; set; }

		#region Amount Annotations

        [Required]
		#endregion Amount Annotations

        public double Amount { get; set; }

		#region ApplicationObjectId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ApplicationObjectId Annotations

        public ApplicationObject ApplicationObjectId { get; set; }

		#region TransactionDate Annotations

        [Required]
		#endregion TransactionDate Annotations

        public System.DateTime TransactionDate { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.Transactions))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region Seller Annotations

        [ForeignKey(nameof(SellerId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Seller.Transactions))]
		#endregion Seller Annotations

        public virtual Seller Seller { get; set; }


        public Transaction()
        {
        }
	}
}