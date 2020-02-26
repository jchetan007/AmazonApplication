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
    [Table("FeedBacks",Schema="dbo")]
    public partial class FeedBack
    {
		#region FeedBackId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion FeedBackId Annotations

        public int FeedBackId { get; set; }

		#region Comment Annotations

        [MaxLength(50)]
		#endregion Comment Annotations

        public string Comment { get; set; }


        public byte[] Image { get; set; }

		#region Ratings Annotations

        [Required]
		#endregion Ratings Annotations

        public double Ratings { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region ProductId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Products","dbo","","ProductId")]
		#endregion ProductId Annotations

        public int ProductId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.FeedBacks))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region Product Annotations

        [ForeignKey(nameof(ProductId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Product.FeedBacks))]
		#endregion Product Annotations

        public virtual Product Product { get; set; }


        public FeedBack()
        {
        }
	}
}