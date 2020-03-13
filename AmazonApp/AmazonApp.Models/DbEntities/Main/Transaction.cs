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

		#region SellerDetailId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("SellerDetails","dbo","","SellerDetailId")]
		#endregion SellerDetailId Annotations

        public int SellerDetailId { get; set; }

		#region Amount Annotations

        [Required]
		#endregion Amount Annotations

        public double Amount { get; set; }

		#region TransactionDate Annotations

        [Required]
		#endregion TransactionDate Annotations

        public System.DateTime TransactionDate { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.Transactions))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region SellerDetail Annotations

        [ForeignKey(nameof(SellerDetailId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.SellerDetail.Transactions))]
		#endregion SellerDetail Annotations

        public virtual SellerDetail SellerDetail { get; set; }

		#region Orders Annotations

        [InverseProperty("Transaction")]
		#endregion Orders Annotations

        public virtual ICollection<Order> Orders { get; set; }


        public Transaction()
        {
			Orders = new HashSet<Order>();
        }
	}
}