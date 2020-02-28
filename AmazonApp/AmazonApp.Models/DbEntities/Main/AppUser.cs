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

        [MaxLength(132)]
		#endregion Password Annotations

        public byte[] Password { get; set; }

		#region CreatedDate Annotations

        [Required]
		#endregion CreatedDate Annotations

        public System.DateTimeOffset CreatedDate { get; set; }

		#region RoleId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Roles","dbo","","RoleId")]
		#endregion RoleId Annotations

        public int RoleId { get; set; }

		#region Salt Annotations

        [MaxLength(140)]
		#endregion Salt Annotations

        public byte[] Salt { get; set; }

		#region Role Annotations

        [ForeignKey(nameof(RoleId))]
        [InverseProperty(nameof(AmazonApp.Models.Main.Role.AppUsers))]
		#endregion Role Annotations

        public virtual Role Role { get; set; }

		#region FeedBacks Annotations

        [InverseProperty("AppUser")]
		#endregion FeedBacks Annotations

        public virtual ICollection<FeedBack> FeedBacks { get; set; }

		#region Sellers Annotations

        [InverseProperty("AppUser")]
		#endregion Sellers Annotations

        public virtual ICollection<Seller> Sellers { get; set; }

		#region Otps Annotations

        [InverseProperty("AppUser")]
		#endregion Otps Annotations

        public virtual ICollection<Otp> Otps { get; set; }

		#region PrimeMusics Annotations

        [InverseProperty("AppUser")]
		#endregion PrimeMusics Annotations

        public virtual ICollection<PrimeMusic> PrimeMusics { get; set; }

		#region UserAddresses Annotations

        [InverseProperty("AppUser")]
		#endregion UserAddresses Annotations

        public virtual ICollection<UserAddress> UserAddresses { get; set; }

		#region Transactions Annotations

        [InverseProperty("AppUser")]
		#endregion Transactions Annotations

        public virtual ICollection<Transaction> Transactions { get; set; }

		#region Carts Annotations

        [InverseProperty("AppUser")]
		#endregion Carts Annotations

        public virtual ICollection<Cart> Carts { get; set; }

		#region BankDetails Annotations

        [InverseProperty("AppUser")]
		#endregion BankDetails Annotations

        public virtual ICollection<BankDetail> BankDetails { get; set; }

		#region SellerDetails Annotations

        [InverseProperty("AppUser")]
		#endregion SellerDetails Annotations

        public virtual ICollection<SellerDetail> SellerDetails { get; set; }

		#region Orders Annotations

        [InverseProperty("AppUser")]
		#endregion Orders Annotations

        public virtual ICollection<Order> Orders { get; set; }

		#region Cards Annotations

        [InverseProperty("AppUser")]
		#endregion Cards Annotations

        public virtual ICollection<Card> Cards { get; set; }


        public AppUser()
        {
			FeedBacks = new HashSet<FeedBack>();
			Sellers = new HashSet<Seller>();
			Otps = new HashSet<Otp>();
			PrimeMusics = new HashSet<PrimeMusic>();
			UserAddresses = new HashSet<UserAddress>();
			Transactions = new HashSet<Transaction>();
			Carts = new HashSet<Cart>();
			BankDetails = new HashSet<BankDetail>();
			SellerDetails = new HashSet<SellerDetail>();
			Orders = new HashSet<Order>();
			Cards = new HashSet<Card>();
        }
	}
}