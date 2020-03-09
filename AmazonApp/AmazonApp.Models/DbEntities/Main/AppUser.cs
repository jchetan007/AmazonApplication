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
    [Table("AppUsers",Schema="dbo")]
    public partial class AppUser
    {
		#region AppUserId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion AppUserId Annotations

        public int AppUserId { get; set; }

		#region AppUserName Annotations

        [Required]
        [MaxLength(20)]
		#endregion AppUserName Annotations

        public string AppUserName { get; set; }

		#region MobileNumber Annotations

        [Required]
        [MaxLength(20)]
		#endregion MobileNumber Annotations

        public string MobileNumber { get; set; }

		#region EmailId Annotations

        [Required]
        [MaxLength(50)]
		#endregion EmailId Annotations

        public string EmailId { get; set; }

		#region Password Annotations

        [Required]
        [MaxLength(132)]
		#endregion Password Annotations

        public byte[] Password { get; set; }

		#region CreatedDate Annotations

        [Required]
		#endregion CreatedDate Annotations

        public System.DateTimeOffset CreatedDate { get; set; }

		#region RoleId Annotations

        [RelationshipTableAttribue("Roles","dbo","","RoleId")]
		#endregion RoleId Annotations

        public Nullable<int> RoleId { get; set; }

		#region Salt Annotations

        [MaxLength(140)]
		#endregion Salt Annotations

        public byte[] Salt { get; set; }

		#region Role Annotations

        [ForeignKey(nameof(RoleId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Role.AppUsers))]
		#endregion Role Annotations

        public virtual Role Role { get; set; }

		#region PrimeMusics Annotations

        [InverseProperty("AppUser")]
		#endregion PrimeMusics Annotations

        public virtual ICollection<PrimeMusic> PrimeMusics { get; set; }

		#region Sellers Annotations

        [InverseProperty("AppUser")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }

		#region Transactions Annotations

        [InverseProperty("AppUser")]
		#endregion Transactions Annotations

        public virtual ICollection<Transaction> Transactions { get; set; }

		#region CartItems Annotations

        [InverseProperty("AppUser")]
		#endregion CartItems Annotations

        public virtual ICollection<CartItem> CartItems { get; set; }

		#region BankDetails Annotations

        [InverseProperty("AppUser")]
		#endregion BankDetails Annotations

        public virtual ICollection<BankDetail> BankDetails { get; set; }

		#region Orders Annotations

        [InverseProperty("AppUser")]
		#endregion Orders Annotations

        public virtual ICollection<Order> Orders { get; set; }

		#region Cards Annotations

        [InverseProperty("AppUser")]
		#endregion Cards Annotations

        public virtual ICollection<Card> Cards { get; set; }

		#region UserAddresses Annotations

        [InverseProperty("AppUser")]
		#endregion UserAddresses Annotations

        public virtual ICollection<UserAddress> UserAddresses { get; set; }

		#region FeedBacks Annotations

        [InverseProperty("AppUser")]
		#endregion FeedBacks Annotations

        public virtual ICollection<FeedBack> FeedBacks { get; set; }


        public AppUser()
        {
			PrimeMusics = new HashSet<PrimeMusic>();
			Sellers = new HashSet<Seller>();
			Transactions = new HashSet<Transaction>();
			CartItems = new HashSet<CartItem>();
			BankDetails = new HashSet<BankDetail>();
			Orders = new HashSet<Order>();
			Cards = new HashSet<Card>();
			UserAddresses = new HashSet<UserAddress>();
			FeedBacks = new HashSet<FeedBack>();
        }
	}
}