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
    [Table("PrimeMusics",Schema="dbo")]
    public partial class PrimeMusic
    {
		#region PrimeMusicId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PrimeMusicId Annotations

        public int PrimeMusicId { get; set; }

		#region ValidFrom Annotations

        [Required]
		#endregion ValidFrom Annotations

        public System.DateTimeOffset ValidFrom { get; set; }

		#region ValidTill Annotations

        [Required]
		#endregion ValidTill Annotations

        public System.DateTimeOffset ValidTill { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.PrimeMusics))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region MusicSubCategories Annotations

        [InverseProperty("PrimeMusic")]
		#endregion MusicSubCategories Annotations

        public virtual ICollection<MusicSubCategory> MusicSubCategories { get; set; }


        public PrimeMusic()
        {
			MusicSubCategories = new HashSet<MusicSubCategory>();
        }
	}
}