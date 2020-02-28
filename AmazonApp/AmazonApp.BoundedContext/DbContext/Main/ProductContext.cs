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
    public class ProductContext : BaseBoundedContext, IProductContext
    {
        public ProductContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<Product> Product { get; set; }
		public DbSet<ProductCategory> ProductCategory { get; set; }
		public DbSet<ProductSubCategory> ProductSubCategory { get; set; }
		public DbSet<Discount> Discount { get; set; }
		public DbSet<Brand> Brand { get; set; }
		public DbSet<Size> Size { get; set; }
		public DbSet<Color> Color { get; set; }
		public DbSet<Material> Material { get; set; }
		public DbSet<Language> Language { get; set; }
	
		public DbSet<vProductCategoryLookup> vProductCategoryLookup { get; set; }
            #endregion DbSets


    }


    public interface IProductContext : IDbContext
    {
    }
}

