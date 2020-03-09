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
    [Table("CartItems",Schema="dbo")]
    public partial class CartItem
    {
		#region CartItemId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion CartItemId Annotations

        public int CartItemId { get; set; }

		#region ProductId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Products","dbo","","ProductId")]
		#endregion ProductId Annotations

        public int ProductId { get; set; }

		#region ProductQuantity Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ProductQuantity Annotations

        public int ProductQuantity { get; set; }


        public Nullable<int> TotalPrice { get; set; }


        public Nullable<int> CartQuantity { get; set; }


        public Nullable<int> CartValue { get; set; }

		#region AppUserId Annotations

        [RelationshipTableAttribue("AppUsers","dbo","","AppUserId")]
		#endregion AppUserId Annotations

        public Nullable<int> AppUserId { get; set; }

		#region AppUser Annotations

        [ForeignKey(nameof(AppUserId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.AppUser.CartItems))]
		#endregion AppUser Annotations

        public virtual AppUser AppUser { get; set; }

		#region Product Annotations

        [ForeignKey(nameof(ProductId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Product.CartItems))]
		#endregion Product Annotations

        public virtual Product Product { get; set; }

		#region OrderDetails Annotations

        [InverseProperty("CartItem")]
		#endregion OrderDetails Annotations

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }


        public CartItem()
        {
			OrderDetails = new HashSet<OrderDetail>();
        }
	}
}