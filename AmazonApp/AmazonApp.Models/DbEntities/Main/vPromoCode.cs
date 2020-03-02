using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vPromoCodes",Schema="dbo")]
    public partial class vPromoCode
    {

        public string PromoCodeName { get; set; }

		#region Amount Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion Amount Annotations

        public int Amount { get; set; }


        public int CartValue { get; set; }


        public int CartId { get; set; }


        public vPromoCode()
        {
        }
	}
}