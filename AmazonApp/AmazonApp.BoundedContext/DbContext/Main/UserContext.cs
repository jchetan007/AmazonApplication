using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using AmazonApp.BoundedContext.SqlContext;
using AmazonApp.Models.Main;
using AmazonApp.Models;
using AmazonApp.BoundedContext.Singleton;
using RxWeb.Core.Data;
using RxWeb.Core.Data.Models;
using RxWeb.Core.Data.BoundedContext;

namespace AmazonApp.BoundedContext.Main
{
    public class UserContext : BaseBoundedContext, IUserContext
    {
        public UserContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<AppUser> AppUser { get; set; }
		public DbSet<FeedBack> FeedBack { get; set; }
		public DbSet<Otp> Otp { get; set; }
		public DbSet<BankDetail> BankDetail { get; set; }
            		public DbSet<UserAddress> UserAddress { get; set; }
            		
            #endregion DbSets





    }


    public interface IUserContext : IDbContext
    {
    }
}

