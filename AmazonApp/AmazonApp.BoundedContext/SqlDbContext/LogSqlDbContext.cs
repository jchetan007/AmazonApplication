using AmazonApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using RxWeb.Core.Data;
using RxWeb.Core.Data.BoundedContext;
using RxWeb.Core.Data.Models;
using System;

namespace AmazonApp.BoundedContext.SqlContext
{
    public class LogSqlDbContext : BaseDbContext, ILogDatabaseFacade, IDisposable
    {
        public LogSqlDbContext(IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor, ITenantDbConnectionInfo tenantDbConnection) : base(databaseConfig, contextAccessor, tenantDbConnection) { }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(this.GetConnection("Log"));

            base.OnConfiguring(optionsBuilder);
        }
    }
}
