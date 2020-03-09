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
    public class CartContext : BaseBoundedContext, ICartContext
    {
        public CartContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<CartItem> CartItem { get; set; }
		public DbSet<Cart> Cart { get; set; }
		public DbSet<vCartItem> vCartItem { get; set; }
            		public DbSet<CartItem> CartItem { get; set; }
            #endregion DbSets



    }


    public interface ICartContext : IDbContext
    {
    }
}

