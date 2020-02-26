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
    [Table("MusicSubCategories",Schema="dbo")]
    public partial class MusicSubCategory
    {
		#region MusicSubCategoryId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion MusicSubCategoryId Annotations

        public int MusicSubCategoryId { get; set; }

		#region PrimeMusicId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("PrimeMusics","dbo","","PrimeMusicId")]
		#endregion PrimeMusicId Annotations

        public int PrimeMusicId { get; set; }

		#region CategoryName Annotations

        [Required]
        [MaxLength(50)]
		#endregion CategoryName Annotations

        public string CategoryName { get; set; }

		#region ApplicationObjectId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ApplicationObjectId Annotations

        public ApplicationObject ApplicationObjectId { get; set; }

		#region PrimeMusic Annotations

        [ForeignKey(nameof(PrimeMusicId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.PrimeMusic.MusicSubCategories))]
		#endregion PrimeMusic Annotations

        public virtual PrimeMusic PrimeMusic { get; set; }

		#region Musics Annotations

        [InverseProperty("MusicSubCategory")]
		#endregion Musics Annotations

        public virtual ICollection<Music> Musics { get; set; }


        public MusicSubCategory()
        {
			Musics = new HashSet<Music>();
        }
	}
}