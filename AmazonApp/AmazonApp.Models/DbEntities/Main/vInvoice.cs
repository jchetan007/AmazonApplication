using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vInvoices",Schema="dbo")]
    public partial class vInvoice
    {
		#region InvoiceId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion InvoiceId Annotations

        public int InvoiceId { get; set; }


        public System.DateTimeOffset InvoiceDate { get; set; }


        public string AppUserName { get; set; }


        public string CompanyName { get; set; }


        public string ProductName { get; set; }


        public long OriginalProductPrice { get; set; }


        public long DiscountProductPrice { get; set; }


        public int ProductQuantity { get; set; }


        public System.DateTimeOffset CreatedDate { get; set; }


        public Nullable<int> CartValue { get; set; }


        public vInvoice()
        {
        }
	}
}