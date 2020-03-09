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
    [Table("MusicCategories",Schema="dbo")]
    public partial class MusicCategory
    {
		#region MusicCategoryId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion MusicCategoryId Annotations

        public int MusicCategoryId { get; set; }

		#region MusicCategoryName Annotations

        [Required]
        [MaxLength(20)]
		#endregion MusicCategoryName Annotations

        public string MusicCategoryName { get; set; }


        public MusicCategory()
        {
        }
	}
}