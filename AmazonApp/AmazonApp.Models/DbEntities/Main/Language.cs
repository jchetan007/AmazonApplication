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
    [Table("Languages",Schema="dbo")]
    public partial class Language
    {
		#region LanguageId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion LanguageId Annotations

        public int LanguageId { get; set; }

		#region LanguageName Annotations

        [Required]
        [MaxLength(20)]
		#endregion LanguageName Annotations

        public string LanguageName { get; set; }

		#region Sellers Annotations

        [InverseProperty("Language")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }


        public Language()
        {
			Sellers = new HashSet<Seller>();
        }
	}
}