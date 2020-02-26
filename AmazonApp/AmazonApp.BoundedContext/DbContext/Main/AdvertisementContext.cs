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
    public class AdvertisementContext : BaseBoundedContext, IAdvertisementContext
    {
        public AdvertisementContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<Advertisement> Advertisement { get; set; }
		public DbSet<Offer> Offer { get; set; }
		public DbSet<vAdvertisement> vAdvertisement { get; set; }
            #endregion DbSets


    }


    public interface IAdvertisementContext : IDbContext
    {
    }
}

