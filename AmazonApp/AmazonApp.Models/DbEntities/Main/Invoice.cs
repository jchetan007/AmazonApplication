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
    [Table("Invoices",Schema="dbo")]
    public partial class Invoice
    {
		#region InvoiceId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion InvoiceId Annotations

        public int InvoiceId { get; set; }

		#region PaymentId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Payments","dbo","","PaymentId")]
		#endregion PaymentId Annotations

        public int PaymentId { get; set; }

		#region InvoiceDate Annotations

        [Required]
		#endregion InvoiceDate Annotations

        public System.DateTimeOffset InvoiceDate { get; set; }

		#region Payment Annotations

        [ForeignKey(nameof(PaymentId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Payment.Invoices))]
		#endregion Payment Annotations

        public virtual Payment Payment { get; set; }


        public Invoice()
        {
        }
	}
}