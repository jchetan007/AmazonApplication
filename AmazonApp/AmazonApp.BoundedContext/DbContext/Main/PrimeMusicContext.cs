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
    public class PrimeMusicContext : BaseBoundedContext, IPrimeMusicContext
    {
        public PrimeMusicContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<PrimeMusic> PrimeMusic { get; set; }
		public DbSet<Music> Music { get; set; }
		public DbSet<MusicSubCategory> MusicSubCategory { get; set; }
            		
            		
            		public DbSet<MusicCategory> MusicCategory { get; set; }
            		
            		public DbSet<vMusic> vMusic { get; set; }
            #endregion DbSets






    }


    public interface IPrimeMusicContext : IDbContext
    {
    }
}

