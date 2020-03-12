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
    public class PaymentContext : BaseBoundedContext, IPaymentContext
    {
        public PaymentContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            		public DbSet<Card> Card { get; set; }
		public DbSet<Payment> Payment { get; set; }
		public DbSet<PromoCode> PromoCode { get; set; }
		public DbSet<Transaction> Transaction { get; set; }
            		
            	
            
            		public DbSet<vPromoCode> vPromoCode { get; set; }
            #endregion DbSets






    }


    public interface IPaymentContext : IDbContext
    {
    }
}

