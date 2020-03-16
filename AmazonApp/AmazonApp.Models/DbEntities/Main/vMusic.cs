using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vMusics",Schema="dbo")]
    public partial class vMusic
    {
		#region MusicId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion MusicId Annotations

        public int MusicId { get; set; }


        public string MusicName { get; set; }


        public string AlbumName { get; set; }


        public string ArtistName { get; set; }


        public int MusicSubCategoryId { get; set; }


        public string CategoryName { get; set; }


        public string MusicCategoryName { get; set; }


        public vMusic()
        {
        }
	}
}