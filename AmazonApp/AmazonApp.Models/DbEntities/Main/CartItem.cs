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

		#region CartId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Carts","dbo","","CartId")]
		#endregion CartId Annotations

        public int CartId { get; set; }

		#region ProductQuantity Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion ProductQuantity Annotations

        public int ProductQuantity { get; set; }

		#region TotalPrice Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion TotalPrice Annotations

        public int TotalPrice { get; set; }

		#region CartQuantity Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion CartQuantity Annotations

        public int CartQuantity { get; set; }

		#region Cart Annotations

        [ForeignKey(nameof(CartId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Cart.CartItems))]
		#endregion Cart Annotations

        public virtual Cart Cart { get; set; }

		#region Product Annotations

        [ForeignKey(nameof(ProductId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Product.CartItems))]
		#endregion Product Annotations

        public virtual Product Product { get; set; }


        public CartItem()
        {
        }
	}
}