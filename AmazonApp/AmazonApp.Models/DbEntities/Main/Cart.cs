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
    [Table("Carts",Schema="dbo")]
    public partial class Cart
    {
		#region CartId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion CartId Annotations

        public int CartId { get; set; }


        public Nullable<int> CartValue { get; set; }

		#region AppUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.CartItems))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region OrderDetails Annotations

        [InverseProperty("Cart")]
		#endregion OrderDetails Annotations

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

		#region CartItems Annotations

        [InverseProperty("Cart")]
		#endregion CartItems Annotations

        public virtual ICollection<CartItem> CartItems { get; set; }


        public Cart()
        {
			OrderDetails = new HashSet<OrderDetail>();
			CartItems = new HashSet<CartItem>();
        }
	}
}