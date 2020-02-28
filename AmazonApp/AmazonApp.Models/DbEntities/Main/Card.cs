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
    [Table("Cards",Schema="dbo")]
    public partial class Card
    {
		#region CardId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion CardId Annotations

        public int CardId { get; set; }

		#region CardNumber Annotations

        [Required]
        [MaxLength(20)]
		#endregion CardNumber Annotations

        public string CardNumber { get; set; }

		#region CardType Annotations

        [Required]
        [MaxLength(50)]
		#endregion CardType Annotations

        public string CardType { get; set; }

		#region ExpiryDate Annotations

        [Required]
        [MaxLength(50)]
		#endregion ExpiryDate Annotations

        public string ExpiryDate { get; set; }

		#region Cvv Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion Cvv Annotations

        public int Cvv { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.Cards))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }


        public Card()
        {
        }
	}
}