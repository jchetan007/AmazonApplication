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
    [Table("Musics",Schema="dbo")]
    public partial class Music
    {
		#region MusicId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion MusicId Annotations

        public int MusicId { get; set; }

		#region MusicName Annotations

        [Required]
        [MaxLength(20)]
		#endregion MusicName Annotations

        public string MusicName { get; set; }

		#region MusicSubCategoryId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("MusicSubCategories","dbo","","MusicSubCategoryId")]
		#endregion MusicSubCategoryId Annotations

        public int MusicSubCategoryId { get; set; }

		#region AlbumName Annotations

        [Required]
        [MaxLength(20)]
		#endregion AlbumName Annotations

        public string AlbumName { get; set; }

		#region ArtistName Annotations

        [Required]
        [MaxLength(20)]
		#endregion ArtistName Annotations

        public string ArtistName { get; set; }

		#region MusicSubCategory Annotations

        [ForeignKey(nameof(MusicSubCategoryId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.MusicSubCategory.Musics))]
		#endregion MusicSubCategory Annotations

        public virtual MusicSubCategory MusicSubCategory { get; set; }


        public Music()
        {
        }
	}
}