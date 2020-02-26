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
    [Table("Payments",Schema="dbo")]
    public partial class Payment
    {
		#region PaymentId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PaymentId Annotations

        public int PaymentId { get; set; }

		#region Amount Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion Amount Annotations

        public int Amount { get; set; }

		#region PaymentDate Annotations

        [Required]
		#endregion PaymentDate Annotations

        public System.DateTimeOffset PaymentDate { get; set; }

		#region OrderId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Orders","dbo","","OrderId")]
		#endregion OrderId Annotations

        public int OrderId { get; set; }

		#region ApplicationObjectId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ApplicationObjectId Annotations

        public ApplicationObject ApplicationObjectId { get; set; }

		#region Order Annotations

        [ForeignKey(nameof(OrderId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Order.Payments))]
		#endregion Order Annotations

        public virtual Order Order { get; set; }

		#region Invoices Annotations

        [InverseProperty("Payment")]
		#endregion Invoices Annotations

        public virtual ICollection<Invoice> Invoices { get; set; }


        public Payment()
        {
			Invoices = new HashSet<Invoice>();
        }
	}
}